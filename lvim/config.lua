-- `7MMF'                                           `7MMF'   `7MF'db
--   MM                                               `MA     ,V
--   MM      `7MM  `7MM  `7MMpMMMb.   ,6"Yb.  `7Mb,od8 VM:   ,V `7MM  `7MMpMMMb.pMMMb.
--   MM        MM    MM    MM    MM  8)   MM    MM' "'  MM.  M'   MM    MM    MM    MM
--   MM      , MM    MM    MM    MM   ,pm9MM    MM      `MM A'    MM    MM    MM    MM
--   MM     ,M MM    MM    MM    MM  8M   MM    MM       :MM;     MM    MM    MM    MM
-- .JMMmmmmMMM `Mbod"YML..JMML  JMML.`Moo9^Yo..JMML.      VF    .JMML..JMML  JMML  JMML.

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-night"
vim.opt.relativenumber = true
vim.opt.colorcolumn = { 80 }
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.spelllang = { 'en', 'fr', 'ca', 'it', 'de', 'pt' }

lvim.leader = "space"
lvim.keys.normal_mode["<c-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.builtin.which_key.setup.icons.separator = "→ "
lvim.builtin.which_key.setup.icons.group = ""
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- Typescript code actions
lvim.builtin.which_key.mappings["la"] = {
  a = { "<cmd>TypescriptAddMissingImports<cr>", "Add missing imports" },
  d = { "<cmd>TypescriptRemoveUnused<cr>", "Remove unused" },
  f = { "<cmd>TypescriptFixAll<cr>", "Fix all" },
  g = { "<cmd>TypescriptGoToSourceDefinition<cr>", "Go to source definition" },
  o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize imports" },
  r = { "<cmd>TypescriptRenameFile<cr>", "Rename files" },
}

lvim.builtin.lualine.sections.lualine_x = {
  { 'encoding' },
  { 'fileformat', symbols = { unix = ' ' } },
  { 'filetype' },
}
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true -- Activate terminal plugin
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.git_placement = "after"
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.arrow_closed = ""
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.arrow_open = ""
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.ignored = ""
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.git.unstaged = "M"
lvim.builtin.luasnip.sources.friendly_snippets = false
lvim.builtin.treesitter.autotag.enable = true -- Enables autotag when using 'nvim-ts-autotag' plugin

-- Change mapping for cmp autocomplete, <C-Space> won't work
local cmp = require 'cmp'
lvim.builtin.cmp.mapping["<C-S-Space>"] = cmp.mapping.complete()

--- Codeicons (VSCode icons), set proper icons ---
lvim.builtin.cmp.formatting.kind_icons = {
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

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "typescript", "typescriptreact" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
  { command = "stylelint" }
}

-- Additional Plugins
lvim.plugins = {
  -- Colorschemes
  { "EdenEast/nightfox.nvim" },
  { "Shatur/neovim-ayu" },
  { "sainnhe/everforest" },
  -- Cool diagnostics
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({})
    end
  },
  -- Show css colors
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB      = true; -- #RGB hex codes
        RRGGBB   = true; -- #RRGGBB hex codes
        names    = true; -- "Name" codes like Blue
        RRGGBBAA = true; -- #RRGGBBAA hex codes
        hsl_fn   = true; -- CSS hsl() and hsla() functions
        css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true; -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    setup = function()
      vim.o.timeoutlen = 500
    end
  },
  {
    "aca/emmet-ls",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
            },
            root_dir = function()
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
    end,
  },
  { "tpope/vim-fugitive" },
  { "kdheepak/lazygit.nvim" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
}
