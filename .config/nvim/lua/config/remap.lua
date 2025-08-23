local which_key = require('which-key')
local builtin = require('telescope.builtin')
local cmp = require('cmp')
local neotree = require('neo-tree.command')
local neotree_manager = require('neo-tree.sources.manager')

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

local function toggle_neotree(position)
  local state = neotree_manager.get_state('filesystem')
  if state and state.winid and vim.api.nvim_win_is_valid(state.winid) then
    local current_position = state.current_position or "unknown"
    if current_position == position then
      -- If it's already open in the same position and focused → close
      if vim.api.nvim_get_current_win() == state.winid then
        neotree.execute({ action = "close" })
      else
        -- If it's open but not focused → focus it
        neotree.execute({})
      end
    else
      -- If it's open in a different position → reopen in new position
      neotree.execute({ action = "close" })
      neotree.execute({ position = position, reveal = true })
    end
  else
    -- If not open → open in requested position
    neotree.execute({ position = position, reveal = true })
  end
end

local mappings = {
  -- make editing nicer
  { "<C-d>",      "<C-d>zz",          desc = "Half page down and center" },
  { "<C-u>",      "<C-u>zz",          desc = "Half page up and center" },
  { "n",          "nzzzv",            desc = "Next search result and center" },
  { "N",          "Nzzzv",            desc = "Previous search result and center" },
  { "Q",          "<nop>",            desc = "Disable Ex mode" },

  -- groups
  { "<leader>f",  group = "Find" },
  { "<leader>g",  group = "Git" },

  -- telescope bindings
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  { "<leader>fg", builtin.git_files,  desc = "Find git files" },
  { "<leader>fl", builtin.live_grep,  desc = "Live grep" },
  { "<leader>fb", builtin.buffers,    desc = "Find buffers" },

  -- neo tree bindings
  {
    "<leader>fs",
    function()
      toggle_neotree("left")
    end,
    desc = "Toggle file explorer on the left"
  },
  {
    "<leader>fd",
    function()
      toggle_neotree("bottom")
    end,
    desc = "Toggle file explorer on the bottom"
  },
  {
    "<leader>gs",
    function()
      neotree.execute({ source = "git_status", position = "float" })
    end,
    desc = "Show git status"
  },

  { "<Down>", mode = "i", desc = "Next completion item" },
  { "<Up>",   mode = "i", desc = "Previous completion item" },
}

which_key.add(mappings)
