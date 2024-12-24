return { --return because 
	'shaunsingh/nord.nvim',
	lazy = false, 
	priority = 1000,
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		-- Load the colorscheme
		require('nord').set()

		--Function to toggle transparency on and off
		--local bg_trans = true 
		--local toggle = function()
		--	bg_trans = not bg_trans
		--	vim.g.nord_disable_background = bg_trans
		--	vim.cmd [[colorscheme nord]]
		--end 
		--vim.keymap.set('n', '<leader>bg', toggle, {noremap = true, silent = true})
	end
}

--return {
--  "folke/tokyonight.nvim",
--  lazy = false, -- Load the theme immediately
--  priority = 1000, -- Ensure it loads first
--  opts = {
--    style = "night", -- Choose the "night" style (options: storm, night, day, moon)
--  },
--  config = function()
--    -- Apply the theme
--    vim.cmd [[colorscheme tokyonight]]
--  end,
--}
