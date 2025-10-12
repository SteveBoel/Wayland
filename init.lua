require 'core.keymaps'
require 'core.options'
require 'core.lazy'
require 'core.autocmd'

require("lazy").setup({
	require 'plugins.colortheme',
	require 'plugins.haskell',
	require 'plugins.treesitter',
	require 'plugins.lualine',
	require 'plugins.telescope',
	require 'plugins.autocompletion',
	require 'plugins.lsp',
	require 'plugins.indent',
	require 'plugins.toggleterminal',
	require 'plugins.mason',
	require 'plugins.oil',
	require 'plugins.fugitive',
	require 'plugins.roslyn'
})
