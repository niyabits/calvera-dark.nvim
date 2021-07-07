-- LuaFormatter off
local calvera = {
	-- Common colors
	white    =		'#FFFFFF',
	gray     =      '#717CB4',
	black    = 		'#000000',
	red      =   	'#E97A7A',
	green    = 		'#ADCEA1',
	yellow   =		'#D6B295',
	blue     =  	'#82AAFF',
	paleblue =		'#AAB4EC',
	cyan     =  	'#7878E7',
	purple   =		'#C792EA',
	orange   =		'#F78C6C',
	pink     =  	'#FF9CAC',

	error    =		'#FF5370',
	link     =		'#80CBC4',
	cursor   =		'#FFCC00',

	none     =      'NONE'
}

-- Style specific colors

-- Darker theme style


calvera.bg =			'#0c0c1f'
calvera.bg_alt =		'#0c0c1f'
calvera.fg =			'#B0BEC5'
calvera.text =			'#9797D6'
calvera.comments =		'#333362'
calvera.selection = 	'#17173d'
calvera.contrast =		'#0a0a1a'
calvera.active =		'#121230'
calvera.border =		'#29295f'
calvera.line_numbers =	'#1c1c3a'
calvera.highlight =		'#373777'
calvera.disabled =		'#474747'
calvera.accent =		'#373777'

calvera.indentHlDefault ='#2a2a57'
calvera.indentHlContext ='#5050b9'
calvera.popupbg = '#1c1c42'
calvera.popupbgActive = '#29294e'
calvera.refTextBg = '#03385B'
calvera.refTextFg = '#AAAFDF'
calvera.nvimTreeTxt = '#474775'
-- Optional colors

-- LuaFormatter on

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.calvera_contrast == false then
    calvera.sidebar = calvera.bg
    calvera.float = calvera.bg
else
    calvera.sidebar = calvera.contrast
    calvera.float = calvera.bg
end

-- Enable custom variable colors
if vim.g.calvera_variable_color == nil then
    calvera.variable = calvera.paleblue
else
    calvera.variable = vim.g.calvera_variable_color
end

-- Set black titles for lighter style
calvera.title = '#474775'

-- Apply user defined colors

-- Check if vim.g.calvera_custom_colors = is a table
if type(vim.g.calvera_custom_colors) == "table" then
    -- Iterate trough the table
    for key, value in pairs(vim.g.calvera_custom_colors) do
        -- If the key doesn't exist:
        if not calvera[key] then
            error("Color " .. key .. " does not exist")
        end
        -- If it exists and the sting starts with a "#"
        if string.sub(value, 1, 1) == "#" then
            -- Hex override
            calvera[key] = value
            -- IF it doesn't, dont accept it
        else
            -- Another group
            if not calvera[value] then
                error("Color " .. value .. " does not exist")
            end
            calvera[key] = calvera[value]
        end
    end
end

return calvera
