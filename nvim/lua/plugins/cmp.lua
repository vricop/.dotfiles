return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    enabled = enable_plugins.cmp,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lua',
      'roginfarrer/cmp-css-variables',
    },
    opts = function()
      local cmp = require 'cmp'

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          -- You can specify the `cmp_git` source if you were installed it.
          { name = 'cmp_git' },
        }, {
          { name = 'buffer' },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this
      -- won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this
      -- won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })

      -- Diagnostic icons
      local signs = require('core.icons').diagnostics
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      return {
        experimental = { ghost_text = true },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-X><C-O>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only
          -- confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'css-variables' },
        },
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind_icons = require('core.icons').kind

            vim_item.kind = kind_icons[vim_item.kind]

            vim_item.menu = ({
              buffer = '',
              nvim_lsp = '',
              luasnip = '',
              nvim_lua = '',
              latex_symbols = '',
            })[entry.source.name]

            require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)

            return vim_item
          end,
        },
      }
    end,
  },
}
