# My Coding Fonts Configuration

Current font configuration:

* IDE / Editor: Fira Code Custom
* Terminal: Caskaydia Cove Nerd Font
* Chinese: Noto Sans SC

## Fira Code Stylistic Sets

### [VS Code Settings](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions)

#### Option 1: Use the Custom Font

* `"editor.fontFamily": "'Fira Code Custom', ..."`
* `"editor.fontLigatures": true`

#### Option 2: Use the Default Font

* `"editor.fontFamily": "'Fira Code', ..."`
* `"editor.fontLigatures": "'ss01', 'ss03', 'ss05', 'ss06', 'zero', 'cv15'"`

### Custom Baking

#### Docker

1. Run `firacode/custom.sh`, which requires **git** and **docker** pre-installed.

   ``` Bash
   # default
   curl -fsL https://raw.githubusercontent.com/imkasen/my-coding-fonts-config/master/firacode/custom.sh | bash
   # fastgit
   curl -fsL https://raw.fastgit.org/imkasen/my-coding-fonts-config/master/firacode/custom.sh | bash
   ```

#### ~~Script~~

1. Run `firacode/custom-deprecated.sh`

   ``` Bash
   # default
   curl -fsL https://raw.githubusercontent.com/imkasen/my-coding-fonts-config/master/firacode/custom-deprecated.sh | bash
   ```

#### ~~Manually~~

1. Create a python virtual environment
2. Install [OpenType Feature Freezer](https://github.com/twardoch/fonttools-opentype-feature-freezer) : `pip install --upgrade opentype-feature-freezer`
3. Execute `pyftfeatfreeze -n -v -f 'ss01,ss03,ss05,ss06,zero,cv15' -S -U Custom FiraCode-xxx.ttf FiraCode-xxx-Custom.ttf`
   * *ss06(`\\`) seems not working after testing, and maybe this [issue](https://github.com/twardoch/fonttools-opentype-feature-freezer/issues/20) can explain the problem.*
