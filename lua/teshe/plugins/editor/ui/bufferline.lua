return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	keys = {
		{ "n", "<leader>tl", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab" } },
		{ "n", "<leader>th", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab" } },
		{ "n", "<leader>tx", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other tabs" } },
	},

	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = true, -- use a "true" to enable the default, or set your own character
						highlight = "NvimTreeNormal",
					},
				},

				indicator = {
					icon = "",
					style = "none",
				},
				-- or you can combine these e.g.
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
				},
			},
		})
		-- code
	end,
}
