return {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.opt.background = "dark"
		vim.cmd.colorscheme("oxocarbon")

		local clear = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"FloatBorder",
			"SignColumn",
			"LineNr",
			"CursorLineNr",
			"EndOfBuffer",
			"FoldColumn",
			"MsgArea",
			"StatusLine",
			"StatusLineNC",
			"TabLineFill",
		}
		for _, group in ipairs(clear) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end

		local sage = "#9db89a"
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = sage, bold = true, bg = "none" })
		vim.api.nvim_set_hl(0, "Visual", { bg = "#3b4a3a" })
		vim.api.nvim_set_hl(0, "Search", { fg = "#161616", bg = sage })
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#161616", bg = "#ee5396" })
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#393939", bg = "none" })
	end,
}
