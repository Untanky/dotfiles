local vscode_preview_layout = {
  -- hidden = { "preview" },
  layout = {
    backdrop = false,
    row = 0,
    width = 0.4,
    min_width = 80,
    height = 0.5,
    border = true,
    box = "vertical",
    { win = "input", height = 1, border = "bottom", title = "{title} {live} {flags}", title_pos = "center" },
    { win = "list", border = "hpad", height = 6 },
    { win = "preview", title = "Preview", border = "top" },
  },
}

local vscode_layout = {
  hidden = { "preview" },
  layout = {
    backdrop = false,
    row = 0,
    width = 0.4,
    min_width = 80,
    height = 0.5,
    border = true,
    box = "vertical",
    actions = {
      ["<C-p>"] = { "toggle_preview" }
    },
    { win = "input", height = 1, border = "bottom", title = "{title} {live} {flags}", title_pos = "center" },
    { win = "list", border = "hpad", height = 6 },
    { win = "preview", title = "Preview", border = "top" },
  },
}

return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    explorer = {},
    indent = {
      indent = {
        enabled = false,
      },
      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
        },
      },
    },
    picker = {
      sources = {
        files = {
          layout = vscode_preview_layout,
        },
        explorer = {
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
        },
      },
    },
    scope = {},
    scroll = {},
  },
  keys = {
    -- explorer
    { "<leader>e", function() Snacks.picker.explorer() end, desc = "Open explorer" },

    -- find
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find: Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find: Git Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find: Buffers" },
    { "<leader>fl", function() Snacks.picker.grep() end, desc = "Find: Everywhere" },
    -- { "<leader>f/", function() Snacks.picker.foo() end, desc = "Find: In Current Buffer" },

    -- version control
    { "<leader>vb", function() Snacks.picker.git_branches() end, desc = "Git: Branches" },
    { "<leader>vs", function() Snacks.picker.git_status() end, desc = "Git: Status" },
    { "<leader>vh", function() Snacks.picker.git_log() end, desc = "Git: History" },
    { "<leader>vf", function() Snacks.picker.git_log_file() end, desc = "Git: File History" },
    { "<leader>vt", function() Snacks.picker.git_stash() end, desc = "Git: Stashes" },

    -- lsp
    { "gr", function() Snacks.picker.lsp_references() end, desc = "LSP: References" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "LSP: Definitions" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "LSP: Workspace Symbols" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "LSP: Implementations" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "LSP: Type Definitions" },
    { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP: Document Symbols" },
    { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP: Workspace Symbols" },
  },

}
