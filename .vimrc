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

try
  colorscheme gruvbox
  set background=dark  " Setting dark mode
  "colorscheme badwolf " awesome colorscheme
  "packadd! dracula
  "colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
  " endtry
endtry

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
" My plugins {{{
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
"call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('pangloss/vim-javascript')
call minpac#add('junegunn/goyo.vim')
call minpac#add('sjl/badwolf')
call minpac#add('tpope/vim-commentary')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('tpope/vim-fugitive')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('dracula/vim', {'name': 'dracula'})
call minpac#add('morhetz/gruvbox')
call minpac#add('junegunn/vim-easy-align')
" }}}
" Utility functions {{{
function UpdatePlugin()
  call minpac#update()
endfunction
" }}}
