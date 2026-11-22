return {
	"lewis6991/satellite.nvim",
	event = "VeryLazy",
	opts = {
		current_only = false,
		winblend = 50,
		width = 2,
		handlers = {
			cursor = { enable = true },
			search = { enable = true },
			diagnostic = { enable = true, min_severity = vim.diagnostic.severity.HINT },
			gitsigns = { enable = true },
			marks = { enable = true },
			quickfix = { enable = true },
		},
	},
}
