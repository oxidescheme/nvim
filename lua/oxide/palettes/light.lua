---@class Palette
local M = {
	-- Surface colors
	base = "#fafafa", -- Main background
	mantle = "#f0f0f0", -- Sidebars, line numbers
	surface0 = "#e8e8e8", -- Selection background
	surface1 = "#e0e0e0", -- Subtle backgrounds
	surface2 = "#d0d0d0", -- Borders, separators

	-- Text colors
	text = "#1a1a1a", -- Primary text
	subtext0 = "#2d2d2d", -- Secondary text
	subtext1 = "#4a4a4a", -- Muted text

	-- Accent colors
	red = "#c1414b", -- Errors, critical items (toned down)
	orange = "#d17000", -- Warnings, numbers, constants (darker)
	yellow = "#b8860b", -- Attention, search highlights (darker gold)
	green = "#2d7d32", -- Success, strings, added items (darker green)
	teal = "#006064", -- Special elements, regex, escape chars (much darker)
	sky = "#1565c0", -- Classes, types, bold markup (darker blue)
	sapphire = "#0277bd", -- Functions, methods, headings (darker)
	blue = "#1976d2", -- Variables, identifiers (good contrast)
	purple = "#7b1fa2", -- Keywords, storage, changed items (darker purple)
	pink = "#c2185b", -- Deprecated, special tags (darker pink)

	-- Special
	none = "NONE",
}

return M
