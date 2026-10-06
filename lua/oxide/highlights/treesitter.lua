-- TreeSitter highlighting groups - Direct semantic colors
local M = {}

function M.setup(colors, config)
	local c = colors.colors

	return {
		-- Comments
		["@comment"] = { link = "Comment" },

		-- Constants
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = c.orange },
		["@constant.macro"] = { link = "Macro" },

		-- Strings and characters
		["@string"] = { link = "String" },
		["@string.special"] = { fg = c.pink },
		["@character"] = { link = "Character" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@float"] = { link = "Float" },

		-- Neutral variables and parameters, blue properties and fields
		["@variable"] = { link = "Variable" },
		["@variable.builtin"] = { link = "Variable" },
		["@variable.parameter"] = { link = "Parameter" },
		["@variable.parameter.builtin"] = { link = "Parameter" },
		["@variable.member"] = { link = "Property" },
		["@property"] = { link = "Property" },
		["@field"] = { link = "Field" },

		-- Functions
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@function.macro"] = { link = "Function" },
		["@function.call"] = { link = "Function" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },
		["@method"] = { link = "Function" },
		["@method.call"] = { link = "Function" },
		["@constructor"] = { fg = c.text },

		-- Keywords
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { fg = c.purple },
		["@keyword.return"] = { fg = c.purple },
		["@keyword.operator"] = { fg = c.purple },
		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@exception"] = { link = "Exception" },

		-- Operators
		["@operator"] = { link = "Operator" },
		["@operator.pointer"] = { fg = c.teal },

		-- Types
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = c.sky },
		["@type.definition"] = { fg = c.sky },
		["@module"] = { link = "Type" },
		["@storageclass"] = { link = "StorageClass" },
		["@structure"] = { link = "Structure" },

		-- Preprocessor
		["@preproc"] = { link = "PreProc" },
		["@include"] = { link = "Include" },
		["@define"] = { link = "Define" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },

		-- Special
		["@special"] = { link = "Special" },
		["@attribute"] = { fg = c.teal },
		["@tag"] = { fg = c.pink },
		["@tag.attribute"] = { fg = c.teal },
		["@tag.delimiter"] = { link = "Delimiter" },

		-- Punctuation
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = c.text },

		-- Literals
		["@string.regex"] = { fg = c.teal },
		["@string.regexp"] = { link = "@string.regex" },
		["@string.escape"] = { fg = c.pink },

		-- Markup (Markdown, etc.)
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strikethrough"] = { strikethrough = true },

		["@markup.heading"] = { fg = c.blue, bold = true },
		["@markup.heading.1"] = { fg = c.blue, bold = true },
		["@markup.heading.2"] = { fg = c.sky, bold = true },
		["@markup.heading.3"] = { fg = c.teal, bold = true },
		["@markup.heading.4"] = { fg = c.green, bold = true },
		["@markup.heading.5"] = { fg = c.lime, bold = true },
		["@markup.heading.6"] = { fg = c.yellow, bold = true },

		["@markup.raw"] = { fg = c.orange },
		["@markup.raw.block"] = { fg = c.text },
		["@markup.quote"] = { fg = c.subtext1, italic = true },

		["@markup.link"] = { fg = c.text },
		["@markup.link.label"] = { fg = c.blue },
		["@markup.link.url"] = { fg = c.sky, underline = true },

		["@markup.list"] = { fg = c.purple },
		["@markup.list.checked"] = { fg = c.green },
		["@markup.list.unchecked"] = { fg = c.subtext1 },

		-- Errors
		["@error"] = { link = "Error" },
		["@warning"] = { fg = c.orange },
	}
end

return M
