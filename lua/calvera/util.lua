local util = {}
local calvera = require('calvera.theme')

-- Go trough the table and highlight the group with the color values
util.highlight = function(group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""

    local hl =
        "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " ..
            sp

    vim.cmd(hl)
    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
    end
end

-- Only define Calvera if it's the active colorshceme
function util.onColorScheme()
    if vim.g.colors_name ~= "calvera" then
        vim.cmd [[autocmd! Calvera]]
        vim.cmd [[augroup! Calvera]]
    end
end

-- Change the background for the terminal and packer windows
util.contrast = function()
    vim.cmd [[augroup Calvera]]
    vim.cmd [[  autocmd!]]
    vim.cmd [[  autocmd ColorScheme * lua require("calvera.util").onColorScheme()]]
    vim.cmd [[  autocmd TermOpen * setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[  autocmd FileType packer setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[  autocmd FileType qf setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[augroup end]]
end

-- Load the theme
function util.load()
    -- Set the theme environment
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "calvera"

    -- Load plugins and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function()
        calvera.loadTerminal()

        -- imort tables for plugins and lsp
        local plugins = calvera.loadPlugins()
        local lsp = calvera.loadLSP()

        for group, colors in pairs(plugins) do
            util.highlight(group, colors)
        end

        for group, colors in pairs(lsp) do util.highlight(group, colors) end
        if vim.g.calvera_contrast == true then util.contrast() end
        async:close()

    end))

    -- load base theme
    local editor = calvera.loadEditor()
    local syntax = calvera.loadSyntax()
    local treesitter = calvera.loadTreeSitter()

    for group, colors in pairs(editor) do util.highlight(group, colors) end

    for group, colors in pairs(syntax) do util.highlight(group, colors) end

    for group, colors in pairs(treesitter) do util.highlight(group, colors) end
    async:send()
end

return util
