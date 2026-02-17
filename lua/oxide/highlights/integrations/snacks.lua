-- Snacks.nvim integration highlights
local M = {}

function M.setup(colors, config)
	local c = colors.colors

	return {
		-- Dashboard
		SnacksDashboardHeader = { fg = c.subtext1 },
		SnacksDashboardFooter = { fg = c.subtext1 },
		SnacksDashboardKey = { fg = c.text, { bold = true } },
		SnacksBackdrop = { bg = "NONE" },
		SnacksPickerMatch = { fg = c.blue },
	}
end

return M
