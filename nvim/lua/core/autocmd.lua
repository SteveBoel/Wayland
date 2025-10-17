--remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

--terminal doesn't fill screen so when fullscreen, it sets the terminal background color to the bg color of neovim instead of black
--when leaving terminal, it sets it back to normal
vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
		if normal.bg then
			io.write(string.format('\027]11;#%06x\027\\', normal.bg))
		end
	end,
})
vim.api.nvim_create_autocmd('UILeave', {
	callback = function()
		io.write('\027]111\027\\')
	end,
})

-- lspl auto commands
vim.api.nvim_create_autocmd('LspAttach', {
	-- somehow this works,
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>"),
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>"),

	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil')
				and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
