local M = {}

M.defaults = {
	transparent = false,
	terminal_colors = true,

	styles = {
		comments = { italic = true },
		keywords = { bold = true },
		variables = {},
		strings = {},
		booleans = {},
		numbers = {},
	},

	-- Override colors
	on_colors = nil,

	-- Override highlight groups
	on_highlights = nil,
}

M.options = M.defaults

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

function M.extend(opts)
	return vim.tbl_deep_extend("force", {}, M.options, opts or {})
end

return M
