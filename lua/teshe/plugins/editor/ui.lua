return {
	"nvim-tree/nvim-tree.lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		-- bufferline
		{
			"akinsho/bufferline.nvim",
			version = "*",
			config = function()
				local bufferline = require("bufferline")
				bufferline.setup({
					options = {
						offsets = {
							{
								filetype = "NvimTree",
								text = "File Explorer",
								highlight = "Directory",
								separator = true, -- use a "true" to enable the default, or set your own character
							},
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
		},

		-- indentation

		{
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
		},
		{
			"stevearc/dressing.nvim",
			event = "VeryLazy",
		},
	},

	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 30,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = false,
				},
				icons = {
					show = {
						diagnostics = false,
					},
				},
				highlight_diagnostics = true,
				indent_width = 1,
				root_folder_label = false,
			},
			diagnostics = {
				show_on_dirs = true,
				enable = true,
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},

			git = {
				ignore = true,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
