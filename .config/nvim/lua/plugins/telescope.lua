-- TODO: consider more telescope plugins (https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions#different-plugins-with-telescope-integration)
function open_file_history() 
  require("telescope.builtin").git_bcommits()
end

return {
  "nvim-telescope/telescope.nvim",
  name = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
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
        file_sorter = require("telescope.sorters").get_fzy_sorter,
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
  },
  keys = {
    -- find
    { "<leader>ff", require("telescope.builtin").find_files,                desc = "Find: Files" },
    { "<leader>fg", require("telescope.builtin").git_files,                 desc = "Find: Git Files" },
    { "<leader>fb", require("telescope.builtin").buffers,                   desc = "Find: Buffers" },
    { "<leader>fl", require("telescope.builtin").live_grep,                 desc = "Find: Everywhere" },
    { "<leader>f/", require("telescope.builtin").current_buffer_fuzzy_find, desc = "Find: In Current Buffer" },

    -- version control
    { "<leader>vb", require("telescope.builtin").git_branches, desc = "Git: Branches" },
    { "<leader>vs", require("telescope.builtin").git_status,   desc = "Git: Status" },
    { "<leader>vh", require("telescope.builtin").git_commits,  desc = "Git: History" },
    { "<leader>vf", require("telescope.builtin").git_bcommits, desc = "Git: File History" },
    { "<leader>vt", require("telescope.builtin").git_stash,    desc = "Git: Stashes" },
    
    -- lsp / language
    { "<leader>lr", require("telescope.builtin").lsp_references,        desc = "LSP: References" },
    { "<leader>ld", require("telescope.builtin").lsp_definitions,       desc = "LSP: Definitions" },
    { "<leader>li", require("telescope.builtin").lsp_implementations,   desc = "LSP: Implementations" },
    { "<leader>lt", require("telescope.builtin").lsp_type_definitions,  desc = "LSP: Type Definitions" },
    { "<leader>ls", require("telescope.builtin").lsp_document_symbols,  desc = "LSP: Document Symbols" },
    { "<leader>lS", require("telescope.builtin").lsp_workspace_symbols, desc = "LSP: Workspace Symbols" },
  },
}
