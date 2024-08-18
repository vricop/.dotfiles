return {
  {
    'williamboman/mason.nvim',
    enabled = enable_plugins.mason,
    config = true,
    keys = {
      { '<Leader>m', ':Mason<Cr>', desc = 'Open Mason', silent = true },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    enabled = enable_plugins['mason-lspconfig'],
    opts = {
      ensure_installed = {
        'bashls',
        'cssls',
        'dotls',
        'emmet_ls',
        'html',
        'jsonls',
        'lua_ls',
        'marksman',
        'rust_analyzer',
        'tsserver',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    enabled = enable_plugins['lsp-config'],
    config = function()
      vim.diagnostic.config {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'

      local on_attach = function(_, bufnr)
        local keymap = vim.keymap.set

        keymap('n', 'gD', vim.lsp.buf.declaration, {
          buffer = bufnr,
          desc = 'Go to declaration',
        })

        keymap('n', 'gd', vim.lsp.buf.definition, {
          buffer = bufnr,
          desc = 'Go to definition',
        })

        keymap('n', 'gi', vim.lsp.buf.implementation, {
          buffer = bufnr,
          desc = 'Go to implementation',
        })

        keymap('n', 'gr', vim.lsp.buf.references, {
          buffer = bufnr,
          desc = 'Referencees',
        })

        keymap('n', 'gk', vim.lsp.buf.signature_help, {
          buffer = bufnr,
          desc = 'Show signature help',
        })

        keymap('n', '<Leader>D', vim.lsp.buf.type_definition, {
          buffer = bufnr,
          desc = 'Type definition',
        })

        keymap('n', '<Leader>lr', vim.lsp.buf.rename, {
          buffer = bufnr,
          desc = 'Rename',
        })

        keymap('n', '<Leader>la', vim.lsp.buf.code_action, {
          buffer = bufnr,
          desc = 'Code actions',
        })

        keymap('n', '<Leader>lo', vim.diagnostic.open_float, {
          desc = 'Open diagnostic',
        })

        keymap('n', '<Leader>li', '<Cmd>LspInfo<Cr>', {
          buffer = bufnr,
          desc = 'See lsp info',
        })
      end

      local hints = {
        inlayHints = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
      }

      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { 'vim', '_G' } },
                hint = { enable = true },
              },
              -- NOTE: For some reason, stylelint isn't loading my config file
              -- with
              -- rules for avoiding false positives when using PostCss plugins.
              css = {
                validate = true,
                lint = {
                  unknownAtRules = 'ignore',
                },
              },
              -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
              javascript = hints,
              typescript = hints,
              cssmodules = {
                capabilities = {
                  -- NOTE: Avoids conflicting with typescript 'go-to-definition'
                  definitionProvider = false,
                },
              },
              json = {
                schemas = require('schemastore').json.schemas(),
              },
            },
          }
        end,
      }
    end,
  },
}
