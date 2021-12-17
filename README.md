# My Coding Fonts Comparison

A comparison of some of my commonly used programming fonts.

## Update

Current font configuration:

* IDE / Editor: Fira Code Custom
* Terminal: Caskaydia Cove Nerd Font
* Chinese: Noto Sans SC

## Fira Code Stylistic Sets

### VS Code

* `"editor.fontFamily": "'Fira Code', ..."`
* `"editor.fontLigatures": "'ss01', 'ss03', 'ss05', 'ss06', 'zero', 'cv15'"`

### Baking 

#### Manually

1. Create a python virtual environment
2. Install [OpenType Feature Freezer](https://github.com/twardoch/fonttools-opentype-feature-freezer) : `pip install --upgrade opentype-feature-freezer`
3. Execute `pyftfeatfreeze -n -v -f 'ss01,ss03,ss05,ss06,zero,cv15' -S -U Custom FiraCode-xxx.ttf FiraCode-xxx-Custom.ttf`
   * *ss06(`\\`) seems not working after testing, and maybe this [issue](https://github.com/twardoch/fonttools-opentype-feature-freezer/issues/20) can explain the problem.*

#### Script

1. run `custom.sh` in Linux terminal.

## Old Description

*I've been using **Source Code Pro** as the coding font for the past few years, but since it doesn't support ligatures, I recently started trying to replace it with **Fira Code**. I've also tried **JetBrains Mono** and **Cascadia Code** before, but since I like thin fonts and these two fonts are slightly thick, I didn't use them as IDE and editor fonts. But for the command-line interface, I choose to use **Cascadia Code PL**...*
