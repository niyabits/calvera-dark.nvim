local calvera = require("calvera.colors")

local theme = {}

theme.loadSyntax = function()
    -- LuaFormatter off
    -- Syntax highlight groups

	local syntax = {
		Type =						{ fg = calvera.purple }, -- int, long, char, etc.
		StorageClass =				{ fg = calvera.cyan }, -- static, register, volatile, etc.
		Structure =					{ fg = calvera.puple }, -- struct, union, enum, etc.
		Constant =					{ fg = calvera.yellow }, -- any constant
		String =					{ fg = calvera.green, bg = calvera.none, style= 'italic' }, -- Any string
		Character =					{ fg = calvera.orange }, -- any character constant: 'c', '\n'
		Number =					{ fg = calvera.yellow }, -- a number constant: 5
		Boolean =					{ fg = calvera.orange }, -- a boolean constant: TRUE, false
		Float =						{ fg = calvera.orange }, -- a floating point constant: 2.3e10
		Statement =					{ fg = calvera.pink }, -- any statement
		Label =						{ fg = calvera.purple }, -- case, default, etc.
		Operator =					{ fg = calvera.cyan }, -- sizeof", "+", "*", etc.
		Exception =					{ fg = calvera.cyan }, -- try, catch, throw
		PreProc =					{ fg = calvera.purple }, -- generic Preprocessor
		Include =					{ fg = calvera.blue }, -- preprocessor #include
		Define =					{ fg = calvera.pink }, -- preprocessor #define
		Macro =						{ fg = calvera.cyan }, -- same as Define
		Typedef =					{ fg = calvera.red }, -- A typedef
		PreCondit =					{ fg = calvera.cyan }, -- preprocessor #if, #else, #endif, etc.
		Special =					{ fg = calvera.red }, -- any special symbol
		SpecialChar =				{ fg = calvera.pink }, -- special character in a constant
		Tag =						{ fg = calvera.red }, -- you can use CTRL-] on this
		Delimiter =					{ fg = calvera.cyan }, -- character that needs attention like , or .
		SpecialComment =			{ fg = calvera.gray }, -- special things inside a comment
		Debug =						{ fg = calvera.red }, -- debugging statements
		Underlined =				{ fg = calvera.link, bg = calvera.none, style = 'underline' }, -- text that stands out, HTML links
		Ignore =					{ fg = calvera.disabled }, -- left blank, hidden
		Error =						{ fg = calvera.error, bg = calvera.none, style = 'bold,underline' }, -- any erroneous construct
		Todo =						{ fg = calvera.yellow, bg = calvera.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        htmlLink = { fg = calvera.link, style = "underline" },
        htmlH1 = { fg = calvera.cyan, style = "bold" },
        htmlH2 = { fg = calvera.red, style = "bold" },
        htmlH3 = { fg = calvera.green, style = "bold" },
        htmlH4 = { fg = calvera.yellow, style = "bold" },
        htmlH5 = { fg = calvera.purple, style = "bold" },
        markdownH1 = { fg = calvera.cyan, style = "bold" },
        markdownH2 = { fg = calvera.red, style = "bold" },
        markdownH3 = { fg = calvera.green, style = "bold" },
        markdownH1Delimiter = { fg = calvera.cyan },
        markdownH2Delimiter = { fg = calvera.red },
        markdownH3Delimiter = { fg = calvera.green },
	}

	-- Options:

	-- Italic comments
	if vim.g.calvera_italic_comments == true then
		syntax.Comment =		{fg = calvera.comments, bg = calvera.none, style = 'italic'} -- italic comments
	else
		syntax.Comment =		{fg = calvera.comments} -- normal comments
	end

	-- Italic Keywords
	if vim.g.calvera_italic_keywords == true then
		syntax.Conditional =		{fg = calvera.purple, bg = calvera.none, style = 'italic'} -- italic if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = calvera.purple, bg = calvera.none, style = 'italic'} -- italic for, do, while, etc.
		syntax.Repeat =				{fg = calvera.purple, bg = calvera.none, style = 'italic'} -- italic any other keyword
	else
		syntax.Conditional =		{fg = calvera.purple} -- normal if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = calvera.purple} -- normal for, do, while, etc.
		syntax.Repeat =				{fg = calvera.purple} -- normal any other keyword
	end

	-- Italic Function names
	if vim.g.calvera_italic_functions == true then
		syntax.Function =		{fg = calvera.blue, bg = calvera.none, style = 'italic'} -- italic funtion names
	else
		syntax.Function =		{fg = calvera.blue} -- normal function names
	end

	if vim.g.calvera_italic_variables == true then
		syntax.Identifier =		{fg = calvera.variable, bg = calvera.none, style = 'italic'}; -- any variable name
	else
		syntax.Identifier =		{fg = calvera.variable}; -- any variable name
	end

	return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

	local editor = {
		NormalFloat =			{ fg = calvera.fg, bg = calvera.float }, -- normal text and background color for floating windows
		ColorColumn =			{ fg = calvera.none, bg = calvera.active }, --  used for the columns set with 'colorcolumn'
		Conceal =				{ fg = calvera.disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor =				{ fg = calvera.cursor, bg = calvera.none, style = 'reverse' }, -- the character under the cursor
		CursorIM =				{ fg = calvera.cursor, bg = calvera.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
		Directory =				{ fg = calvera.blue, bg = calvera.none }, -- directory names (and other special names in listings)
		DiffAdd =				{ fg = calvera.green, bg = calvera.none, style = 'reverse' }, -- diff mode: Added line
		DiffChange =			{ fg = calvera.blue, bg = calvera.none, style = 'reverse' }, --  diff mode: Changed line
		DiffDelete =			{ fg = calvera.red, bg = calvera.none, style = 'reverse' }, -- diff mode: Deleted line
		DiffText =				{ fg = calvera.fg, bg = calvera.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
		ErrorMsg =				{ fg = calvera.error }, -- error messages
		Folded =				{ fg = calvera.disabled, bg = calvera.none, style = 'italic' }, -- line used for closed folds
		FoldColumn =			{ fg = calvera.blue }, -- 'foldcolumn'
		IncSearch =				{ fg = calvera.highlight, bg = calvera.white, style = 'reverse' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		LineNr =				{ fg = calvera.line_numbers }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr =			{ fg = calvera.white }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen =			{ fg = calvera.yellow, bg = calvera.none, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg =				{ fg = calvera.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg =				{ fg = calvera.accent }, -- |more-prompt|
		NonText =				{ fg = calvera.disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Pmenu =					{ fg = calvera.text, bg = calvera.popupbg }, -- Popup menu: normal item.
		PmenuSel =				{ fg = calvera.text, bg = calvera.active }, -- Popup menu: selected item.
		PmenuSbar =				{ fg = calvera.text, bg = calvera.contrast }, -- Popup menu: scrollbar.
		PmenuThumb =			{ fg = calvera.fg, bg = calvera.border }, -- Popup menu: Thumb of the scrollbar.
		Question =				{ fg = calvera.green }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine =			{ fg = calvera.highlight, bg = calvera.title, style = 'reverse' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		qfLineNr =				{ fg = calvera.highlight, bg = calvera.title, style = 'reverse' }, -- Line numbers for quickfix lists
		Search =				{ fg = calvera.highlight, bg = calvera.white, style = 'reverse' }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey =			{ fg = calvera.purple }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad =				{ fg = calvera.red, bg = calvera.none, style = 'italic,undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap =				{ fg = calvera.blue, bg = calvera.none, style = 'italic,undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal =			{ fg = calvera.cyan, bg = calvera.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare =				{ fg = calvera.purple, bg = calvera.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine =			{ fg = calvera.accent, bg = calvera.active }, -- status line of current window
		StatusLineNC =  		{ fg = calvera.fg, bg = calvera.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm =		{ fg = calvera.fg, bg = calvera.active }, -- status line of current terminal window
		StatusLineTermNC =		{ fg = calvera.text, bg = calvera.bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLineFill =			{ fg = calvera.fg }, -- tab pages line, where there are no labels
		TablineSel =			{ fg = calvera.bg, bg = calvera.accent }, -- tab pages line, active tab page label
		Tabline =				{ fg = calvera.fg },
		Title =					{ fg = calvera.title, bg = calvera.none, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
		Visual =				{ fg = calvera.none, bg = calvera.selection }, -- Visual mode selection
		VisualNOS =				{ fg = calvera.none, bg = calvera.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg =			{ fg = calvera.yellow }, -- warning messages
		Whitespace =			{ fg = calvera.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu =				{ fg = calvera.orange, bg = calvera.none, style = 'bold' }, -- current match in 'wildmenu' completion
		CursorColumn =			{ fg = calvera.none, bg = calvera.active }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

		CursorLine =			{ fg = calvera.none, bg = calvera.cursorLineBG }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		-- ToolbarLine =			{ fg = calvera.fg, bg = calvera.bg_alt },
		-- ToolbarButton =			{ fg = calvera.fg, bg = calvera.none, style = 'bold' },
		NormalMode =			{ fg = calvera.accent, bg = calvera.none, style = 'reverse' }, -- Normal mode message in the cmdline
		InsertMode =			{ fg = calvera.green, bg = calvera.none, style = 'reverse' }, -- Insert mode message in the cmdline
		ReplacelMode =			{ fg = calvera.red, bg = calvera.none, style = 'reverse' }, -- Replace mode message in the cmdline
		VisualMode =			{ fg = calvera.purple, bg = calvera.none, style = 'reverse' }, -- Visual mode message in the cmdline
		CommandMode =			{ fg = calvera.gray, bg = calvera.none, style = 'reverse' }, -- Command mode message in the cmdline
		Warnings =				{ fg = calvera.yellow },

        healthError =           { fg = calvera.error },
        healthSuccess =         { fg = calvera.green },
        healthWarning =         { fg = calvera.yellow },

        -- Dashboard
        DashboardShortCut =                     { fg = calvera.red },
        DashboardHeader =                       { fg = calvera.comments },
        DashboardCenter =                       { fg = calvera.paleblue },
        DashboardFooter =                       { fg = calvera.orange, style = "italic" },

	}

    -- Options:

    --Set transparent background
    if vim.g.calvera_disable_background == true then
		editor.Normal =				{ fg = calvera.fg, bg = calvera.none } -- normal text and background color
		editor.SignColumn =			{ fg = calvera.fg, bg = calvera.none }
    else
		editor.Normal =				{ fg = calvera.fg, bg = calvera.bg } -- normal text and background color
		editor.SignColumn =			{ fg = calvera.fg, bg = calvera.bg }
    end

    -- Remove window split borders
    if vim.g.calvera_borders == true then
		editor.VertSplit =				{ fg = calvera.border } -- the column separating vertically split windows
    else
		editor.VertSplit =				{ fg = calvera.bg } -- the column separating vertically split windows
    end

    --Set End of Buffer lines (~)
    if vim.g.calvera_hide_eob == true then
		editor.EndOfBuffer =			{ fg = calvera.bg } -- ~ lines at the end of a buffer
    else
		editor.EndOfBuffer =			{ fg = calvera.disabled } -- ~ lines at the end of a buffer
    end

    return editor
end

theme.loadTerminal = function ()

	vim.g.terminal_color_0 = calvera.black
	vim.g.terminal_color_1 = calvera.red
	vim.g.terminal_color_2 = calvera.green
	vim.g.terminal_color_3 = calvera.yellow
	vim.g.terminal_color_4 = calvera.blue
	vim.g.terminal_color_5 = calvera.purple
	vim.g.terminal_color_6 = calvera.cyan
	vim.g.terminal_color_7 = calvera.white
	vim.g.terminal_color_8 = calvera.gray
	vim.g.terminal_color_9 = calvera.red
	vim.g.terminal_color_10 = calvera.green
	vim.g.terminal_color_11 = calvera.yellow
	vim.g.terminal_color_12 = calvera.blue
	vim.g.terminal_color_13 = calvera.purple
	vim.g.terminal_color_14 = calvera.cyan
	vim.g.terminal_color_15 = calvera.white

end

theme.loadTreeSitter = function ()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAnnotation =              { fg = calvera.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute =               { fg = calvera.yellow }, -- (unstable) TODO: docs
        TSBoolean=                  { fg = calvera.orange }, -- For booleans.
        TSCharacter=                { fg = calvera.orange }, -- For characters.
        TSConstructor =             { fg = calvera.paleblue }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSConstant =                { fg = calvera.yellow }, -- For constants
        TSConstBuiltin =            { fg = calvera.blue }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro =              { fg = calvera.blue }, -- For constants that are defined by macros: `NULL` in C.
        TSError =                   { fg = calvera.error }, -- For syntax/parser errors.
        TSException =               { fg = calvera.red }, -- For exception related keywords.
        TSField =                   { fg = calvera.variable }, -- For fields.
        TSFloat =                   { fg = calvera.red }, -- For floats.
        TSFuncMacro =               { fg = calvera.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude =                 { fg = calvera.cyan }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel =                   { fg = calvera.red }, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace =               { fg = calvera.paleblue }, -- For identifiers referring to modules and namespaces.
        TSNumber =                  { fg = calvera.orange }, -- For all numbers
        TSOperator =                { fg = calvera.yellow }, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter =               { fg = calvera.paleblue }, -- For parameters of a function.
        TSParameterReference=       { fg = calvera.paleblue }, -- For references to parameters of a function.
        TSProperty =                { fg = calvera.paleblue }, -- Same as `TSField`,accesing for struct members in C.
        TSPunctDelimiter =          { fg = calvera.cyan }, -- For delimiters ie: `.`
        TSPunctBracket =            { fg = calvera.cyan }, -- For brackets and parens.
        TSPunctSpecial =            { fg = calvera.cyan }, -- For special punctutation that does not fall in the catagories before.
        TSString =                  { fg = calvera.green }, -- For strings.
        TSStringRegex =             { fg = calvera.blue }, -- For regexes.
        TSStringEscape =            { fg = calvera.disabled }, -- For escape characters within a string.
        TSSymbol =                  { fg = calvera.yellow }, -- For identifiers referring to symbols or atoms.
        TSType =                    { fg = calvera.yellow }, -- For types.
        TSTypeBuiltin =             { fg = calvera.purple }, -- For builtin types.
        TSTag =                     { fg = calvera.red }, -- Tags like html tag names.
        TSTagDelimiter =            { fg = calvera.cyan }, -- Tag delimiter like `<` `>` `/`
        TSText =                    { fg = calvera.text }, -- For strings considered text in a markup language.
        TSTextReference =           { fg = calvera.yellow }, -- FIXME
        TSEmphasis =                { fg = calvera.paleblue }, -- For text to be represented with emphasis.
        TSUnderline =               { fg = calvera.fg, bg = calvera.none, style = 'underline' }, -- For text to be represented with an underline.
        TSStrike =                  { }, -- For strikethrough text.
        TSTitle =                   { fg = calvera.title, bg = calvera.none, style = 'bold' }, -- Text that is part of a title.
        TSLiteral =                 { fg = calvera.fg }, -- Literal text.
        TSURI =                     { fg = calvera.link }, -- Any URI like a link or email.
        --TSNone =                    { }, -- TODO: docs
    }

    -- Options:

    -- Italic comments
    if vim.g.calvera_italic_comments == true then
        treesitter.TSComment=                  { fg = calvera.comments , bg = calvera.none, style = 'italic' } -- For comment blocks.
    else
        treesitter.TSComment=                  { fg = calvera.comments } -- For comment blocks.
    end

    if vim.g.calvera_italic_keywords == true then
        treesitter.TSConditional =             { fg = calvera.purple, style = 'italic' } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = calvera.cyan  , style = 'italic' } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = calvera.purple, style = 'italic' } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = calvera.purple, style = 'italic' } -- For keywords used to define a fuction.
    else
        treesitter.TSConditional =             { fg = calvera.purple } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = calvera.cyan } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = calvera.purple } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = calvera.purple } -- For keywords used to define a fuction.
    end

    if vim.g.calvera_italic_functions == true then
        treesitter.TSFunction =                { fg = calvera.blue, style = 'italic' } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = calvera.blue, style = 'italic' } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = calvera.cyan, style = 'italic' } -- For builtin functions: `table.insert` in Lua.
    else
        treesitter.TSFunction =                { fg = calvera.blue } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = calvera.blue } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = calvera.cyan } -- For builtin functions: `table.insert` in Lua.
    end

    if vim.g.calvera_italic_variables == true then
        treesitter.TSVariable =                { fg = calvera.variable, style = 'italic' } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = calvera.variable, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
    else
        treesitter.TSVariable =                { fg = calvera.variable } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = calvera.variable } -- Variable names that are defined by the languages, like `this` or `self`.
    end

    return treesitter

end

theme.loadLSP = function ()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError =            { fg = calvera.error }, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError =               { fg = calvera.error }, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError =           { fg = calvera.error }, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError =        { fg = calvera.error }, -- Virtual text "Error"
        LspDiagnosticsUnderlineError =          { style = 'undercurl', sp = calvera.error }, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning =          { fg = calvera.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning =             { fg = calvera.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning =         { fg = calvera.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning =      { fg = calvera.yellow}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning =        { style = 'undercurl', sp = calvera.yellow }, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation =      { fg = calvera.paleblue }, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation =         { fg = calvera.paleblue },  -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation =     { fg = calvera.paleblue }, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation =  { fg = calvera.paleblue }, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation =    { style = 'undercurl', sp = calvera.paleblue }, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint =             { fg = calvera.purple  },  -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint =                { fg = calvera.purple  }, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint =            { fg = calvera.purple  }, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint =         { fg = calvera.purple  }, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint =           { style = 'undercurl', sp = calvera.paleblue }, -- used to underline "Hint" diagnostics.
        LspReferenceText =                      { fg = calvera.refTextFg, bg = calvera.refTextBg }, -- used for highlighting "text" references
        LspReferenceRead =                      { fg = calvera.refTextFg, bg = calvera.refTextBg }, -- used for highlighting "read" references
        LspReferenceWrite =                     { fg = calvera.refTextFg, bg = calvera.refTextBg }, -- used for highlighting "write" references
    }

    return lsp

end

theme.loadPlugins = function()
    -- Plugins highlight groups

    local plugins = {

        -- LspTrouble
        LspTroubleText =                        { fg = calvera.text },
        LspTroubleCount =                       { fg = calvera.purple, bg = calvera.active },
        LspTroubleNormal =                      { fg = calvera.fg, bg = calvera.sidebar },

		-- Nvim-Compe
		CompeDocumentation =					{ fg = calvera.text, bg = calvera.contrast },

        -- Diff
        diffAdded =                             { fg = calvera.green },
        diffRemoved =                           { fg = calvera.red },
        diffChanged =                           { fg = calvera.blue },
        diffOldFile =                           { fg = calvera.text },
        diffNewFile =                           { fg = calvera.title },
        diffFile =                              { fg = calvera.gray },
        diffLine =                              { fg = calvera.cyan },
        diffIndexLine =                         { fg = calvera.purple },

        -- Neogit
        NeogitBranch =                          { fg = calvera.paleblue },
        NeogitRemote =                          { fg = calvera.purple },
        NeogitHunkHeader =                      { fg = calvera.fg, bg = calvera.highlight },
        NeogitHunkHeaderHighlight =             { fg = calvera.blue, bg = calvera.contrast },
        NeogitDiffContextHighlight =            { fg = calvera.text, bg = calvera.contrast },
        NeogitDiffDeleteHighlight =             { fg = calvera.red },
        NeogitDiffAddHighlight =                { fg = calvera.green },

        -- GitGutter
        GitGutterAdd =                          { fg = calvera.green }, -- diff mode: Added line |diff.txt|
        GitGutterChange =                       { fg = calvera.blue }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete =                       { fg = calvera.red }, -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd =                           { fg = calvera.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddNr =                         { fg = calvera.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddLn =                         { fg = calvera.green }, -- diff mode: Added line |diff.txt|
        GitSignsChange =                        { fg = calvera.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr =                      { fg = calvera.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn =                      { fg = calvera.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete =                        { fg = calvera.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr =                      { fg = calvera.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn =                      { fg = calvera.red }, -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopeNormal =                       { fg = calvera.fg, bg = calvera.bg },
        TelescopePromptBorder =                 { fg = calvera.cyan },
        TelescopeResultsBorder =                { fg = calvera.purple },
        TelescopePreviewBorder =                { fg = calvera.green },
        TelescopeSelectionCaret =               { fg = calvera.purple },
        TelescopeSelection =                    { fg = calvera.purple, bg = calvera.active },
        TelescopeMatching =                     { fg = calvera.cyan },

        -- NvimTree
        NvimTreeRootFolder =                    { fg = calvera.nvimTreeTxt },
        NvimTreeFolderName=                     { fg = calvera.text },
        NvimTreeFolderIcon=                     { fg = calvera.accent },
        NvimTreeEmptyFolderName=                { fg = calvera.disabled },
        NvimTreeOpenedFolderName=               { fg = calvera.accent },
        NvimTreeIndentMarker =                  { fg = calvera.border },
        NvimTreeGitDirty =                      { fg = calvera.blue },
        NvimTreeGitNew =                        { fg = calvera.green },
        NvimTreeGitStaged =                     { fg = calvera.comments },
        NvimTreeGitDeleted =                    { fg = calvera.red },
        NvimTreeOpenedFile =                    { fg = calvera.accent },
        NvimTreeImageFile =                     { fg = calvera.yellow },
        NvimTreeMarkdownFile =                  { fg = calvera.pink },
        NvimTreeExecFile =                      { fg = calvera.green },
        NvimTreeSpecialFile =                   { fg = calvera.purple , style = "underline" },
        LspDiagnosticsError =                   { fg = calvera.error },
        LspDiagnosticsWarning =                 { fg = calvera.yellow },
        LspDiagnosticsInformation =             { fg = calvera.paleblue },
        LspDiagnosticsHint =                    { fg = calvera.purple },

        -- WhichKey
        WhichKey =                              { fg = calvera.accent , style = 'bold'},
        WhichKeyGroup =                         { fg = calvera.text },
        WhichKeyDesc =                          { fg = calvera.blue, style = 'italic' },
        WhichKeySeperator =                     { fg = calvera.fg },
        WhichKeyFloating =                      { bg = calvera.float },
        WhichKeyFloat =                         { bg = calvera.float },

        -- LspSaga
        LspFloatWinNormal =                     { fg = calvera.text, bg = calvera.bg },
        LspFloatWinBorder =                     { fg = calvera.purple },
        DiagnosticError =                       { fg = calvera.error },
        DiagnosticWarning =                     { fg = calvera.yellow },
        DiagnosticInformation =                 { fg = calvera.paleblue },
        DiagnosticHint =                        { fg = calvera.purple },
		LspSagaDiagnosticBorder =				{ fg = calvera.gray },
		LspSagaDiagnosticHeader =				{ fg = calvera.blue },
		LspSagaDiagnosticTruncateLine =			{ fg = calvera.border },
		LspLinesDiagBorder =					{ fg = calvera.contrast },
		ProviderTruncateLine =					{ fg = calvera.border },
		LspSagaShTruncateLine =					{ fg = calvera.border },
		LspSagaDocTruncateLine =				{ fg = calvera.border },
		LineDiagTruncateLine =					{ fg = calvera.border },
        LspSagaBorderTitle =                    { fg = calvera.cyan },
        LspSagaHoverBorder =                    { fg = calvera.paleblue },
        LspSagaRenameBorder =                   { fg = calvera.green },
        LspSagaDefPreviewBorder =               { fg = calvera.green },
        LspSagaCodeActionTitle =                { fg = calvera.paleblue },
        LspSagaCodeActionContent =              { fg = calvera.purple },
        LspSagaCodeActionBorder =               { fg = calvera.blue },
		LspSagaCodeActionTruncateLine =			{ fg = calvera.border },
        LspSagaSignatureHelpBorder =            { fg = calvera.pink },
        LspSagaFinderSelection =                { fg = calvera.green },
		-- LspSagaAutoPreview =					{ fg = calvera.red },
        ReferencesCount =                       { fg = calvera.purple },
        DefinitionCount =                       { fg = calvera.purple },
		DefinitionPreviewTitle =				{ fg = calvera.green },
        DefinitionIcon =                        { fg = calvera.blue },
        ReferencesIcon =                        { fg = calvera.blue },
        TargetWord =                            { fg = calvera.cyan },

        -- BufferLine
        BufferLineIndicatorSelected =           { fg = calvera.accent },
        BufferLineFill =                        { bg = calvera.bg_alt },

        -- Sneak
        Sneak =                                 { fg = calvera.bg, bg = calvera.accent },
        SneakScope =                            { bg = calvera.selection },

        -- Indent Blankline
        IndentBlanklineChar =                   { fg = calvera.indentHlDefault },
        IndentBlanklineContextChar =            { fg = calvera.indentHlContext },

        -- Nvim dap
        DapBreakpoint =                         { fg = calvera.red },
        DapStopped =                            { fg = calvera.green },

		-- Illuminate
		illuminatedWord =						{ bg = calvera.highight },
		illuminatedCurWord =					{ bg = calvera.highight },
    }
    -- Options:

    -- Disable nvim-tree background
        if vim.g.calvera_disable_background == true then
            plugins.NvimTreeNormal =                        { fg = calvera.comments, bg = calvera.none }
        else
            plugins.NvimTreeNormal =                        { fg = calvera.comments, bg = calvera.sidebar }
        end

    return plugins

end

-- LuaFormatter on
return theme
