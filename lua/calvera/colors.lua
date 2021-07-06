-- LuaFormatter off
local calvera = {
	-- Common colors

	white    =		'#EEFFFF',
	gray     =      '#717CB4',
	black    = 		'#000000',
	red      =   	'#F07178',
	green    = 		'#ADCEA1',
	yellow   =		'#FFCB6B',
	blue     =  	'#82AAFF',
	paleblue =		'#B0C9FF',
	cyan     =  	'#89DDFF',
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
calvera.text =			'#727272'
calvera.comments =		'#333362'
calvera.selection = 	'#17173d'
calvera.contrast =		'#1A1A1A'
calvera.active =		'#121230'
calvera.border =		'#292929'
calvera.line_numbers =	'#1c1c3a'
calvera.highlight =		'#373777'
calvera.disabled =		'#474747'
calvera.accent =		'#373777'

-- Optional colors
calvera.indentHlDefault ='#2a2a57'
calvera.indentHlContext ='#5050b9'

-- LuaFormatter on

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.material_contrast == false then
    calvera.sidebar = calvera.bg
    calvera.float = calvera.bg
else
    calvera.sidebar = calvera.bg_alt
    calvera.float = calvera.bg_alt
end

-- Enable custom variable colors
if vim.g.material_variable_color == nil then
    calvera.variable = calvera.gray
else
    calvera.variable = vim.g.material_variable_color
end

-- Set black titles for lighter style
if vim.g.material_style == 'lighter' then
    calvera.title = calvera.black
else
    calvera.title = calvera.white
end

-- Apply user defined colors

-- Check if vim.g.material_custom_colors = is a table
if type(vim.g.material_custom_colors) == "table" then
    -- Iterate trough the table
    for key, value in pairs(vim.g.material_custom_colors) do
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
