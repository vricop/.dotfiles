return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip",         event = "InsertEnter" },
      { "hrsh7th/cmp-buffer",       event = "InsertEnter" },
      { "hrsh7th/cmp-cmdline",      event = "InsertEnter" },
      { "hrsh7th/cmp-nvim-lsp",     event = "InsertEnter" },
      { "hrsh7th/cmp-path",         event = "InsertEnter" },
      { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
      { "hrsh7th/cmp-emoji",        event = "InsertEnter" },
      { "hrsh7th/cmp-nvim-lua" },
    },
    config = function()
      local cmp = require("cmp")

      require("cmp").setup({
        experimental = { ghost_text = true },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-X><C-O>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only
          -- confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        }),
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind_icons = require 'core.icons'.kind

            -- Kind icons
            vim_item.kind = kind_icons[vim_item.kind]
            -- Source
            vim_item.menu = ({
              buffer = "",
              nvim_lsp = "",
              luasnip = "",
              nvim_lua = "",
              latex_symbols = "",
            })[entry.source.name]

            require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)

            return vim_item
          end,
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- Diagnostic icons
      local signs = require 'core.icons'.diagnostics
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
