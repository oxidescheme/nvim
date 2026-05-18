-- Blink.cmp integration highlights
local M = {}

function M.setup(colors, config)
	return {
		BlinkCmpDoc = { link = "Pmenu" },
		BlinkCmpDocSeparator = { link = "Pmenu" },
		BlinkCmpDocBorder = { link = "Pmenu" },
		BlinkCmpDocCursorLine = { link = "PmenuSel" },
		BlinkCmpDocVisual = { link = "PmenuSel" },
	}
end

return M
