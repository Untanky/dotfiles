return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "vtsls",
        "html",
        "cssls",
        "tailwindcss",
        "gopls",
        "templ",
      },
    }

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.tailwindcss.setup {
      capabilities = capabilities,
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              'class(?:Name)?=["\']([^"\']*)["\']',
              'clsx\\(([^)]*)\\)',
              'cva\\(([^)]*)\\)',
            },
          },
          validate = true,
        },
      },
      filetypes = {
        "css",
        "scss",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "templ",
      },
    }
    local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
        '/vue-language-server' .. '/node_modules/@vue/language-server'
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }
    local vtsls_config = {
      capabilities = capabilities,
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    }

    require('lspconfig').gopls.setup({
      settings = {
        gopls = {
          hints = {
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            ignoredError = true,
            parameterNames = true,
          },
        },
      },
    })

    lspconfig.vtsls.setup(vtsls_config)
  end
}
