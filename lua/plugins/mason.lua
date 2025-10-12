return {
	"mason-org/mason.nvim",
	opts = {
		-- add registries so mason can Install them
		registries = {
			"github:mason-org/mason-registry", -- default official registry
			"github:Crashdummyy/mason-registry", -- custom registry for roslyn
		},
		ensure_installed = {
			"roslyn",
		},
	},
}
