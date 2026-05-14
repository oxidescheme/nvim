-- render-markdown.nvim integration highlights
local M = {}

local function hex_to_rgb(hex)
	return tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16)
end

local function blend(fg, bg, amount)
	if fg == "NONE" or bg == "NONE" then
		return bg
	end

	local fr, fg_green, fb = hex_to_rgb(fg)
	local br, bg_green, bb = hex_to_rgb(bg)

	local r = math.floor(br + (fr - br) * amount + 0.5)
	local g = math.floor(bg_green + (fg_green - bg_green) * amount + 0.5)
	local b = math.floor(bb + (fb - bb) * amount + 0.5)

	return string.format("#%02x%02x%02x", r, g, b)
end

function M.setup(colors, config)
	local c = colors.colors
	local heading_bg = c.base == "NONE" and c.surface0 or c.base
	local heading_bg_blend = 0.14

	return {
		-- Heading foregrounds (icons)
		RenderMarkdownH1 = { fg = c.blue, bold = true },
		RenderMarkdownH2 = { fg = c.sky, bold = true },
		RenderMarkdownH3 = { fg = c.teal, bold = true },
		RenderMarkdownH4 = { fg = c.green, bold = true },
		RenderMarkdownH5 = { fg = c.lime, bold = true },
		RenderMarkdownH6 = { fg = c.yellow, bold = true },

		-- Heading backgrounds (accent tinted, Catppuccin-style)
		RenderMarkdownH1Bg = { bg = blend(c.blue, heading_bg, heading_bg_blend) },
		RenderMarkdownH2Bg = { bg = blend(c.sky, heading_bg, heading_bg_blend) },
		RenderMarkdownH3Bg = { bg = blend(c.teal, heading_bg, heading_bg_blend) },
		RenderMarkdownH4Bg = { bg = blend(c.green, heading_bg, heading_bg_blend) },
		RenderMarkdownH5Bg = { bg = blend(c.lime, heading_bg, heading_bg_blend) },
		RenderMarkdownH6Bg = { bg = blend(c.yellow, heading_bg, heading_bg_blend) },

		-- Code blocks
		RenderMarkdownCode = { bg = c.mantle },
		RenderMarkdownCodeInfo = { fg = c.subtext1, bg = c.mantle },
		RenderMarkdownCodeBorder = { bg = c.mantle },
		RenderMarkdownCodeFallback = { fg = c.subtext1, bg = c.mantle },
		RenderMarkdownCodeInline = { fg = c.orange, bg = c.surface0 },

		-- Quotes
		RenderMarkdownQuote = { fg = c.subtext1 },
		RenderMarkdownQuote1 = { fg = c.blue },
		RenderMarkdownQuote2 = { fg = c.sky },
		RenderMarkdownQuote3 = { fg = c.teal },
		RenderMarkdownQuote4 = { fg = c.green },
		RenderMarkdownQuote5 = { fg = c.lime },
		RenderMarkdownQuote6 = { fg = c.yellow },

		-- Lists
		RenderMarkdownBullet = { fg = c.purple },
		RenderMarkdownDash = { fg = c.surface2 },

		-- Checkboxes
		RenderMarkdownUnchecked = { fg = c.subtext1 },
		RenderMarkdownChecked = { fg = c.green },
		RenderMarkdownTodo = { fg = c.yellow },

		-- Tables
		RenderMarkdownTableHead = { fg = c.blue, bold = true },
		RenderMarkdownTableRow = { fg = c.text },

		-- Callouts
		RenderMarkdownSuccess = { fg = c.green },
		RenderMarkdownInfo = { fg = c.blue },
		RenderMarkdownHint = { fg = c.sky },
		RenderMarkdownWarn = { fg = c.orange },
		RenderMarkdownError = { fg = c.red },

		-- Links
		RenderMarkdownLink = { fg = c.sky },
		RenderMarkdownLinkTitle = { fg = c.blue },
		RenderMarkdownWikiLink = { fg = c.purple },

		-- Misc
		RenderMarkdownSign = { bg = c.base },
		RenderMarkdownMath = { fg = c.teal },
		RenderMarkdownIndent = { fg = c.surface2 },
		RenderMarkdownHtmlComment = { fg = c.subtext2, italic = true },
	}
end

return M
