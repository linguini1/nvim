# linguini Neovim Config

Clone this repository on your system's nvim runtime path. For Windows, this is located on in `Users/<user>/AppData/Local/nvim` (cloning in the `Local` directory will create the nvim directory)

## Fonts
In order to have the correct font, install the [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
from nerdfonts.

Disable ligatures in the terminal's font settings using `font.features.calt = 0` within the `settings.json` file
for the Windows terminal. This should be done under the default profiles.

## Terminal Colours
The terminal colours are recommended to match this config's theme, **gruvbox**, for best results.

## Compiler
The Clang compiler is required in order to compile some dependencies of this config.

## Features to be added

- Auto-install formatters

### Snippets
- Auto-fill `self` parameter when function is created inside a Python class
    - Do not auto-fill `self` parameter when `@staticmethod` decorator is used.
- Auto-fill `cls` paramter when a function is created with the `@classmethod` decorator in Python
