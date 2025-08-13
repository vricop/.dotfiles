-- Autoload every *.lua under lua/plugins/**, skipping any init.lua
local config_lua  = vim.fs.joinpath(vim.fn.stdpath("config"), "lua")
local plugins_dir = vim.fs.joinpath(config_lua, "plugins")

local files = vim.fs.find(function(name)
  return name:match("%.lua$") and not name:match("^init%.lua$")
end, { path = plugins_dir, type = "file", limit = math.huge })

table.sort(files)

for _, file in ipairs(files) do
  local rel    = vim.fs.normalize(file):sub(#config_lua + 2)   -- strip "<config>/lua/"
  local module = rel:gsub("%.lua$", ""):gsub("[/\\]", ".")     -- to "plugins.xxx.yyy"
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify(("Failed loading %s\n%s"):format(module, err), vim.log.levels.ERROR)
  end
end
