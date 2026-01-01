vim.g.mapleader = " "
vim.g.maplocalleader = "//"

require('config.lazy')
require('config.colorscheme')
require('config.settings')
require('config.key-mapping')
require('config.autocmd')

vim.lsp.enable({ "gopls", "luals", "tailwindcss", "html", "templ", "vtsls", "vue" })
