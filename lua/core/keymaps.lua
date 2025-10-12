local isLspDiagnosticsVisible = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--disable spacebar default
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-- Quickfix movement
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- jk action
vim.keymap.set("i", "jk", "<Esc>:w<CR>", { noremap = true, silent = true })

--concicnes
local opts = { noremap = true, silent = true }

--edit end of word
vim.keymap.set('n', '<leader>i', 'whi', opts)

--edit begin of word
vim.keymap.set('n', '<leader>b', 'bi', opts)

--fast into normal mode
-- vim.keymap.set("i", "aa", "<ESC>", opts)
--  --vim.api.nvim_command("write") -- Save the file
--  vim.api.nvim_input("<ESC>") -- Exit insert mode
--end, opts)

-- remove highlights from search
vim.keymap.set('n', '<leader>kj', function()
	vim.cmd('noh') -- Executes :noh command programmatically
end, opts)

--vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-d>zz', opts)

--find and center (keeps cursor center)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- visual mode indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- window creation
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- keepoing last yanked
vim.keymap.set('v', 'p', '"_dP', opts)

--toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set("n", "<leader>11", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
		signs = isLspDiagnosticsVisible, -- Toggle warning icons
	})
end)
