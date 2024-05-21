-- NOTE: Update with a lua version if there's any. The original was build form
-- vim, versions in lua exist, but they're not as good as the original author.
return {
  'mbbill/undotree',
  keys = {
    { '<Leader>tu', ':UndotreeToggle<Cr>', desc = "Toggle undotree",   }
  }
}
