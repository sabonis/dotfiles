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
autocmd FileType javascript,typescript setlocal shiftwidth=2 softtabstop=2

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Fix backspace is not working
set backspace=indent,eol,start
" }}}
" Key Mappings {{{
let mapleader = ","
nnoremap <silent><Leader>z :Goyo<CR>
"autocmd VimEnter * :Goyo
nmap <silent><Leader>/ gcc
vmap <silent><Leader>/ gc

" nerdtree mapping
noremap <C-n> :NERDTreeToggle<CR>

" fzf mapping
noremap <C-p> :FZF<CR>

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

" make YCM compatible with UltiSnips (using supertab)
" see https://github.com/SirVer/ultisnips/issues/512#issuecomment-111733631
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" tsx in YCM
" see https://github.com/ycm-core/YouCompleteMe/issues/1841
autocmd BufEnter *.tsx set filetype=typescript

" ale settings
" use nice symbols for errors and warnings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" }}}
" My plugins {{{
" // excerpt from https://github.com/junegunn/vim-plug#example
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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'fatih/vim-go'
"
" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin fzf
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
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'arzg/vim-colors-xcode'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
" Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'

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
  colorscheme xcodelight
  " colorscheme one
  " set background=light  " Setting dark mode
  " let g:airline_theme='one'
  " let g:seoul256_background = 256
  " colo seoul256
  "colorscheme badwolf " awesome colorscheme
  " colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
  " endtry
endtry

"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
