return { -- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs', -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
	  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'c_sharp', 'haskell', 'css', 'python', 'gitignore'},
	  --ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'haskell'},
	  -- Autoinstall languages that are not installed
	  auto_install = false,
	  highlight = {
		enable = true,
		-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
		--  If you are experiencing weird indenting issues, add the language to
		--  the list of additional_vim_regex_highlighting and disabled languages for indent.
		additional_vim_regex_highlighting = { 'ruby' },
	  },
	  indent = { enable = true, disable = { 'ruby' } },
	},

	-- forcing sync at startup
	--config = function(_, opts)
	--	-- Setup Treesitter
	--	require('nvim-treesitter.configs').setup(opts)

	--	-- Run deferred Treesitter update
	--	vim.defer_fn(function()
	--		require('nvim-treesitter.install').update({ with_sync = true })
	--	end, 0)
	--end,
}
