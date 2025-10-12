return {
	'mrcjkb/haskell-tools.nvim',
	version = '^6', -- Recommended
	lazy = false,  -- This plugin is already lazy
	--config = function()
	--	local ht = require('haskell-tools')
	--	local opts = { noremap = true, silent = true }
	--	vim.keymap.set('n', '<space>yy', ht.hoogle.hoogle_signature, opts)
	--	vim.keymap.set('n', '<space>ii', function()
	--		require('haskell-tools').hoogle.hoogle_signature()
	--	end, opts)
	--end,
}
