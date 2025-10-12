return {
  {'akinsho/toggleterm.nvim',
    opts = {
        -- Specify any options you want for toggleterm here
        size = 15, -- Size of the terminal
        open_mapping = [[<c-\>]], -- Key mapping to toggle terminal
        shade_filetypes = {},
        shading_factor = 2,
		persist_mode = true, -- Persist terminal mode between toggles
        persist_size = true,
        autochdir = true,
        --direction = "float", -- Terminal direction: "vertical" | "horizontal" | "tab" | "float"
        float_opts = {
            border = "curved", -- Border style for floating terminal
        },
    },
  }
}

