local colors = require('calvera.colors')

local calvera = {}

calvera.normal = {
    a = {fg = colors.bg, bg = colors.blue, gui = 'bold'},
    b = {fg = colors.title, bg = colors.active},
    c = {fg = colors.fg, bg = colors.selection}
}

calvera.insert = {
    a = {fg = colors.bg, bg = colors.green, gui = 'bold'},
    b = {fg = colors.title, bg = colors.active}
}

calvera.visual = {
    a = {fg = colors.bg, bg = colors.purple, gui = 'bold'},
    b = {fg = colors.title, bg = colors.active}
}

calvera.replace = {
    a = {fg = colors.bg, bg = colors.red, gui = 'bold'},
    b = {fg = colors.title, bg = colors.active}
}

calvera.command = {
    a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'},
    b = {fg = colors.title, bg = colors.active}
}

calvera.inactive = {
    a = {fg = colors.disabled, bg = colors.bg, gui = 'bold'},
    b = {fg = colors.disabled, bg = colors.bg},
    c = {fg = colors.disabled, bg = colors.selection}
}

return calvera
