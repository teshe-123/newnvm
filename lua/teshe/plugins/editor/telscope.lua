return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- path_display = { "truncate " },
				-- layout_strategy = "horizontal",
				-- layout_config = { height = 0.95, width = 0.95, prompt_position = "top" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
			pickers = {
				find_files = {
					theme = "ivy",
					layout_strategy = "horizontal",
				},
				buffers = {
					theme = "ivy",
					layout_strategy = "horizontal",
				},
				lsp_document_symbols = {
					theme = "ivy",
					layout_strategy = "horizontal",
				},
				lsp_dynamic_workspace_symbols = {
					theme = "ivy",
					layout_strategy = "horizontal",
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>p", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Fuzzy find recent files" })
		keymap.set(
			"n",
			"<leader>P",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			{ desc = "Find string in cwd" }
		)
	end,
}
