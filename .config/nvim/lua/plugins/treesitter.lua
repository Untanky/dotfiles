return {
  "nvim-treesitter/nvim-treesitter",
  name = "Treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "javascript", "html", "typescript", "css", "dockerfile", "go", "gosum", "gomod", "json",
        "yaml", "git_rebase", "gitcommit", "gitignore", "terraform"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
