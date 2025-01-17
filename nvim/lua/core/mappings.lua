local keymap = vim.keymap.set

keymap('n', '<Esc>', ':noh<cr>', {
  desc = 'Stop highlighting',
  noremap = true,
  silent = true,
})

keymap('n', '<Leader>w', ':up<Cr>', {
  desc = 'Update buffer',
  silent = true,
})

keymap('n', '<Leader>s', ':wa<Cr>', {
  desc = 'Write all buffers',
  silent = true,
})

keymap('n', '<Leader>d', require('utils.ui').bufremove, {
  desc = 'Delete buffer',
  silent = true,
})

keymap('n', '<Leader>da', '<cmd>bufdo bd<cr>', {
  desc = 'Delete all buffers',
  silent = true,
})

keymap('n', '<Leader>x', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, {
  desc = 'Delete all buffers but current',
  silent = true,
})

keymap('n', '<Leader>q', ':qa<Cr>', {
  desc = 'Quit Neovim',
  silent = true,
})

keymap('n', '<Leader>c', ':close<Cr>', {
  desc = 'Close window',
  silent = true,
})

keymap('n', '<Leader>b', ':tab ball<cr>', {
  desc = 'Open all buffers in tabs',
  silent = true,
})

keymap('n', 'J', 'mzJ`z', {
  desc = 'Join lines and center screen',
})

keymap('n', '<tab>', 'gT', { desc = 'Previous tab' })
keymap('n', '<s-tab>', 'gt', { desc = 'Next tab' })
keymap('n', Meta.h, '<C-w>>', { desc = 'Increase vertical split' })
keymap('n', Meta.l, '<C-w><', { desc = 'Decrease vertical split' })

keymap('n', '[b', ':bp<Cr>', {
  desc = 'Previous buffer',
  silent = true,
})

keymap('n', ']b', ':bn<Cr>', {
  desc = 'Next buffer',
  silent = true,
})

keymap('v', Meta.j, ":m '>+1<Cr>gv=gv", {
  desc = 'Move line down',
  silent = true,
})

keymap('n', Meta.j, ':m .+1<Cr>==', {
  desc = 'Move line down',
  silent = true,
})

keymap('v', Meta.k, ":m '<-2<Cr>gv=gv", {
  desc = 'Move line up',
  silent = true,
})

keymap('n', Meta.k, ':m .-2<Cr>==', {
  desc = 'Move line up',
  silent = true,
})

keymap('n', Meta.J, ':t+0<Cr>', {
  desc = 'Duplicate line below',
  silent = true,
})

keymap('v', Meta.J, ":t'>+0<Cr>", {
  desc = 'Duplicate line below',
  silent = true,
})

keymap('n', Meta.K, ':t-1<Cr>', {
  desc = 'Duplicate line above',
  silent = true,
})

keymap('v', Meta.K, ":t'<-1<Cr>", {
  desc = 'Duplicate line above',
  silent = true,
})

keymap('v', '>', '>gv', { desc = 'Indent selection right', noremap = true })
keymap('v', '<', '<gv', { desc = 'Indent selection left', noremap = true })
keymap('n', 'n', 'nzz', { desc = 'Next occurrency & center' })
keymap('n', 'N', 'Nzz', { desc = 'Previous occurrency & center' })
keymap('n', '*', '*zz', { desc = 'Next occurrency & center' })
keymap('n', '#', '#zz', { desc = 'Previous occurrency & center' })
keymap('n', 'g*', 'g*zz', { desc = 'Next occurrency & center' })
keymap('n', 'g#', 'g#zz', { desc = 'Previous occurrency & center' })
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Move screen up & center' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Move screen down & center' })
keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to window left' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to window top' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to window down' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to window right' })
keymap('n', '<C-c>', '<C-w><C-w>', { desc = 'Cycle windows' })

keymap('n', '<Leader>/', ':%s@\\v<<C-r><C-w>>@@gc<Left><Left><Left>', {
  desc = 'Find & replace word under cursor',
  silent = false,
})

keymap('n', '<Leader>fk', ':map<Cr>', {
  desc = 'Find keymaps',
  silent = true,
})

keymap('n', '<Leader>fr', ':registers<Cr>', {
  desc = 'Find registers',
  silent = true,
})

keymap('n', '<Leader>fm', ':marks<Cr>', {
  desc = 'Find marks',
  silent = true,
})

keymap({ 'n', 'v' }, 'gh', '^', {
  desc = 'Go to the first non blank character',
})

keymap({ 'n', 'v' }, 'gl', 'g_', {
  desc = 'Go to the last non blank character',
})

keymap('n', '<Leader>v', '<C-w>v', {
  desc = 'Split vertically',
})

keymap('n', '<Leader>h', '<C-w>s', {
  desc = 'Split horizontally',
})

keymap('n', ']q', ':cn<Cr>', {
  desc = 'Next item in quickfix list',
  silent = true,
})

keymap('n', '[q', ':cp<Cr>', {
  desc = 'Previous item in quickfix list',
  silent = true,
})

keymap('x', 'p', [["_dP"]])
keymap('i', 'jj', '<Esc>')
keymap('n', 'Q', '@q', { desc = 'Run macro on regiser "q' })

keymap('n', '<Leader>r', function()
  local repetead_key = ''

  for _ = 1, 18 do
    repetead_key = repetead_key .. '<Left>'
  end

  return string.format(':cfdo %%s###gc | update | bd%s', repetead_key)
end, {
  desc = 'Run substitute from quickfix file list',
  silent = false,
  expr = true,
})

keymap('n', '<Leader>ff', ':find<Space>**/', {
  desc = 'Find files',
  silent = false,
})

-- TOGGLE MAPPINGS
keymap('n', '<Leader>e', ':Lexplore<Cr>', {
  desc = 'Toggle netwr',
  silent = true,
})

keymap('n', '<Leader>ti', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
end, {
  desc = 'Toggle inlay hint',
  silent = true,
})

keymap('n', '<Leader>tr', function()
  vim.o.relativenumber = not vim.o.relativenumber
end, {
  desc = 'Toggle relative numbers',
  silent = true,
})

keymap('n', '<Leader>tc', function()
  vim.o.conceallevel = vim.o.conceallevel == 0 and 2 or 0
end, {
  desc = 'Toggle conceal',
})

keymap('n', '<Leader>tl', function()
  vim.o.lazyredraw = not vim.o.lazyredraw
end, {
  desc = 'Toggle lazyredraw',
})

keymap('n', '<Leader>td', function()
  if is_diff_mode_on then
    vim.cmd 'windo diffoff'
  else
    vim.cmd 'windo diffthis'
  end
  _G.is_diff_mode_on = not is_diff_mode_on
end, {
  silent = true,
  desc = 'Toggle diff in splits',
})
