local opt = vim.opt
local g = vim.g

opt.termguicolors = true
opt.clipboard = "unnamed,unnamedplus"
opt.fileencodings = "utf-8,gb2312"
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.colorcolumn = "80,100"
opt.mouse = "a"
opt.hidden = true
-- opt.autosave = false
opt.encoding = "utf8"
opt.ffs = "unix,dos,mac"
-- opt.nobackup = true
-- opt.nowritebackup = true
-- opt.noswapfile = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.lbr = true
opt.tw = 500
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.cmdheight = 2
opt.updatetime = 300
opt.signcolumn = "yes"
opt.whichwrap:append("<>hl")
opt.shortmess:append("c")

g.lasttab = 1

-- disable builtin vim plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- Don't show status line on certain windows
vim.cmd([[ au TermOpen term://* setlocal nonumber norelativenumber ]])
vim.cmd(
	[[let hidden_statusline =[ "NvimTree", "toggleterm" ] | autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter,TermEnter * nested if index(hidden_statusline, &ft) >= 0 | set laststatus=0 | else | set laststatus=2 | endif]]
)

-- Open a file from its last left off position
-- vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
-- File extension specific tabbing
-- vim.cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
