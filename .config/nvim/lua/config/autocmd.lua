-- local parsers_to_install = {
--   "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
--   "go", "gosum", "gomod", "templ", "make", "gotempl"
--   "json", "yaml",
--   "gitcommit", "git_rebase", "gitignore", "git_config",
--   "terraform", "dockerfile",
--   "javascript", "typescript", "html", "css", "vue",
-- }

-- require("nvim-treesitter").install(parsers_to_install)

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
    if lang and vim.treesitter.language.add(lang) then
        vim.treesitter.start()

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

