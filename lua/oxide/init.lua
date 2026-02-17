local config = require("oxide.config")
local colors = require("oxide.colors")
local highlights = require("oxide.highlights")
local util = require("oxide.util")

local M = {}

function M.setup(opts)
	config.setup(opts)
end

function M.load(opts)
	-- Clear existing highlights
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "oxide"

	-- Get colors and highlights
	local color_scheme = colors.setup(opts)
	local highlight_groups = highlights.setup(color_scheme, color_scheme.config)

	-- Apply all highlights
	util.apply_highlights(highlight_groups)

	-- Set terminal colors (if enabled)
	if color_scheme.config.terminal_colors then
		M.set_terminal_colors(color_scheme.colors)
	end
end

-- Convenience function to load with current config
function M.colorscheme()
	M.load()
end

-- Set terminal colors using the color palette
function M.set_terminal_colors(c)
	-- Terminal colors (ANSI 0-15)
	vim.g.terminal_color_0 = c.surface1 -- Black (dark)
	vim.g.terminal_color_1 = c.red -- Red (normal)
	vim.g.terminal_color_2 = c.green -- Green (normal)
	vim.g.terminal_color_3 = c.yellow -- Yellow (normal)
	vim.g.terminal_color_4 = c.blue -- Blue (normal)
	vim.g.terminal_color_5 = c.purple -- Magenta (normal)
	vim.g.terminal_color_6 = c.teal -- Cyan (normal)
	vim.g.terminal_color_7 = c.text -- White (normal)

	-- Bright colors (ANSI 8-15)
	vim.g.terminal_color_8 = c.subtext1 -- Black (bright)
	vim.g.terminal_color_9 = c.bright_red -- Red (bright)
	vim.g.terminal_color_10 = c.bright_green -- Green (bright)
	vim.g.terminal_color_11 = c.bright_yellow -- Yellow (bright)
	vim.g.terminal_color_12 = c.bright_blue -- Blue (bright)
	vim.g.terminal_color_13 = c.bright_purple -- Magenta (bright)
	vim.g.terminal_color_14 = c.bright_teal -- Cyan (bright)
	vim.g.terminal_color_15 = c.bright_text -- White (bright)
end

return M
