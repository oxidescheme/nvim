-- Syntax highlighting groups
local M = {}

function M.setup(colors, config)
	local c = colors.colors
	local styles = config.styles or {}

	return {
		-- Comments
		Comment = vim.tbl_extend("force", { fg = c.subtext1 }, styles.comments or {}),

		-- Constants
		Constant = { fg = c.orange },
		String = vim.tbl_extend("force", { fg = c.green }, styles.strings or {}),
		Character = { fg = c.green },
		Number = vim.tbl_extend("force", { fg = c.orange }, styles.numbers or {}),
		Boolean = vim.tbl_extend("force", { fg = c.orange }, styles.booleans or {}),
		Float = { fg = c.orange },

		-- Identifiers and functions
		Identifier = vim.tbl_extend("force", { fg = c.text }, styles.variables or {}),
		Function = vim.tbl_extend("force", { fg = c.teal }, styles.functions or {}),

		-- Statements
		Statement = { fg = c.purple },
		Conditional = vim.tbl_extend("force", { fg = c.purple }, styles.keywords or {}),
		Repeat = vim.tbl_extend("force", { fg = c.purple }, styles.keywords or {}),
		Label = { fg = c.purple },
		Operator = { fg = c.text },
		Keyword = vim.tbl_extend("force", { fg = c.purple }, styles.keywords or {}),
		Exception = { fg = c.purple },

		-- Preproc
		PreProc = { link = "Keyword" },
		Include = { link = "Keyword" },
		Define = { link = "Keyword" },
		Macro = { link = "Constant" },
		PreCondit = { link = "Keyword" },

		-- Types
		Type = { fg = c.sky },
		StorageClass = { fg = c.purple },
		Structure = { fg = c.sky },
		Typedef = { fg = c.sky },

		-- Special
		Special = { fg = c.text },
		SpecialChar = { fg = c.text },
		Tag = { fg = c.pink },
		Delimiter = { fg = c.text },
		SpecialComment = { fg = c.subtext1 },
		Debug = { fg = c.pink },

		-- Error
		Error = { fg = c.red },
		Todo = { fg = c.yellow, bold = true },

		-- Added for better syntax support
		Variable = { link = "Identifier" },
		Field = { link = "Property" },
		Property = { fg = c.blue },
		Parameter = { link = "Variable" },
	}
end

return M
