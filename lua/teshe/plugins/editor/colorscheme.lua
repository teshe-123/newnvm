-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	dependencies = { "rebelot/kanagawa.nvim" },
-- 	priority = 1000, -- Ensure it loads first
-- 	config = function()
-- 		local color = require("onedarkpro.helpers")
--
-- 		local colors = color.get_preloaded_colors()
-- 		require("onedarkpro").setup({
-- 			highlights = {
-- 				TermCursor = { bg = "#cccccc" }, -- cursor in a focused terminal
-- 				TermCursorNC = { bg = "none" },
-- 				BufferLineOffsetSeparator = { link = "VertSplit" },
-- 			},
-- 			options = {
-- 				cursorline = false, -- Use cursorline highlighting?
-- 				transparency = false, -- Use a transparent background?
-- 				terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
-- 				highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
-- 			},
-- 		})
--
-- 		vim.api.nvim_set_hl(0, "TermCursorNC", { bg = "none" })
--
-- 		vim.api.nvim_set_hl(0, "TermCursor", { bg = "none" })
-- 		-- Change terminal cursor highlight group to none
-- 		vim.cmd("colorscheme  kanagawa")
-- 	end,
-- 	-- { "EdenEast/nightfox.nvim" },
-- 	-- config = function()
-- 	-- 	vim.cmd("colorscheme nightfox")
-- 	-- end,
-- }
return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			-- Your config here
			background = "hard",
			transparent_background_level = 0,
		})

		vim.cmd("colorscheme everforest")
	end,
}
