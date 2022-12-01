--[[
## Sources

* Original blog post: https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
* Other post references: https://elianiva.my.id/post/neovim-lua-statusline/
* .dotfile github page from author: https://github.com/nuxshed/dotfiles/tree/main/config/nvim/lua
--]]

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local colors = {
  { "StatusLineAccent", { fg = "#333333", bg = "#1a1b26", bold = true } },
  { "StatusLineInsertAccent", { fg = "#333333", bg = "greenyellow", bold = true } },
  { "StatusLineNormalAccent", { fg = "#333333", bg = "skyblue", bold = true } },
  { "StatusLineVisualAccent", { fg = "#333333", bg = "magenta", bold = true } },
  { "StatusLineVisualBlockAccent", { fg = "#333333", bg = "orange", bold = true } },
  { "StatusLineReplaceAccent", { fg = "#333333", bg = "#db4b4b", bold = true } },
  { "StatusLineCmdLineAccent", { fg = "#333333", bg = "#e0af68", bold = true } },
  { "StatuslineTerminalAccent", { fg = "#333333", bg = "#e0af68", bold = true } },
  { "StatusLineExtra", { fg = "#565f89", bold = true } },
  { "StatusLineNC", { bg = "none" } },
}

for _, color in pairs(colors) do
  vim.api.nvim_set_hl(0, color[1], color[2])
end

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"

  if current_mode == "n" then
    mode_color = "%#StatuslineNormalAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
    mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "" then
    mode_color = "%#StatuslineVisualBlockAccent#"
  elseif current_mode == "R" then
    mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
    mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
    mode_color = "%#StatuslineTerminalAccent#"
  end

  return mode_color
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function filetype()
  return string.format(" LSP: %s  ", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return "%l:%c (%P) "
end

function statusline()
  return table.concat {
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    "%#Normal#",
    filepath(),
    filename(),
    "%m",
    "%#Normal#",
    lsp(),
    "%=%#Normal#",
    filetype(),
    lineinfo(),
  }
end

vim.o.statusline = "%!luaeval('statusline()')"
