-- Flash.nvim integration highlights
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors

	return {
		-- Flash label
		FlashLabel = { fg = c.text, bg = c.base, bold = true },
	}
end

return M
