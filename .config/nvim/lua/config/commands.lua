local neotree = require('neo-tree.command')
local neotree_manager = require('neo-tree.sources.manager')

local format_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_group,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local state = neotree_manager.get_state('filesystem')
    local is_open = state and state.winid and vim.api.nvim_win_is_valid(state.winid)
    local skip_buffers = vim.bo[args.buf].buftype == ""
    -- Skip special buffers
    if is_open and skip_buffers then
      neotree.execute({ action = "show", reveal = true })
    end
  end,
})
