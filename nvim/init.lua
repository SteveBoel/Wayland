require 'core.keymaps'
require 'core.options'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--ignore haskell warnings
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "haskell",
--  callback = function()
--    vim.diagnostic.config({
--      severity_sort = true,
--      virtual_text = {
--        severity = { min = vim.diagnostic.severity.ERROR },
--      },
--      signs = {
--        severity = { min = vim.diagnostic.severity.ERROR },
--      },
--    })
--  end,
--})

--disable diagnostic lines
--vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = false })

local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>ww", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible,
        signs = isLspDiagnosticsVisible, -- Toggle warning icons
    }) end)

require('lazy').setup({
	require 'plugins.neotree',
	--require 'plugins.bufferline',
	require 'plugins.colortheme',
	require 'plugins.haskell',
	require 'plugins.treesitter',
	require 'plugins.lualine',
	require 'plugins.telescope',
    require 'plugins.autocompletion',
	require 'plugins.lsp',
	require 'plugins.indent',
})
