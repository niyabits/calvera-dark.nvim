-- Useful for Development
-- Source this lua to get started
-- Requires: https://github.com/famiu/nvim-reload
local reload = require('nvim-reload')

-- Use `:Reload` to reload the theme
reload.lua_reload_dirs = {
    vim.fn.stdpath('config'), vim.fn.stdpath('data') .. "/site/pack/*/start/*",
    "."
}

-- Set the theme for development
local calvera = require('calvera')
calvera.set()
