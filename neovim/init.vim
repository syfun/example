" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')

call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" https://github.com/Shougo/defx.nvim
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" https://github.com/kristijanhusak/defx-git
Plug 'kristijanhusak/defx-git'
" https://github.com/kristijanhusak/defx-icons
Plug 'kristijanhusak/defx-icons'

" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Language server protocol support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'

" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" https://github.com/liuchengxu/vim-which-key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" https://github.com/Yggdroot/LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'


" Initialize plugin system
call plug#end()

" ---------------------
" vim-which-key
" ---------------------
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
" By default timeoutlen is 1000 ms
set timeoutlen=200

" let g:which_key_map = {}
let g:which_key_map = {
    \ 'name': 'space root'
    \ }

let g:which_key_map.f = { 
    \ 'name' : '+file',
    \ 's': ['update', 'save-file'],
    \ 'd': 'open-init-vim'
    \ }

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'vsplit-window-right']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map['j'] = {
      \ 'name' : '+jump/json'                   ,
      \ 'j' : 'easymotion-goto-char'       ,
      \ 'J' : 'easymotion-goto-char-2'     ,
      \ 'l' : 'jump-linewise'              ,
      \ 'w' : 'jump-to-word-bidirectional' ,
      \ 'f' : 'jump-forward-wordwise'      ,
      \ 'b' : 'jump-backword-wordwise'     ,
      \ 'F' : ['execute line(".")."!python -m json.tool"', 'format-current-raw-oneline-json'],
      \ }

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" --------------------------------------
" basic config
" --------------------------------------
set clipboard=unnamed,unnamedplus
set fileencodings=utf-8,gb2312
set foldlevel=99
set foldmethod=indent

autocmd FileType json syntax match Comment +\/\/.\+$+

" line
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
nnoremap g9 $

" file related
nnoremap <silent> <leader>fs :update<CR>
nnoremap <silent> <leader>fd :e $HOME/.config/nvim/init.vim<CR>

" window related
nnoremap <silent> <leader>wh <C-W>h<CR>
nnoremap <silent> <leader>wj <C-W>j<CR>
nnoremap <silent> <leader>wk <C-W>k<CR>
nnoremap <silent> <leader>wl <C-W>l<CR>
nnoremap <silent> q  :<c-u>q<CR>
nnoremap <silent> qa  :<c-u>qall!<CR>

" move to window by number
let i = 1
while i <= 8
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

let i = 1
while i <= 5
    execute 'nnoremap t' . i . ' :' . i . 'tabn<CR>'
    let i = i + 1
endwhile

inoremap jk <esc>

 "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
" colorscheme onedark
colorscheme gruvbox

" Fast saving
" nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" set autoindent

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" nnoremap <silent> <leader>1 :b1<CR>
" nnoremap <silent> <leader>2 :b2<CR>
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
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
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" --------------------------------------
" onedark config
" --------------------------------------
let g:onedark_hide_endofbuffer = 1

" --------------------------------------
" lightline config
" --------------------------------------
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction


function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'winnumber', 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'winnumber', 'mode'] ]
      \},
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'winnumber': 'WindowNumber'
      \ },
      \ }

" --------------------------------------
" coc.nvim config
" --------------------------------------
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
" call SetupCommandAbbrs('C', 'CocConfig')

" map <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" +++++++++++++++++
" golang  
" coc-go
" +++++++++++++++++
" Add missing imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :call CocAction('format')

" Map Keys to command
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>


" +++++++++++++++++
" python  
" coc-python
" +++++++++++++++++
let g:python3_host_prog = '$HOME/.pyenv/versions/3.8.2/bin/python'
" Add missing imports on save
autocmd BufWritePre *.py :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.py :call CocAction('format')


" --------------------------------------
" Shougo/defx.nvim
" --------------------------------------
nmap <silent> <Leader>e :Defx <cr>

let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
            \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()` <CR>
nnoremap <silent> <LocalLeader>a
            \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

call defx#custom#option('_', {
            \ 'columns': 'indent:git:icons:filename',
            \ 'winwidth': 35,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 0,
            \ 'root_marker': '≡ ',
            \ 'ignored_files':
            \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
            \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
            \   . ',.idea'
            \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ? 
                \ defx#do_action('open_tree') : 
                \ defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> s
                \ defx#do_action('multi', [['drop', 'split']])
    nnoremap <silent><buffer><expr> v
                \ defx#do_action('multi', [['drop', 'vsplit']])
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnorema <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> i
                \ defx#do_action('multi',[['drop','split']])
    nnoremap <silent><buffer><expr> l
                \ defx#is_directory() ? 
                \ defx#do_action('open_tree') : 
                \ defx#do_action('multi', ['drop'])
"    nnoremap <silent><buffer><expr> E
"                \ defx#do_action('open')
"    nnoremap <silent><buffer><expr> P
"                \ defx#do_action('open', 'pedit')
   nnoremap <silent><buffer><expr> o
                \ defx#is_directory() ? 
                \ defx#do_action('open_or_close_tree') : 
                \ defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
"    nnoremap <silent><buffer><expr> M
"                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:indent:icon:filename:type:size:time')
"    nnoremap <silent><buffer><expr> S
"                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
"    nnoremap <silent><buffer><expr> !
"                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('close_tree')
   nnoremap <silent><buffer><expr> yy
               \ defx#do_action('yank_path')
"    nnoremap <silent><buffer><expr> .
"                \ defx#do_action('toggle_ignored_files')
"    nnoremap <silent><buffer><expr> ;
"                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
"    nnoremap <silent><buffer><expr> cd
"                \ defx#do_action('change_vim_cwd')
endfunction

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


" LeaderF
let g:Lf_CommandMap = {'<c-j>': ['<c-n>'], '<c-k>': ['<c-p>'], '<down>': ['<c-j>'], '<up>': ['<c-k>'], '<c-p>': ['<c-l>']}
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutB = "<c-e>"
let g:Lf_ShortcutF = "<c-p>"
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowPosition = 'popup'