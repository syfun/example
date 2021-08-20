local M = {}
local g = vim.g

M.blankline = function()
	g.indentLine_enabled = 1
	g.indent_blankline_char = "▏"

	g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "packer" }
	g.indent_blankline_buftype_exclude = { "terminal" }

	g.indent_blankline_show_trailing_blankline_indent = false
	g.indent_blankline_show_first_indent_level = false
end

-- M.neoformat = function()
-- 	g.neoformat_enabled_python = { "isort" }

-- 	g.neoformat_python_black = {
-- 		args = { "-S", "-l 100" },
-- 	}
-- 	g.neoformat_run_all_formatters = 1
-- end
return M
