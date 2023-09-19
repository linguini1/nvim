# linguini nvim

Clone this repository on your system's nvim run time path. For Windows, this is located in
`Users/<user>/AppData/Local/nvim` (cloning in the `Local` directory will create the nvim directory)

## Fonts

In order to have the correct font, install the [JetBrains Mono Nerd Font][nerd-fonts] from nerdfonts.

Disable ligatures in the terminal's font settings using `font.features.calt = 0` within the `settings.json` file
for the Windows terminal. This should be done under the default profiles.

You will also want to go into `Settings > Defaults > Appearance` and set `Text Formatting` to "Bold font with bright
colours".

For `fire.nvim` to display correctly in the browser, be sure to go into the settings and select the
[JetBrains Mono Nerd Font][nerd-fonts] as the default mono space font.

## Terminal Colours

The terminal colours are recommended to match this config's theme, **gruvbox hard**, for best results. You can find the
hex colour codes [here][gruvbox]

## Compiler

In order to avoid Visual Studio code for clang on Windows (and some annoying side effects of having to specify a target
when compiling), this config uses gcc.

### clangd Nuances

Because clangd requires a `compiler_commands.json` file in order to perform checks accurately, an additional dependency
must be installed to generate this file from Makefile commands (Cmake does this automatically but Makefiles do not).

Many Linux users suggest using [Bear][bear]. On Windows, I found it easiest to use [compiledb][compiledb], a Python
package that works similarly right out of the box. Install it globally with pip and you can generate the compile
commands from a Makefile.

In order to use gcc with clangd and not have errors about missing header files, the best workaround I found was to add
an environment variable called `CLANGD_FLAGS` to the system, with the value `--query-driver=<abs path to gcc/g++>`. This
ensures that clangd knows how to find the header files by querying gcc/g++ and I don't have to include this absolute
path in my configuration in case I end up using clang on Linux or store gcc elsewhere on Windows. Note that gcc/g++ can
be represented in the absolute path as `g*`.

## LaTeX Indenting

This configuration uses `latexindent`, for which you will need to create a file called `.indentconfig` in the home
directory specified by [latexindent's docs][latexident] with the following contents:

```yaml
paths:
  - path/to/nvim/.latexindent.yaml
```

## Fire.nvim Shortcuts

I found it easiest to use the following browser keyboard shortcuts for this `fire.nvim` configuration (using Chrome):

- Send `Ctrl + N` to fire.nvim: `Ctrl + N`
- Send `Ctrl + T` to fire.nvim: `Ctrl + T`
- Send `Ctrl + W` to fire.nvim: `Ctrl + W`
- Toggle fire.nvim in the current tab: `Ctrl + Shift + E`

## Features to be added

- Auto-install formatters

[nerd-fonts]: https://www.nerdfonts.com/font-downloads
[gruvbox]: https://github.com/morhetz/gruvbox
[compiler-workaround]: https://wetmelon.github.io/clang-on-windows.html
[llvm]: https://github.com/llvm/llvm-project/releases
[mingw]: https://github.com/niXman/mingw-builds-binaries/releases
[bear]: https://github.com/rizsotto/Bear
[compiledb]: https://github.com/nickdiego/compiledb
[latexindent]: https://latexindentpl.readthedocs.io/en/stable/sec-indent-config-and-settings.html#indentconfig-yaml-and-indentconfig-yaml
