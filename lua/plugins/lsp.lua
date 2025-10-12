return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			--require 'lspconfig'.lua_ls.setup {}
			--require 'lspconfig'.csharp_ls.setup {}
			--vim.lsp.enable({ 'lua_ls', 'csharp_ls' })
			vim.lsp.enable({ 'lua_ls' })

			-- remove warnign global vim
			vim.lsp.config['lua_ls'] = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim', 'os', 'Kvim' },
						},
					},
				},
			}

			-- enable roslyn
			vim.lsp.config("roslyn", {})

			vim.api.nvim_create_autocmd('LspAttach', {
				-- somehow this works,
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>"),

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
		end,
	}
}
