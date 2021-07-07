--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--
-- Colorscheme name:        clavera-dark.nvim
-- Description:             Colorscheme for NeoVim based on the calvera pallete
-- Author:                  Yash Gupta <yashguptaz@protonmail.com>
-- Website:                 https://github.com/yashguptaz/calvera-dark.nvim
local util = require('calvera.util')

-- Load the theme
local set = function() util.load() end

return {set = set}
