# linguini nvim

Clone this repository on your system's nvim runtime path. For Windows, this is located in
`Users/<user>/AppData/Local/nvim` (cloning in the `Local` directory will create the nvim directory)

## Fonts
In order to have the correct font, install the [JetBrains Mono Nerd Font][nerd-fonts] from nerdfonts.

Disable ligatures in the terminal's font settings using `font.features.calt = 0` within the `settings.json` file
for the Windows terminal. This should be done under the default profiles.

## Terminal Colours
The terminal colours are recommended to match this config's theme, **gruvbox hard**, for best results. You can find the
hex colour codes [here][]

## Compiler
The clang compiler is required in order to compile some dependencies of this config, and to ensure integration for C/C++
development.

### Windows
Install [LLVM][llvm], the`win64.exe` installer.
Install make via chocolatey: `choco install make`

In order to avoid using Visual Studio, please install [Mingw64][mingw]. You will want to select the `x86_64-seh-msvcrt`
version. An extra compiler flag will have to be used in order to compile programs, see [here][compiler-workaround].

### Clangd Nuances
Because clangd requires a `compiler_commands.json` file in order to perform checks accurately, an additional dependency
must be installed to generate this file from Makefile commands (Cmake does this automatically but Makefiles do not).

Many Linux users suggest using [Bear][bear]. On Windows, I found it easiest to use [compiledb][compiledb], a Python
package that works similarly right out of the box. Install it globally with pip and you can generate the compile 
commands from a Makefile.

## Features to be added

- Auto-install formatters

### Snippets
- Auto-fill `self` parameter when function is created inside a Python class
    - Do not auto-fill `self` parameter when `@staticmethod` decorator is used.
- Auto-fill `cls` paramter when a function is created with the `@classmethod` decorator in Python

[nerd-fonts]: https://www.nerdfonts.com/font-downloads
[gruvbox]: https://github.com/morhetz/gruvbox
[compiler-workaround]: https://www.nerdfonts.com/font-downloads
[llvm]: https://github.com/llvm/llvm-project/releases
[mingw]: https://github.com/niXman/mingw-builds-binaries/releases
[bear]: https://github.com/rizsotto/Bear
[compiledb]: https://github.com/nickdiego/compiledb
