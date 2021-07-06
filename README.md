# Calvera Dark.nvim

## Info
A port of [Calvera Dark](https://github.com/saurabhdaware/vscode-calvera-dark) colorscheme for NeoVim written in Lua

Calvera Dark.nvim is meant to be a fast and modern colorscheme written in Lua that supports a lot of the new features
added to NeoVim like built-in LSP and [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)

## ✨ Features
+ Supported plugins:
    + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
    + [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
    + [Lsp Saga](https://github.com/glepnir/lspsaga.nvim)
    + [Nvim-Compe](https://github.com/hrsh7th/nvim-compe)
    + [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
    + [Git Gutter](https://github.com/airblade/vim-gitgutter)
    + [git-messenger](https://github.com/rhysd/git-messenger.vim)
    + [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
    + [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    + [Nvim-Tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
    + [NERDTree](https://github.com/preservim/nerdtree)
    + [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
    + [vim-which-key](https://github.com/liuchengxu/vim-which-key)
    + [WhichKey.nvim](https://github.com/folke/which-key.nvim)
    + [Dashboard](https://github.com/glepnir/dashboard-nvim)
    + [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
    + [Lualine](https://github.com/hoob3rt/lualine.nvim)
    + [Neogit](https://github.com/TimUntersberger/neogit)
    + [vim-sneak](https://github.com/justinmk/vim-sneak)
    + [nvim-dap](https://github.com/mfussenegger/nvim-dap)
    + [vim-illuminate](https://github.com/RRethy/vim-illuminate)

+ Ability to change background on sidebar-like windows like Nvim-Tree, Packer, terminal etc.

+ Asynchronous highlight loading which makes the theme extremely fast

+ Added functions for live theme switching without the need to restart NeoVim

## ⚡️ Requirements

+ Neovim >= 0.5.0

## ⚓ Installation

Install via your favourite package manager:
```vim
" If you are using Vim-Plug
Plug 'yashguptaz/calvera-dark.nvim'
```

```lua
-- If you are using Packer
use 'yashguptaz/calvera-dark.nvim'
```

## 🐬 Usage

Enable the colorscheme:
```vim
"Vim-Script:
colorscheme calvera
```

```lua
--Lua:
require('calvera').set()
```

To enable the `calvera-nvim` theme for `Lualine`, simply specify it in your lualine settings:
( make sure to set the theme to 'calvera-nvim', as 'calvera' already exists built in to lualine)

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'calvera-nvim'
    -- ... your lualine config
  }
}
```

| Option                              | Default     | Description                                                                                      |
| ----------------------------------- | ----------- | ------------------------------------------------------------------------------------------------ |
| calvera_contrast                    | `true`      | Make sidebars and popup menus like nvim-tree and telescope have a different background           |
| calvera_lighter_contrast            | `false`     | Increase the contrast for the 'lighter' variant of the theme                                     |
| calvera_italic_comments             | `false`     | Make comments italic                                                                             |
| calvera_italic_keywords             | `false`     | Make keywords like if, for, while etc. italic                                                    |
| calvera_italic_functions            | `false`     | Make function calls and names italic                                                             |
| calvera_italic_variables            | `false`     | Make variable names and identifiers italic                                                       |
| calvera_borders                     | `false`     | Enable the border between verticaly split windows visable                                        |
| calvera_disable_background          | `false`     | Disable the setting of background color so that NeoVim can use your terminal background          |
| calvera_hide_eob                    | `false`     | Hide the end of buffer lines ( ~ )                                                               |
| calvera_variable_color              | `#717CB4`   | Set a custom color for variables and fields                                                      |
| calvera_custom_colors               |    {}       | Override the default colors and use your own                                                     |

```lua
-- Example config in lua
vim.g.calvera_style = 'deep ocean'
vim.g.calvera_italic_comments = true
vim.g.calvera_italic_keywords = true
vim.g.calvera_italic_functions = true
vim.g.calvera_italic_variables = false
vim.g.calvera_contrast = true
vim.g.calvera_borders = false
vim.g.calvera_disable_background = false
--vim.g.calvera_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('calvera').set()
```

```vim
" Example config in Vim-Script
let g:calvera_italic_comments = 1
let g:calvera_italic_keywords = 1
let g:calvera_italic_functions = 1
let g:calvera_contrast = 1

" Load the colorsheme
colorscheme calvera
```

## ⛵ Functions

+ Toggle the style live without the need to exit NeoVim

+ Toggle the end of buffer lines ( ~ )

Call the built in function for toggling buffer lines

```vim
"Vim-Script
:lua require('calvera.functions').toggle_eob()
"This command toggles the end of buffer lines
```


The command can also be mapped to a key to toggle the lines live
```vim
"Vim-Script:
nnoremap <leader>me :lua require('calvera.functions').toggle_eob()<CR>
```

```lua
--Lua:
vim.api.nvim_set_keymap('n', '<leader>me', [[<Cmd>lua require('calvera.functions').toggle_eob()<CR>]], { noremap = true, silent = true })
```

+ Change the style to a desired one using the function change_style("desired style")
```vim
"Vim-Script:
:lua require('calvera.functions').change_style("palenight")
"This command changes the style to palenight
```

The command can also be mapped to a key for fast style switching
```vim
"Vim-Script:
nnoremap <leader>ml :lua require('calvera.functions').change_style('lighter')<CR>
nnoremap <leader>md :lua require('calvera.functions').change_style('darker')<CR>
```

```lua
--Lua:
vim.api.nvim_set_keymap('n', '<leader>ml', [[<Cmd>lua require('calvera.functions').change_style('lighter')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>md', [[<Cmd>lua require('calvera.functions').change_style('darker')<CR>]], { noremap = true, silent = true })
```
