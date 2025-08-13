return {
  cmd = { "deno", "lsp" },
  filetypes = { "typescript", "javascript" },
  root_markers = { "deno.json", "deno.jsonc" },
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
}
