return {
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',
    config  = function ()
      local cmp = require'cmp'

      require('cmp').setup({
        experimental = { ghost_text = true },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-X><C-O>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        }),
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
        formatting = {
          format = function(entry, vim_item)
            local kind_icons = {
              Text = '',
              Color = '',
              Method = '',
              Function = '',
              Constructor = '',
              Field = '',
              Variable = '',
              Class = '',
              Interface = '',
              Module = '',
              Property = '',
              Unit = '',
              Value = '',
              Enum = '',
              Keyword = '',
              Snippet = '',
              File = '',
              Reference = '',
              Folder = '',
              EnumMember = '',
              Constant = '',
              Struct = '',
              Event = '',
              Operator = '',
              TypeParameter = '',
            }

            -- Kind icons
            vim_item.kind = kind_icons[vim_item.kind]
            -- Source
            vim_item.menu = ({
              buffer = " (Buffer)",
              nvim_lsp = " (LSP)",
              luasnip = " (LuaSnip)",
              nvim_lua = " (Lua)",
              latex_symbols = " (LaTeX)",
            })[entry.source.name]
            return vim_item
          end
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- Diagnostic icons
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  },
  { 'L3MON4D3/LuaSnip' },
}
