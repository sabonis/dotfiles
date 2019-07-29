" My settings
syntax on
filetype plugin on
set autochdir
set autoindent	
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4	
set number
set hlsearch
colorscheme badwolf " awesome colorscheme

" Key mappings
let mapleader = ","
nnoremap <silent><Leader>z :Goyo<CR>
nmap <silent><Leader>/ gcc
vmap <silent><Leader>/ gc
"autocmd VimEnter * :Goyo

" plugin settings
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

function SetupPlugins()
    " My plugins
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
endfunction

call SetupPlugins()

