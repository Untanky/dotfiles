return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local sorters = require("telescope.sorters")

    return {
      pickers = {
        find_files = {
          prompt_prefix = "",
          layout_strategy = "vertical",
          layout_config = {
            anchor = "N",
            anchor_padding = 0,
            height = 0.7,
            width = 0.6,
            mirror = true,
            prompt_position = "top",
          },
          file_sorter = sorters.get_fzy_sorter(),
        },

        git_branches = {
          prompt_prefix = " 🔍 ",
          previewer = false,
          layout_strategy = "vertical",
          layout_config = {
            anchor = "N",
            anchor_padding = 0,
            height = 0.4,
            width = 0.6,
            mirror = true,
            prompt_position = "top",
          },

        }
      },
    }
  end,
  keys = {
    -- find
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find: Files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find: Git Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find: Buffers" },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Find: Everywhere" },
    { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find: In Current Buffer" },

    -- version control
    { "<leader>vb", "<cmd>Telescope git_branches<cr>", desc = "Git: Branches" },
    { "<leader>vs", "<cmd>Telescope git_status<cr>", desc = "Git: Status" },
    { "<leader>vh", "<cmd>Telescope git_commits<cr>", desc = "Git: History" },
    { "<leader>vf", "<cmd>Telescope git_bcommits<cr>", desc = "Git: File History" },
    { "<leader>vt", "<cmd>Telescope git_stash<cr>", desc = "Git: Stashes" },

    -- lsp
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP: References" },
    { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP: Definitions" },
    { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP: Implementations" },
    { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "LSP: Type Definitions" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP: Document Symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP: Workspace Symbols" },
  },
}
