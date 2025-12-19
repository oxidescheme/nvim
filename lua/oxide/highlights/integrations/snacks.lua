-- Snacks.nvim integration highlights
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors

	return {
		-- Dashboard
		SnacksDashboardFooter = { fg = c.subtext0 },
		SnacksDashboardKey = { fg = c.text, { bold = true } },
		SnacksBackdrop = { bg = "NONE" },
	}
end

return M
