return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
    "astro", "css", "graphql", "html", "javascript", "javascriptreact", "json",
    "jsonc", "svelte", "typescript", "typescriptreact", "vue",
	},
	root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
	workspace_required = true,
}
