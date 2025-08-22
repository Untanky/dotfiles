vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {})

vim.cmd('colorscheme catppuccin-macchiato')

vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true

vim.opt.undofile = true
vim.opt.mouse = "a"

local which_key = require('which-key')
local builtin = require('telescope.builtin')
local cmp = require('cmp')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    -- Only add mappings if not already set for this buffer
    if vim.b[bufnr].lsp_mappings_set then return end
    vim.b[bufnr].lsp_mappings_set = true

    local mappings = {
      { 'gd',         vim.lsp.buf.definition,       desc = 'Goto Definition' },
      { 'gD',         vim.lsp.buf.declaration,      desc = 'Goto Declaration' },
      { 'gi',         vim.lsp.buf.implementation,   desc = 'Goto Implementation' },
      { 'gt',         vim.lsp.buf.type_definition,  desc = 'Goto Type Definition' },
      { 'gr',         vim.lsp.buf.references,       desc = 'Goto References' },
      { 'K',          vim.lsp.buf.hover,            desc = 'Hover Documentation' },
      { '<C-k>',      vim.lsp.buf.signature_help,   desc = 'Signature Documentation' },
      { '<leader>l',  group = "LSP" },
      { '<leader>la', vim.lsp.buf.code_action,      desc = 'Code Action' },
      { '<leader>lr', vim.lsp.buf.rename,           desc = 'Rename' },
      { '<leader>lw', vim.lsp.buf.workspace_symbol, desc = 'Workspace Symbol' },
      { '<leader>ld', vim.diagnostic.open_float,    desc = 'Show Diagnostics' },
      { '[d',         vim.diagnostic.goto_prev,     desc = 'Previous Diagnostic' },
      { ']d',         vim.diagnostic.goto_next,     desc = 'Next Diagnostic' },
    }

    which_key.add(mappings)
  end
})

local mappings = {
  -- make editing nicer
  { "<C-d>",      "<C-d>zz",          desc = "Half page down and center" },
  { "<C-u>",      "<C-u>zz",          desc = "Half page up and center" },
  { "n",          "nzzzv",            desc = "Next search result and center" },
  { "N",          "Nzzzv",            desc = "Previous search result and center" },
  { "Q",          "<nop>",            desc = "Disable Ex mode" },

  -- telescope bindings
  { "<leader>f",  group = "Find" },
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  { "<leader>fg", builtin.git_files,  desc = "Find git files" },
  { "<leader>fl", builtin.live_grep,  desc = "Live grep" },
  { "<leader>fb", builtin.buffers,    desc = "Find buffers" },

  { "<Down>",     mode = "i",         desc = "Next completion item" },
  { "<Up>",       mode = "i",         desc = "Previous completion item" },
}

which_key.add(mappings)

-- local format_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = format_group,
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group =
-- })
