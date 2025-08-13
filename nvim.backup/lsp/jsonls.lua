return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetype = { 'json', 'jsonc' },
  root_markers = { '.git' },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    schemas = require('schemastore').json.schemas(),
    validate = { enable = true },
  },
}
