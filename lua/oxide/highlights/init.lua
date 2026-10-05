-- Main highlight manager
local M = {}

-- Import highlight modules
local editor = require("oxide.highlights.editor")
local syntax = require("oxide.highlights.syntax")
local treesitter = require("oxide.highlights.treesitter")
local lsp = require("oxide.highlights.lsp")

-- Keep this list in sync with the bundled integration modules.
local integration_names = {
	"blinkcmp",
	"flash",
	"render_markdown",
	"snacks",
	"treesitter_context",
}

local function load_integrations(colors, config)
	local integrations = {}

	for _, module_name in ipairs(integration_names) do
		local module_path = "oxide.highlights.integrations." .. module_name
		local success, integration_module = pcall(require, module_path)
		if success and integration_module and type(integration_module.setup) == "function" then
			local int_success, integration_highlights = pcall(integration_module.setup, colors, config)
			if int_success and integration_highlights then
				integrations = vim.tbl_extend("force", integrations, integration_highlights)
			end
		end
	end

	return integrations
end

function M.setup(colors, config)
	local highlights = {}

	-- Merge all highlight groups
	highlights = vim.tbl_extend("force", highlights, editor.setup(colors, config))
	highlights = vim.tbl_extend("force", highlights, syntax.setup(colors, config))
	highlights = vim.tbl_extend("force", highlights, treesitter.setup(colors, config))
	highlights = vim.tbl_extend("force", highlights, lsp.setup(colors, config))

	-- Merge bundled integrations
	highlights = vim.tbl_extend("force", highlights, load_integrations(colors, config))

	-- Apply user overrides
	if config.on_highlights then
		highlights = config.on_highlights(highlights, colors.colors) or highlights
	end

	return highlights
end

return M
