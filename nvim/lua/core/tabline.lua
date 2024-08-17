-- Source: https://github.com/alvarosevilla95/luatab.nvim/blob/master/lua/luatab/init.lua#L26

function Tablabel(buffer_number)
  local buffer_list = vim.fn.tabpagebuflist(buffer_number)
  local win_number = vim.fn.tabpagewinnr(buffer_number)
  local file = vim.fn.bufname(buffer_list[win_number])

  if (file == "") then
    file = "NO NAME"
  end

  -- Show only filename
  return vim.fn.fnamemodify(file, ':t')
end

function Tabline()
  local string = ""

  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      string = string.format("%s%%#TabLineSel#", string)
    else
      string = string.format("%s%%#TabLine#", string)
    end

    string = string.format("%s %s ", string, Tablabel(i))
  end
  string = string.format("%s%%#TabLineFill#%%", string)
  return string
end

vim.o.tabline = "%!luaeval('Tabline()')"
