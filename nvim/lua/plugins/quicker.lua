return {
  'stevearc/quicker.nvim',
  event = 'FileType qf',
  enabled = enable_plugins.quicker,
  config = true,
  keys = function()
    local quicker = require 'quicker'

    return {
      {
        '<leader>tq',
        function()
          quicker.toggle()
        end,
        desc = 'Toggle quickfix',
      },
      {
        '<leader>tQ',
        function()
          quicker.toggle { loclist = true }
        end,
        desc = 'Toggle loclist',
      },
      {
        '>',
        function()
          require('quicker').expand {
            before = 2,
            after = 2,
            add_to_existing = true,
          }
        end,
        desc = 'Expand quickfix context',
      },
      {
        '<',
        function()
          require('quicker').collapse()
        end,
        desc = 'Collapse quickfix context',
      },
    }
  end,
}
