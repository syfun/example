local function map(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- basic
map("n", "<leader>fs", ":update<CR>")
map("n", "<leader>fd", ":e $HOME/.config/nvim/init.vim<CR>")

-- navigation within insert mode
map("i", "<C-l>", "<Right>", opt)
map("i", "<C-h>", "<Left>", opt)
map("i", "<C-a>", "<ESC>^i", opt)
map("i", "<C-e>", "<End>", opt)
map("i", "<C-j>", "<Up>", opt)
map("i", "<C-k>", "<Down>", opt)
-- navigation within insert mode

-- -------nvimtree-------
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- -------nvimtree-------

-- -------toggleterm-------
-- Open terminals
map("n", "<leader>w", ":lua termW:toggle() <CR>", opt)
map("n", "<leader>v", ":lua termV:toggle() <CR>", opt)
map("n", "<leader>h", ":lua termH:toggle() <CR>", opt)

-- toggle(HIDE) a term from within terminal edit mode
map("t", "JK", "<C-\\><C-n> :ToggleTerm <CR>", opt)
map("t", "JK", "<C-\\><C-n> :ToggleTerm <CR>", opt)
map("t", "JK", "<C-\\><C-n> :ToggleTerm <CR>", opt)
-- -------toggleterm-------

-- -------bufferline-------
map("n", "<S-t>", ":enew<CR>", opt) -- new buffer
map("n", "<C-t>b", ":tabnew<CR>", opt) -- new tab
map("n", "<S-x>", ":bd!<CR>", opt) -- close  buffer

-- move between tabs

map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)
-- -------bufferline-------

-- -------telescope-------
map("n", "<leader>fw", ":Telescope live_grep<CR>", opt)
map("n", "<leader>gt", ":Telescope git_status <CR>", opt)
map("n", "<leader>cm", ":Telescope git_commits <CR>", opt)
map("n", "<C-p>", ":Telescope find_files <CR>", opt)
map("n", "<C-e>", ":Telescope buffers<CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<leader>fo", ":Telescope oldfiles<CR>", opt)
map("n", "<leader>th", ":Telescope themes<CR>", opt)
-- -------telescope-------
