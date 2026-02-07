local config = require("oxide.config")

local M = {}

-- Oxide color palette
---@class Palette
local palette = {
	-- Surface colors
	mantle = "#0b0b0b", -- oklch(0.15 0 0) Mantle
	base = "#161616", -- oklch(0.20 0 0) Main background
	surface0 = "#222222", -- oklch(0.25 0 0) Cursor background
	surface1 = "#262626", -- oklch(0.27 0 0) Subtle backgrounds

	-- Text colors
	text = "#cecece", -- oklch(0.85 0 0) Primary text
	subtext0 = "#bebebe", -- oklch(0.80 0 0) Secondary text
	subtext1 = "#8f8f8f", -- oklch(0.65 0 0) Muted text
	subtext2 = "#484848", -- oklch(0.40 0 0) Comments, borders, subtle elements

	-- Accent colors
	red = "#ff6370", -- Errors, critical items
	orange = "#ff9500", -- Warnings, numbers, constants
	yellow = "#ffd43b", -- Attention, search highlights
	green = "#42be65", -- Success, strings, added items
	teal = "#08bdba", -- Special elements, regex, escape chars
	sky = "#1aa7ff", -- Classes, types, bold markup
	sapphire = "#33b1ff", -- Functions, methods, headings
	blue = "#33b1ff", -- Variables, identifiers
	purple = "#be95ff", -- Keywords, storage, changed items
	pink = "#ee5396", -- Deprecated, special tags

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
