-- nvim-treesitter/nvim-treesitter-context integration highlights
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors

	return {
		-- Separator line (if separator is enabled in treesitter-context config)
		TreesitterContextSeparator = {
			fg = c.subtext2,
		},

		-- Bottom border with underline for distinction - inherits syntax highlighting, only adds underline
		TreesitterContextBottom = {
			underline = true,
			sp = c.subtext2,
		},
	}
end

return M
