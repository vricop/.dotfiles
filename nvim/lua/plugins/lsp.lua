return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.diagnostic.config {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'
      local keymap = require('core.utils').keymap

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(_, bufnr)
        -- Enable completion using native <C-x><C-o>
        -- TODO: Deprecated method, replaced with `nvim_set_option_value`
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local function lsp_opts(desc)
          return {
            buffer = bufnr,
            desc = desc,
          }
        end

        local function list_workspace_folders()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end

        keymap('n', 'gD', vim.lsp.buf.declaration, lsp_opts 'Go to declaration')
        keymap('n', 'gd', vim.lsp.buf.definition, lsp_opts 'Go to definition')

        keymap(
          'n',
          'gi',
          vim.lsp.buf.implementation,
          lsp_opts 'Go to implementation'
        )

        keymap('n', 'gr', vim.lsp.buf.references, lsp_opts 'Referencees')
        keymap('n', 'K', vim.lsp.buf.hover, lsp_opts 'Show docs')

        keymap(
          'n',
          'gk',
          vim.lsp.buf.signature_help,
          lsp_opts 'Show signature help'
        )
        -- keymap('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, lsp_opts('Add workspace folder'))
        -- keymap('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, lsp_opts('Remove workspace folder'))
        -- keymap('n', '<Leader>wl', list_workspace_folders, lsp_opts('List workspace folders'))
        --
        keymap(
          'n',
          '<Leader>D',
          vim.lsp.buf.type_definition,
          lsp_opts 'Type definition'
        )

        keymap('n', '<Leader>lr', vim.lsp.buf.rename, lsp_opts 'Rename')

        keymap(
          'n',
          '<Leader>la',
          vim.lsp.buf.code_action,
          lsp_opts 'Code actions'
        )

        keymap({ 'n', 'v' }, '<Leader>=', function()
          vim.lsp.buf.format { async = true }
        end, lsp_opts 'Format buffer')

        keymap('n', '<Leader>li', '<Cmd>LspInfo<Cr>', lsp_opts 'See lsp info')
      end

      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { 'vim' } },
                hint = { enable = true },
              },
              -- NOTE: For some reason, stylelint isn't loading my config file with
              -- rules for avoiding false positives when using PostCss plugins.
              css = {
                validate = true,
                lint = {
                  unknownAtRules = 'ignore',
                },
              },
              -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
              javascript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayVariableTypeHints = true,
                },
              },
              typescript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayVariableTypeHints = true,
                },
              },
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

  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {}
    end,
    keys = { '<Leader>m', '<cmd>Mason<Cr>', desc = 'Open Mason' },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup {
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
      }
    end,
  },
}
