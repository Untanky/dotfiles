local wk = require('which-key')

local mapping = {
  -- make editing nicer
  { "<C-d>", "<C-d>zz", desc = "Half page down and center" },
  { "<C-u>", "<C-u>zz", desc = "Half page up and center" },
  { "n",     "nzzzv",   desc = "Next search result and center" },
  { "N",     "Nzzzv",   desc = "Previous search result and center" },
  -- { "Q"      "<nop>",   desc = "Disable Ex mode" },

  -- groups
  { "<leader>f", group = "Find" },
  { "<leader>v", group = "Git" },
  { "<leader>l", group = "LSP" },
}

wk.add(mapping)

local lsp_attach_autogroup = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true })
vim.api.nvim_create_autocmd({ 'LspAttach' }, {
  group = lsp_attach_autogroup,
  callback = function(event)
    local bufnr = event.buf
    -- Only add mappings if not already set for this buffer
    if vim.b[bufnr].lsp_mappings_set then return end
    vim.b[bufnr].lsp_mappings_set = true

    local mappings = {
      -- { 'gd',         vim.lsp.buf.definition,       desc = 'Goto Definition' },
      -- { 'gD',         vim.lsp.buf.declaration,      desc = 'Goto Declaration' },
      -- { 'gi',         vim.lsp.buf.implementation,   desc = 'Goto Implementation' },
      -- { 'gt',         vim.lsp.buf.type_definition,  desc = 'Goto Type Definition' },
      -- { 'gr',         vim.lsp.buf.references,       desc = 'Goto References' },
      -- { 'K',          vim.lsp.buf.hover,            desc = 'Hover Documentation' },
      -- { '<C-k>',      vim.lsp.buf.signature_help,   desc = 'Signature Documentation' },
      { '<leader>l',  group = "LSP" },
      { '<leader>la', vim.lsp.buf.code_action,      desc = 'Code Action' },
      { '<leader>lr', vim.lsp.buf.rename,           desc = 'Rename' },
      { '<leader>ld', vim.diagnostic.open_float,    desc = 'Show Diagnostics' },
      { '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = 'Previous Diagnostic' },
      { ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, desc = 'Next Diagnostic' },
    }

    wk.add(mappings)
  end,
})

-- vim.api.nvim_create_autocmd({'LspAttach'}, {
--   callback = function()
--     local clients = vim.lsp.get_clients()
--     for _, client in ipairs(clients) do
--       local id = client.id
--       vim.lsp.completion.enable(true, id, 0, {autotrigger = true})
--     end
--   end,
--   group = lsp_au_group,
-- })

