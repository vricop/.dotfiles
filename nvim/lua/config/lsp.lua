local map = vim.keymap.set

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
  --TODO: Use vitels instead of ts_ls
	-- "vitels",
  "tailwindcss",
	"bashls",
	"jsonls",
	"html",
	"cssls",
	"marksman",
	"emmet_ls",
	"dotls",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		end

		map("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Go to declaration" })
		map("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
		map("n", "gi", vim.lsp.buf.implementation, { buffer = event.buf, desc = "Go to implementation" })
		map("n", "gr", vim.lsp.buf.references, { buffer = event.buf, desc = "Referencees" })
		map("n", "gk", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "Show signature help" })
		map("n", "<Leader>cr", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })
		map("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code actions" })
		map("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Open diagnostic" })
		map("n", "<Leader>ci", "<Cmd>checkhealth vim.lsp<Cr>", { buffer = event.buf, desc = "See lsp info" })

		if client:supports_method("textDocument/completion") then
			local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = group,
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(ev)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = group, buffer = ev.buf })
				end,
			})
		end
	end,
})

vim.diagnostic.config({
	virtual_lines = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- LSP floats: 80% width + padding inside the float
do
	local orig = vim.lsp.util.open_floating_preview

	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}

		-- Limit width
		local win_w = vim.api.nvim_win_get_width(0)
		local W = math.max(20, math.floor(win_w * 0.8))

    -- Paddings
		local padded = {}
    local padding = {
      top = '  ',
      bottom = '  ',
      left = '  ',
      right = '  ',
    }

		opts.max_width = opts.max_width or W

    -- Top padding
		table.insert(padded, padding.top)

    -- Horizontal padding
		for _, line in ipairs(contents) do
			table.insert(padded, padding.left .. line .. padding.right)
		end

    -- Bottom padding
		table.insert(padded, padding.bottom)

		return orig(padded, syntax, opts, ...)
	end
end

vim.lsp.config("*", {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})
