require 'neodev'.setup {}

-- TODO: Move all lsp config related into lspconfig.lua? Move there os lsp
-- related dependencies: mason, mason-lspconfig, typescript. Take a look at
-- LazyVim configs https://www.lazyvim.org/plugins/lsp#nvim-lspconfig
local function diagnostic_mapping_opts(desc)
  return {
    noremap = true,
    silent = true,
    desc = desc
  }
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require 'lspconfig'
local map = vim.keymap.set

map('n', '<Leader>lo', vim.diagnostic.open_float, diagnostic_mapping_opts('Open diagnostic'))
map('n', '[d', vim.diagnostic.goto_prev, diagnostic_mapping_opts('Go to prev diagnostic'))
map('n', ']d', vim.diagnostic.goto_next, diagnostic_mapping_opts('Go to next diagnostic'))
map('n', '<Leader>lq', vim.diagnostic.setloclist, diagnostic_mapping_opts('Add diagnostics to the location list'))

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion using native <C-x><C-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local function lsp_mapping_opts(desc)
    return {
      noremap = true,
      silent = true,
      buffer = bufnr,
      desc = desc
    }
  end

  local function list_workspace_folders()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end

  map('n', 'gD', vim.lsp.buf.declaration, lsp_mapping_opts('Go to declaration'))
  map('n', 'gd', vim.lsp.buf.definition, lsp_mapping_opts('Go to definition'))
  map('n', 'gi', vim.lsp.buf.implementation, lsp_mapping_opts('Go to implementation'))
  map('n', 'gr', vim.lsp.buf.references, lsp_mapping_opts('Referencees'))
  map('n', 'K', vim.lsp.buf.hover, lsp_mapping_opts('Show docs'))
  map('n', 'gk', vim.lsp.buf.signature_help, lsp_mapping_opts('Show signature help'))
  map('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, lsp_mapping_opts('Add workspace folder'))
  map('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, lsp_mapping_opts('Remove workspace folder'))
  map('n', '<Leader>wl', list_workspace_folders, lsp_mapping_opts('List workspace folders'))
  map('n', '<Leader>D', vim.lsp.buf.type_definition, lsp_mapping_opts('Type definition'))
  map('n', '<Leader>lr', vim.lsp.buf.rename, lsp_mapping_opts('Rename'))
  map('n', '<Leader>la', vim.lsp.buf.code_action, lsp_mapping_opts('Code actions'))
  map({ 'n', 'v' }, '<Leader>=', vim.lsp.buf.format, lsp_mapping_opts('Format buffer'))
  map('n', '<Leader>li', '<Cmd>LspInfo<Cr>', lsp_mapping_opts('See lsp info'))
end

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
        },
        -- NOTE: For some reason, stylelint isn't loading my config file with 
        -- rules for avoiding false positives when using PostCss plugins.
        css = {
          validate = true,
          lint = {
            unknownAtRules = 'ignore',
          },
        },
      },
    })
  end,
})
