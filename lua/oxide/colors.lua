local config = require("oxide.config")

local M = {}

-- Oxide color palette
---@class Palette
local palette = {
	-- Surface colors
	mantle = "#121212", -- oklch(0.18 0 0) Mantle
	base = "#161616", -- oklch(0.20 0 0) Main background
	surface0 = "#222222", -- oklch(0.25 0 0) Cursor background
	surface1 = "#262626", -- oklch(0.27 0 0) Subtle backgrounds

	-- Text colors
	bright_text = "#dedede", -- oklch(0.90 0 0) Bright text
	text = "#cecece", -- oklch(0.85 0 0) Primary text
	subtext0 = "#bebebe", -- oklch(0.80 0 0) Secondary text
	subtext1 = "#8f8f8f", -- oklch(0.65 0 0) Muted text
	subtext2 = "#484848", -- oklch(0.40 0 0) Comments, borders, subtle elements

	-- Accent colors
	red = "#ed756e", -- oklch(0.70 15 25) Errors, critical items
	orange = "#e48233", -- oklch(0.70 15 55) Warnings, numbers, constants
	yellow = "#c39900", -- oklch(0.70 15 90) Attention, search highlights
	green = "#5bb661", -- oklch(0.70 15 145) Success, strings, added items
	teal = "#00baaa", -- oklch(0.70 15 185) Special elements, regex, escape chars
	sky = "#00b3d6", -- oklch(0.70 15 215) Classes, types, bold markup
	blue = "#3ba6f5", -- oklch(0.70 15 245) Variables, identifiers
	purple = "#968ff7", -- oklch(0.70 15 285) Keywords, storage, changed items
	pink = "#cc7bd1", -- oklch(0.70 15 325) Deprecated, special tags

	-- Accent colors (lighter, used for ANSI colors)
	bright_red = "#ff9890", -- oklch(0.80 15 25) Errors, critical items
	bright_orange = "#ffa156", -- oklch(0.80 15 55) Warnings, numbers, constants
	bright_yellow = "#e3b831", -- oklch(0.80 15 90) Attention, search highlights
	bright_green = "#7bd77f", -- oklch(0.80 15 145) Success, strings, added items
	bright_teal = "#00dcca", -- oklch(0.80 15 185) Special elements, regex, escape chars
	bright_sky = "#00d5f9", -- oklch(0.80 15 215) Classes, types, bold markup
	bright_blue = "#6fc6ff", -- oklch(0.80 15 245) Variables, identifiers
	bright_purple = "#b5b2ff", -- oklch(0.80 15 285) Keywords, storage, changed items
	bright_pink = "#dd8be2", -- oklch(0.80 15 325) Deprecated, special tags

	-- Diff colors
	jade = "#001200", -- oklch(0.15 3 145) Very dark green background
	amber = "#1c0300", -- oklch(0.15 3 55) Very dark orange background
	ice = "#000b26", -- oklch(0.15 3 245) Very dark blue background

	-- Special
	none = "NONE",
}

---@param opts? table
---@return table
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
