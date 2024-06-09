local M = {}

---@alias mode "n" | "i" | "v" | "x" | "t" | "s" | "!" | "o" | "c" | "!" | "l"

--- Option maps from `vim.keymap.set`
---@class Options
---@field noremap? boolean
---@field silent? boolean
---@field nowait? boolean
---@field expr? boolean

---@param mode mode | mode[]
---@param lhs string
---@param rhs string | function
---@param opts Options | nil
function M.keymap(mode, lhs, rhs, opts)
  local keymap = vim.keymap.set

  local default_opts = {
    noremap = true,
    silent = true,
  }

  -- opts = opts or {}
  opts = vim.tbl_extend('force', default_opts, opts or {})

  keymap(mode, lhs, rhs, opts)
end

return M
