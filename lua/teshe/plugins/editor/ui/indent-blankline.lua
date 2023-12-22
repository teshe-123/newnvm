return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local highlight = {
			"RainbowRed",
		}
		local hooks = require("ibl.hooks")
		local whitespace = require("ibl.indent").whitespace

		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#292929", bold = false })
		end)

		hooks.register(hooks.type.WHITESPACE, function(_, _, _, whitespace_tbl)
			if whitespace_tbl[1] == whitespace.INDENT then
				whitespace_tbl[1] = whitespace.SPACE
			end
			return whitespace_tbl
		end)
		require("ibl").setup({
			indent = { highlight = highlight, char = "┊" },
			scope = { enabled = false },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
		})
	end,
}
