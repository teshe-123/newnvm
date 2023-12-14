return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup {
      user_default_options = { tailwind = true },
      -- all the sub-options of filetypes apply to buftypes
    }
  end,
}
