require 'core.keymaps'
require 'core.options'
require 'core.lazy'
require 'core.autocmd'

require("lazy").setup({
  --require 'plugins.neotree',
  --require 'plugins.bufferline',
  require 'plugins.colortheme',
  require 'plugins.haskell',
  require 'plugins.treesitter',
  require 'plugins.lualine',
  require 'plugins.telescope',
  require 'plugins.autocompletion',
  require 'plugins.lsp',
  require 'plugins.indent',
  require 'plugins.toggleterminal',
})
