#!/usr/bin/env bash
#
# A script for customizing Fira Code font.

# ===============================
# Please change stylistic sets here
SS=ss01,ss03,ss05,ss06,zero,cv15
# ===============================
# the temporary folder name
TMP_DIR="Baking"
# the original font file url
URL=$(curl -s https://api.github.com/repos/tonsky/FiraCode/releases/latest | \
  grep "browser_download_url" | cut -d '"' -f 4)
# Custom font sufix
SUFIX="Custom"
# Output folder
OPUT_DIR="FiraCode-Custom"


# Install requirements
if ! command -v curl > /dev/null 2>&1 && [ "$(uname -s)" == "Linux" ]; then
  sudo apt install curl python3-venv
fi

# Create a temp folder
if [ ! -d "${TMP_DIR}" ]; then
  echo "Create '${TMP_DIR}' folder..."
  mkdir ${TMP_DIR} && cd ${TMP_DIR} || exit

  # Download and extract original Fira Code file
  if [ ! -e "FiraCode.zip" ]; then
    echo "Download the original Fira Code file..."
    curl -LJ "${URL}" > "FiraCode.zip"
  fi
  echo "Extract 'FiraCode.zip'..."
  unzip -q "FiraCode.zip"
  echo "Delete unnecessary files..."
  rm fira_code.css README.txt specimen.html
  rm -rf woff/ woff2/

  # Create a python virtual environment
  echo "Create a python virtual environment..."
  python3 -m venv venv
  # shellcheck source=/dev/null
  source ./venv/bin/activate
  # Install OpenType Feature Freezer
  if ! command -v pyftfeatfreeze > /dev/null 2>&1; then
    echo "Install OpenType Feature Freezer..."
    pip3 install --upgrade opentype-feature-freezer
  fi
  # Customize fonts
  mkdir -p "${OPUT_DIR}/ttf"
  echo "Customize fonts..."
  # ttf fonts
  for file in ttf/*.ttf; do
    echo "Process ${file}..."
    pyftfeatfreeze -f "${SS}" -S -U "${SUFIX}" "${file}" "${file%.*}-${SUFIX}.ttf"
  done
  # variable fonts
  for file in variable_ttf/*.ttf; do
    echo "Process ${file}..."
    pyftfeatfreeze -f "${SS}" -S -U "${SUFIX}" "${file}" "${file%.*}-${SUFIX}.ttf"
  done 
  mv ./ttf/*${SUFIX}.ttf "${OPUT_DIR}/ttf"
  mv ./variable_ttf/*${SUFIX}.ttf "${OPUT_DIR}"
  zip -q -r "../${OPUT_DIR}.zip" "${OPUT_DIR}"
  rm -rf ttf/ "${OPUT_DIR}"
  # Exit virtual env
  echo "Finish and deactivating..."
  deactivate

  # Delete the tmp folder
  echo "Delete the temp folder..."
  cd .. && rm -rf ${TMP_DIR}
else
  echo "Folder '${TMP_DIR}' exists, abort..."
  exit 1
fi
