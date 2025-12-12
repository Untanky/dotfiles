return {
  "folke/which-key.nvim",
  name = "Which Key",
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
