vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = vim.keymap.set
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end

    map('n', 'gD', vim.lsp.buf.declaration, {
      buffer = event.buf,
      desc = 'Go to declaration',
    })

    map('n', 'gd', vim.lsp.buf.definition, {
      buffer = event.buf,
      desc = 'Go to definition',
    })

    map('n', 'gi', vim.lsp.buf.implementation, {
      buffer = event.buf,
      desc = 'Go to implementation',
    })

    map('n', 'gr', vim.lsp.buf.references, {
      buffer = event.buf,
      desc = 'Referencees',
    })

    map('n', 'gk', vim.lsp.buf.signature_help, {
      buffer = event.buf,
      desc = 'Show signature help',
    })

    map('n', '<Leader>D', vim.lsp.buf.type_definition, {
      buffer = event.buf,
      desc = 'Type definition',
    })

    map('n', '<Leader>lr', vim.lsp.buf.rename, {
      buffer = event.buf,
      desc = 'Rename',
    })

    map('n', '<Leader>la', vim.lsp.buf.code_action, {
      buffer = event.buf,
      desc = 'Code actions',
    })

    map('n', '<Leader>lo', vim.diagnostic.open_float, {
      desc = 'Open diagnostic',
    })

    map('n', '<Leader>li', '<Cmd>LspInfo<Cr>', {
      buffer = event.buf,
      desc = 'See lsp info',
    })

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    local function supports_method(method)
      if not client then
        return false
      end
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, event.buf)
      else
        return client.supports_method(method, { bufnr = event.buf })
      end
    end

    if
      supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
    then
      local group =
        vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = group,
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(ev)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = group, buffer = ev.buf }
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config {
  virtual_text = true,
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}

--- TODO: remove if blink.cmp is removed
local ok, blink = pcall('require', 'blink.cmp')

if (ok) then
  vim.lsp.config('*', {
    capabilities = blink.get_lsp_capabilities()
  })
end

vim.lsp.enable {
  'lua_ls',
  'ts_ls',
  -- "denols",
  'bashls',
  'jsonls',
  'html',
  'cssls',
  'marksman',
  'emmet_ls',
  'dotls',
}
