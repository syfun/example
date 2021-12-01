" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')

call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" https://github.com/morhetz/gruvbox
" Plug 'morhetz/gruvbox'

" https://github.com/itchyny/lightline.vim
" Plug 'itchyny/lightline.vim'

" https://github.com/glepnir/galaxyline.nvim
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" https://github.com/nvim-lualine/lualine.nvim
Plug 'nvim-lualine/lualine.nvim'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'

" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi'

" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" https://github.com/Yggdroot/LeaderF
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify' 

" https://github.com/JamshedVesuna/vim-markdown-preview
" Plug 'JamshedVesuna/vim-markdown-preview'

" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" https://github.com/lukas-reineke/indent-blankline.nvim
" Plug 'lukas-reineke/indent-blankline.nvim'

" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"" Initialize plugin system

" https://github.com/kyazdani42/nvim-web-devicons
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)

" https://github.com/folke/trouble.nvim
" Plug 'folke/trouble.nvim'

" Plug 'ryanoasis/vim-devicons' Icons without colours
" https://github.com/akinsho/nvim-bufferline.lua
Plug 'akinsho/nvim-bufferline.lua'

" https://github.com/kyazdani42/nvim-tree.lua
Plug 'kyazdani42/nvim-tree.lua'

" https://github.com/akinsho/nvim-toggleterm.lua
Plug 'akinsho/nvim-toggleterm.lua'

" https://github.com/neovim/nvim-lspconfig
" Collection of configurations for built-in LSP client
Plug 'neovim/nvim-lspconfig'

" https://github.com/hrsh7th/nvim-cmp
" Autocompletion plugin
Plug 'hrsh7th/nvim-cmp'

" https://github.com/hrsh7th/cmp-nvim-lsp
" LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" https://github.com/saadparwaiz1/cmp_luasnip
" Snippets source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip'

" https://github.com/L3MON4D3/LuaSnip
" Snippets plugin
Plug 'L3MON4D3/LuaSnip'

" https://github.com/lukas-reineke/indent-blankline.nvim
Plug 'lukas-reineke/indent-blankline.nvim'

" https://github.com/sbdchd/neoformat
" Plug 'sbdchd/neoformat'

" https://github.com/mfussenegger/nvim-dap
"Plug 'mfussenegger/nvim-dap'
"Plug 'rcarriga/nvim-dap-ui'

call plug#end()

let mapleader = " "

autocmd FileType json syntax match Comment +\/\/.\+$+

" line
nnoremap g9 $


" window related
nnoremap <silent> <leader>wh <C-W>h<CR>
nnoremap <silent> <leader>wj <C-W>j<CR>
nnoremap <silent> <leader>wk <C-W>k<CR>
nnoremap <silent> <leader>wl <C-W>l<CR>
nnoremap <silent> q  :<c-u>q<CR>
nnoremap <silent> qq  :<c-u>q!<CR>
nnoremap <silent> qa  :<c-u>qall!<CR>

" move to window by number
" let i = 1
" while i <= 8
"     execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
"     let i = i + 1
" endwhile
"
" let i = 1
" while i <= 5
"     execute 'nnoremap t' . i . ' :' . i . 'tabn<CR>'
"     let i = i + 1
" endwhile

inoremap jk <esc>


" toggle search highlight 
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>


syntax on
colorscheme onedark
highlight Comment cterm=italic gui=italic
" colorscheme gruvbox
" set background=light   " Setting light mode

" Fast saving
" nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" nnoremap <silent> <leader>1 :b1<CR>
" nnoremap <silent> <leader>2 :b2<CR>
map <leader>ba :bufdo bd<cr>

"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" --------------------------------------
" onedark config
" --------------------------------------
let g:onedark_hide_endofbuffer = 1

" --------------------------------------
" surround.vim config
" Annotate strings with gettext 
" --------------------------------------
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" --------------------------------------
" nerdcommenter config
" --------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" --------------------------------------
" easymotion config
" --------------------------------------
map <Leader>j. <Plug>(easymotion-repeat)
map <Leader>jl <Plug>(easymotion-lineforward)
map <Leader>jj <Plug>(easymotion-j)
map <Leader>jk <Plug>(easymotion-k)
map <Leader>jh <Plug>(easymotion-linebackward)
map <leader>jn <Plug>(easymotion-n)
map <leader>js <Plug>(easymotion-s)
map <leader>jw <Plug>(easymotion-w)
map <leader>jb <Plug>(easymotion-b)


lua require('init')

" for neoformat
let g:neoformat_enabled_python = ['black', 'isort']
let g:neoformat_run_all_formatters = 1
