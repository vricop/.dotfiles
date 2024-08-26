return {
  'rcarriga/nvim-notify',
  enabled = enable_plugins.notify,
  opts = {
    -- `static` fixes cursor flickering. Related to this issue:
    -- https://github.com/rcarriga/nvim-notify/issues/273
    stages = 'static',
    max_width = 50,
    icons = {
      ERROR = [[ ]],
      WARN = [[ ]],
      INFO = [[ ]],
      BUG = [[ ]]
    },
  },
}
