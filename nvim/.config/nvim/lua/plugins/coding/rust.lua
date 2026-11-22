return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					capabilities = require("blink.cmp").get_lsp_capabilities(),
					on_attach = function(_, bufnr)
						local map = function(keys, fn, desc)
							vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "Rust: " .. desc })
						end
						map("<leader>ca", function()
							vim.cmd.RustLsp("codeAction")
						end, "Code action")
						map("K", function()
							vim.cmd.RustLsp({ "hover", "actions" })
						end, "Hover actions")
						map("<leader>rr", function()
							vim.cmd.RustLsp("runnables")
						end, "Runnables")
						map("<leader>rd", function()
							vim.cmd.RustLsp("debuggables")
						end, "Debuggables")
						map("<leader>rt", function()
							vim.cmd.RustLsp("testables")
						end, "Testables")
						map("<leader>re", function()
							vim.cmd.RustLsp("expandMacro")
						end, "Expand macro")
						map("<leader>rp", function()
							vim.cmd.RustLsp("parentModule")
						end, "Parent module")
					end,
					default_settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
							check = { command = "clippy" },
							procMacro = { enable = true },
						},
					},
				},
			}
		end,
	},

	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = { rust = { "rustfmt" } },
			format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "rust", "toml" })
		end,
	},
}
