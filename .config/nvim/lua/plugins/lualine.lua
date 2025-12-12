return {
  'nvim-lualine/lualine.nvim',
  name = "Lualine",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_x = { 'lsp_status', 'filetype' },
      lualine_z = { 'searchcount', 'selectioncount', 'location' },
    },
  },
}
