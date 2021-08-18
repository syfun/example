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
opt.whichwrap:append "<>hl"
opt.shortmess:append "sI"

g.lasttab = 1
