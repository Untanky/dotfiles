-- TODO: consider more telescope plugins (https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions#different-plugins-with-telescope-integration)
return {
  "nvim-telescope/telescope.nvim",
  name = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",                 desc = "Find git files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Find buffers" },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>",                 desc = "Live grep" },
    { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer" },
  },
}
