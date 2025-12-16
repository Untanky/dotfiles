return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "javascript", "html", "typescript", "css", "dockerfile", "go", "gosum", "gomod", "json",
      "yaml", "git_rebase", "gitcommit", "gitignore", "terraform"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  }
}
