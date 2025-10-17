local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function(args)
--     local neotree_manager = require('neo-tree.sources.manager')
--     local state = neotree_manager.get_state('filesystem')
--     local is_open = state and state.winid and vim.api.nvim_win_is_valid(state.winid)
--     -- Skip special buffers
--     local skip_buffers = vim.bo[args.buf].buftype == ""
--     if is_open and skip_buffers and vim.api.nvim_get_current_win() ~= state.winid then
--       neotree.execute({ action = "show", reveal = true })
--     end
--   end,
-- })
