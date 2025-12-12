return {
  "nvim-neo-tree/neo-tree.nvim",
  name = "Neo-tree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,                    -- neo-tree will lazily load itself
  opts = {
    close_if_last_window = true,
    popup_border_style = "",
    enable_git_status = true,
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
