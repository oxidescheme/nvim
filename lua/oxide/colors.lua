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
	red = "#ff5655", -- oklch(0.70 17 25) Errors, critical items
	orange = "#f67400", -- oklch(0.70 17 55) Warnings, numbers, constants
	yellow = "#be9b00", -- oklch(0.70 17 95) Attention, search highlights
	green = "#00c300", -- oklch(0.70 17 145) Success, strings, added items
	teal = "#00baaa", -- oklch(0.70 17 185) Special elements, regex, escape chars
	sky = "#00b3d6", -- oklch(0.70 17 215) Classes, types, bold markup
	blue = "#00a6ff", -- oklch(0.70 17 245) Variables, identifiers
	purple = "#9588ff", -- oklch(0.70 17 285) Keywords, storage, changed items
	pink = "#fb00ff", -- oklch(0.70 17 325) Deprecated, special tags

	-- Accent colors (lighter, used for ANSI colors)
	bright_red = "#ff7b74", -- oklch(0.75 17 25) Errors, critical items
	bright_orange = "#ff8300", -- oklch(0.75 17 55) Warnings, numbers, constants
	bright_yellow = "#d0ab00", -- oklch(0.75 17 95) Attention, search highlights
	bright_green = "#00d600", -- oklch(0.75 17 145) Success, strings, added items
	bright_teal = "#00ccba", -- oklch(0.75 17 185) Special elements, regex, escape chars
	bright_sky = "#00c5ea", -- oklch(0.75 17 215) Classes, types, bold markup
	bright_blue = "#40b6ff", -- oklch(0.75 17 245) Variables, identifiers
	bright_purple = "#a59dff", -- oklch(0.75 17 285) Keywords, storage, changed items
	bright_pink = "#ff56ff", -- oklch(0.75 17 325) Deprecated, special tags

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
