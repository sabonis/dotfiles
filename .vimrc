" vim:foldmethod=marker:foldlevel=0
" Basic Settings {{{
syntax enable
filetype plugin indent on
set autochdir
set autoindent	
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set smarttab
set number
set hlsearch
set modeline
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Fix backspace is not working
set backspace=indent,eol,start
" }}}
" Key Mappings {{{
let mapleader = ","
nnoremap <silent><Leader>z :Goyo<CR>
nmap <silent><Leader>/ gcc
vmap <silent><Leader>/ gc
"autocmd VimEnter * :Goyo
" }}}
" Plugin Settings {{{
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=0

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" vim-easy-align settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" // excerpt from https://github.com/junegunn/vim-plug#example
" My plugins {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"
" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
"
" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" When fzf is not installed by Homebrew
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
"
Plug 'pangloss/vim-javascript'
Plug 'junegunn/goyo.vim'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
"
" Initialize plugin system
call plug#end()
" }}}
" Utility functions {{{
function UpdatePlugin()
  call minpac#update()
endfunction
" }}}

" Strange color issue, color setiing must put it in the end of .vimrc
" see https://github.com/dracula/dracula-theme/issues/80#issuecomment-346719383
try
  " colorscheme gruvbox
  " set background=dark  " Setting dark mode
  "colorscheme badwolf " awesome colorscheme
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
  " endtry
endtry

