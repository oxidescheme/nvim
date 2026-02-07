-- Core editor highlight groups - Direct semantic colors only
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors -- Direct semantic colors
	local styles = config.styles or {}

	return {
		-- Basic highlighting
		Normal = { fg = c.text, bg = c.base },
		NormalFloat = { fg = c.text, bg = config.transparent and "NONE" or c.base },
		NormalNC = { fg = c.text, bg = c.base },

		-- Cursor
		Cursor = { fg = c.base, bg = c.text },
		CursorLine = { bg = c.surface0 },
		CursorColumn = { bg = c.surface0 },
		CursorLineNr = { fg = c.text, bold = true },

		-- Line numbers
		LineNr = { fg = c.subtext2 },
		SignColumn = { fg = c.subtext2, bg = c.base },
		FoldColumn = { fg = c.subtext2, bg = c.base },

		-- Folding
		Folded = { fg = c.subtext0, bg = c.surface1 },

		-- Search (direct semantic colors)
		Search = { bg = c.blue, fg = c.base },
		IncSearch = { bg = c.orange, fg = c.base },
		CurSearch = { bg = c.orange, fg = c.base },
		Substitute = { bg = c.red, fg = c.base },

		-- Visual selection
		Visual = { bg = c.surface1 },
		VisualNOS = { bg = c.surface1 },

		-- Messages and command line
		ModeMsg = { fg = c.text },
		MoreMsg = { fg = c.blue },
		ErrorMsg = { fg = c.red },
		WarningMsg = { fg = c.orange },

		-- Status line
		StatusLine = { fg = c.text, bg = c.base },
		StatusLineNC = { fg = c.subtext0, bg = c.base },

		-- Tab line
		TabLine = { fg = c.subtext0, bg = c.base },
		TabLineFill = { bg = c.base },
		TabLineSel = { fg = c.text, bg = c.base },

		-- Popup menu
		Pmenu = { fg = c.text, bg = c.surface0 },
		PmenuSel = { fg = c.text, bg = c.surface1, bold = true },
		PmenuSbar = { bg = c.surface1 },
		PmenuThumb = { bg = c.subtext2 },

		-- Borders
		FloatBorder = { fg = c.subtext2, bg = config.transparent and "NONE" or c.base },
		WinSeparator = { fg = c.subtext2 },
		VertSplit = { fg = c.subtext2 }, -- Legacy

		-- Diff highlighting
		DiffAdd = { bg = c.jade, fg = c.base },
		DiffDelete = { bg = c.amber, fg = c.base },
		DiffChange = { bg = c.saffire, fg = c.base },
		DiffText = { bg = c.saffire, fg = c.base },

		-- Spell checking
		SpellBad = { sp = c.red, undercurl = true },
		SpellCap = { sp = c.orange, undercurl = true },
		SpellLocal = { sp = c.blue, undercurl = true },
		SpellRare = { sp = c.teal, undercurl = true },

		-- Misc
		Directory = { fg = c.blue },
		Title = { fg = c.text, bold = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Underlined = { underline = true },

		-- Terminal
		Terminal = { fg = c.text, bg = c.base },

		-- Others
		NonText = { fg = c.subtext2 },
		EndOfBuffer = { fg = c.base },
		Conceal = { fg = c.subtext1 },
		SpecialKey = { fg = c.subtext1 },
		Whitespace = { fg = c.subtext2 },
		WildMenu = { fg = c.text, bg = c.surface1 },
		MatchParen = { fg = c.text, bg = c.subtext2, underline = true },
	}
end

return M
