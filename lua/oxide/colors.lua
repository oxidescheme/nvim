local config = require("oxide.config")

local M = {}

-- Oxide color palette
local palette = {
	-- Surface colors
	mantle = "#121212", -- oklch(0.18 0 0) Mantle
	base = "#161616", -- oklch(0.20 0 0) Main background
	surface0 = "#222222", -- oklch(0.25 0 0) Subtle backgrounds, cursor, visual
	surface1 = "#2e2e2e", -- oklch(0.30 0 0) Active selections
	surface2 = "#3a3a3a", -- oklch(0.35 0 0) Borders, lines

	-- Text colors
	bright_text = "#eeeeee", -- oklch(0.95 0 0) Bright text
	text = "#cecece", -- oklch(0.85 0 0) Primary text
	subtext0 = "#aeaeae", -- oklch(0.75 0 0) Secondary text
	subtext1 = "#808080", -- oklch(0.60 0 0) Muted text
	subtext2 = "#555555", -- oklch(0.45 0 0) Comments

	-- Accent colors
	red = "#ed756e", -- oklch(0.70 15 25) Functions, errors, critical items
	orange = "#e48233", -- oklch(0.70 15 55) Constants, numbers, warnings
	yellow = "#c39900", -- oklch(0.70 15 90) Attention, todo
	lime = "#9ca81f", -- oklch(0.70 15 115) Headings, progression, positive accents
	green = "#5bb661", -- oklch(0.70 15 145) Strings, success, added items
	teal = "#00baaa", -- oklch(0.70 15 185) Preproc, regex, attributes
	sky = "#00b3d6", -- oklch(0.70 15 215) Types, readonly, URLs
	blue = "#3ba6f5", -- oklch(0.70 15 245) Properties, info, search, directories
	purple = "#968ff7", -- oklch(0.70 15 285) Keywords, storage, static
	pink = "#cc7bd1", -- oklch(0.70 15 325) Tags, special strings, deprecated

	-- Accent colors (lighter, used for ANSI terminal colors)
	bright_red = "#ff9890", -- oklch(0.80 15 25)
	bright_orange = "#ffa156", -- oklch(0.80 15 55)
	bright_yellow = "#e3b831", -- oklch(0.80 15 90)
	bright_lime = "#bbc949", -- oklch(0.80 15 115)
	bright_green = "#7bd77f", -- oklch(0.80 15 145)
	bright_teal = "#00dcca", -- oklch(0.80 15 185)
	bright_sky = "#00d5f9", -- oklch(0.80 15 215)
	bright_blue = "#6fc6ff", -- oklch(0.80 15 245)
	bright_purple = "#b5b2ff", -- oklch(0.80 15 285)
	bright_pink = "#dd8be2", -- oklch(0.80 15 325)

	-- Diff backgrounds
	diff_delete = "#452b28", -- oklch(0.32 0.04 25) Deleted lines
	diff_add = "#263826", -- oklch(0.32 0.04 145) Added lines
	diff_change = "#213546", -- oklch(0.32 0.04 245) Changed lines

	-- Special
	none = "NONE",
}

function M.setup(opts)
	opts = config.extend(opts)

	-- Start with base palette
	local colors = {}
	for k, v in pairs(palette) do
		colors[k] = v
	end

	-- Apply transparency if enabled
	if opts.transparent then
		colors.base = "NONE"
		colors.mantle = "NONE"
	end

	-- Allow user color overrides
	if opts.on_colors then
		colors = opts.on_colors(colors) or colors
	end

	return {
		colors = colors,
		config = opts,
	}
end

return M
