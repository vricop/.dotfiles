--[[
Source: https://github.com/alvarosevilla95/luatab.nvim/blob/master/lua/luatab/init.lua#L26
--]]

function my_tabline()
  local string = ""

  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      string = string.format("%s%%#TabLineSel#", string)
    else
      string = string.format("%s%%#TabLine#", string)
    end

    string = string.format("%s %s ", string, my_tablabel(i))
  end
  string = string.format("%s%%#TabLineFill#%%", string)
  return string
end

function my_tablabel(n)
  local buffer_list = vim.fn.tabpagebuflist(n)
  local win_number = vim.fn.tabpagewinnr(n)
  local file = vim.fn.bufname(buffer_list[win_number])
  
  -- Show only filename
  return vim.fn.fnamemodify(file, ':t')
end

print(my_tabline())

vim.o.tabline = "%!luaeval('my_tabline()')"

