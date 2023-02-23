return {
  {
    'kdheepak/lazygit.nvim',
    config = function ()
      local g = vim.g

      g.lazygit_floating_window_scaling_factor = 1

      vim.keymap.set(
        'n',
        '<Leader>gl',
        ':LazyGit<Cr>',
        {
          desc = 'Open Lazygit',
          silent = true
        }
      )
    end
  }
}
