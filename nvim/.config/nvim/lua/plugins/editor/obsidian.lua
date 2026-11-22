return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,
		ui = { enable = false },
		workspaces = {
			{ name = "vault", path = "~/vault" },
		},
	},
}
