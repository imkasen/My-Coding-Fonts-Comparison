#!/usr/bin/env bash
# A script for customizing Fira Code font.

# ===============================
# Please change stylistic sets here
SS="ss01,ss03,ss05,ss06,zero,cv15"
# font family name
FN="FiraCode Custom"
# Custom font suffix
SUFFIX="Custom"
# Output folder
OPUTDIR="FiraCode Custom"
# ===============================

# Please install git and docker first

set -Eeuo pipefail  # fail fast

# 1. Clone Fira Code repository
clear
cd ~ || exit 
if [[ ! -d FiraCode ]]; then
    echo "Clone FiraCode repository..."
    git clone git@github.com:tonsky/FiraCode.git  
fi

# 2. Build locally
clear
cd FiraCode || exit
echo "Build locally..."
if [[ -d distr ]]; then
    sudo rm -rf distr
fi
docker run --rm -v "${PWD}":/opt tonsky/firacode:latest ./script/build.sh -f "${SS}" -n "${FN}"

# 3. Rename and pack
clear
cd ~ || exit
echo "Rename and pack files..."
if [[ -d ${OPUTDIR} ]]; then
    rm -rf "${OPUTDIR}"
fi
# generated fonts are in the "FiraCode/distr/" folder, which contains "ttf, variable ttf, woff, woff2" folders
cp -r FiraCode/distr/ttf/"${FN}" "${OPUTDIR}" 
for file in "${OPUTDIR}"/*.ttf; do
    mv "${file}" "${file%.*}-${SUFFIX}.ttf"
done
# compress files
if zip --help &> /dev/null; then
    zip -q -r "${OPUTDIR}.zip" "${OPUTDIR}"
else
    tar -cf "${OPUTDIR}.tar" "${OPUTDIR}"
fi
rm -rf "${OPUTDIR}"
rm -rf FiraCode
docker rmi tonsky/firacode:latest
clear
echo "A compressed file of '${OPUTDIR}' has been generated."
