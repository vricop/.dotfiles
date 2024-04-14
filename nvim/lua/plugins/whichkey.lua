return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local which_key = require 'which-key'
      which_key.setup {
        icons = {
          breadcrumb = "",
          separator = "",
          group = "",
        },
      }

    -- Only add label for groups, descriptions for mapping are set right where
    -- they're defined
    which_key.register {
      ["<Leader>f"] = { name = "Find" },
      ["<Leader>fg"] = { name = "Find git" },
      ["<Leader>g"] = { name = "Git" },
      ["<Leader>gh"] = { name = "Hunk" },
      ["<Leader>l"] = { name = "Lsp" },
      ["<Leader>t"] = { name = "Toggle" },
      ["<Leader>tg"] = { name = "Toggle git" },
      ["<Leader>b"] = { name = "Buffer" },
      ["gs"] = { name = "Go swap word" },
    }
    end,
  },
}
