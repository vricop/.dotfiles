return {
  'luukvbaal/statuscol.nvim',
  init = function()
    vim.o.foldcolumn = '1'
    -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.opt.fillchars:append {
      eob = ' ',
      fold = ' ',
      foldopen = [[]],
      foldsep = ' ',
      foldclose = [[]],
    }
  end,
  opts = function()
    local builtin = require 'statuscol.builtin'

    return {
      setopt = true,
      relculright = true,
      segments = {
        {
          text = { builtin.foldfunc, ' ' },
          click = 'v:lua.ScFa',
          hl = 'Comment',
        },
        { text = { '%s' }, click = 'v:lua.ScSa' },
        { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
      },
    }
  end,
}
