return {
  {
    'williamboman/mason.nvim',
    config = true,
    enabled = false,
    keys = {
      { '<Leader>om', ':Mason<Cr>', desc = 'Open Mason', silent = true },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    enabled = false,
    version = '1.32.0',
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
        'ts_ls',
        'denols',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    enabled = false,
    config = function(opts)
      vim.diagnostic.config {
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
          },
        },
        underline = true,
        update_in_insert = true,
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()
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
          desc = 'References',
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
          desc = 'See LSP info',
        })
      end

      -- Generic handler for all LSPs
      local generic_lsp_setup = function(server_name)
        lspconfig[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end

      -- Specific configuration for Deno
      local deno_setup = function()
        lspconfig.denols.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
        }
      end

      -- Specific configuration for TypeScript
      local typescript_setup = function()
        lspconfig['ts_ls'].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern 'package.json',
          single_file_support = false,
          settings = {
            javascript = {
              inlayHints = {
                includeInlayFunctionParameterTypeHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayFunctionParameterTypeHints = true,
              },
            },
          },
        }
      end

      require('mason-lspconfig').setup_handlers {
        generic_lsp_setup, -- Default handler for all LSPs
        ['denols'] = deno_setup, -- Override for deno
        ['ts_ls'] = typescript_setup, -- Override for TypeScript
      }
    end,
  },
}
