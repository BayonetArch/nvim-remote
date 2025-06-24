-- ----------Fuzzy file picker---------------
-- --------Better than telescope ------------
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader><Space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
  },
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    })
    
    telescope.load_extension("fzf")
  end,
}
