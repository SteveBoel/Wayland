return {
  "folke/tokyonight.nvim",
  --lazy = false, -- Load the theme immediately
  --priority = 1000, -- Ensure it loads first
  opts = {
    style = "night", -- Choose the "night" style (options: storm, night, day, moon)
  },
  config = function()
    -- Apply the theme
    vim.cmd [[colorscheme tokyonight]]
  end,
}
