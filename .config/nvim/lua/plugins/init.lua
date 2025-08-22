return {
  {
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

      lspconfig.vtsls.setup(vtsls_config)
    end
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip', -- if using luasnip
      'L3MON4D3/LuaSnip',         -- if using luasnip
      -- Add other cmp sources if you use them (e.g., cmp-path, cmp-buffer)
    },
    config = function()
      -- nvim-cmp setup
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      require('luasnip.loaders.from_vscode').load({
        paths = vim.fn.stdpath('config') .. '/snippets'
      })

      luasnip.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        view = {
          entries = { name = 'custom', selection_order = 'near_cusor' }
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text'
          })
        },
        mapping = {
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              end
              cmp.confirm()
            else
              fallback()
            end
          end,
          ["<Cr>"] = cmp.mapping.confirm(),
          ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For snippets
        }),
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
        },
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
    end
  },

  {
    'windwp/nvim-autopairs',
    config = true
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "javascript", "html", "typescript", "css", "dockerfile", "go", "gosum", "gomod", "json",
          "yaml", "git_rebase", "gitcommit", "gitignore", "terraform"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_x = { 'lsp_status', 'filetype' },
          lualine_z = { 'selectioncount', 'location' },
        }
      })
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavor = 'mocha',
        highlight_overrides = {
          all = function(colors)
            return {
              CurSearch = { bg = colors.sky },
              IncSearch = { bg = colors.sky },
              CursorLineNr = { fg = colors.blue, style = { "bold" } },
              DashboardFooter = { fg = colors.overlay0 },
              TreesitterContextBottom = { style = {} },
              WinSeparator = { fg = colors.overlay0, style = { "bold" } },
              ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
              ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
              Headline = { style = { "bold" } },
              Headline1 = { fg = colors.blue, style = { "bold" } },
              Headline2 = { fg = colors.pink, style = { "bold" } },
              Headline3 = { fg = colors.lavender, style = { "bold" } },
              Headline4 = { fg = colors.green, style = { "bold" } },
              Headline5 = { fg = colors.peach, style = { "bold" } },
              Headline6 = { fg = colors.flamingo, style = { "bold" } },
              rainbow1 = { fg = colors.blue, style = { "bold" } },
              rainbow2 = { fg = colors.pink, style = { "bold" } },
              rainbow3 = { fg = colors.lavender, style = { "bold" } },
              rainbow4 = { fg = colors.green, style = { "bold" } },
              rainbow5 = { fg = colors.peach, style = { "bold" } },
              rainbow6 = { fg = colors.flamingo, style = { "bold" } },
            }
          end,
        },
        color_overrides = {
          macchiato = {
            rosewater = "#F5B8AB",
            flamingo = "#F29D9D",
            pink = "#AD6FF7",
            mauve = "#FF8F40",
            red = "#E66767",
            maroon = "#EB788B",
            peach = "#FAB770",
            yellow = "#FACA64",
            green = "#70CF67",
            teal = "#4CD4BD",
            sky = "#61BDFF",
            sapphire = "#4BA8FA",
            blue = "#00BFFF",
            lavender = "#00BBCC",
            text = "#C1C9E6",
            subtext1 = "#A3AAC2",
            subtext0 = "#8E94AB",
            overlay2 = "#7D8296",
            overlay1 = "#676B80",
            overlay0 = "#464957",
            surface2 = "#3A3D4A",
            surface1 = "#2F313D",
            surface0 = "#1D1E29",
            base = "#0b0b12",
            mantle = "#11111a",
            crust = "#191926",
          },
        },
        integrations = {
          telescope = {
            enabled = true,
            style = "nvchad",
          },
        }
      })
    end
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },

  {
    "windwp/nvim-ts-autotag",
    config = true
  },
}
