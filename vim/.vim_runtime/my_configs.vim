set number
set expandtab smarttab
set clipboard=unnamedplus

" Disable folding
set foldcolumn=0
set foldlevelstart=99

" Enable mouse
set mouse=a
set ttyfast
set ttymouse=xterm

" Colors
"colorscheme delek
colorscheme wal
set t_Co=16
hi TabLineFill ctermfg=Black ctermbg=NONE
hi TabLine ctermfg=DarkGrey ctermbg=NONE cterm=NONE

" vim-racer
set hidden
let g:racer_cmd="~/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"
"let g:racer_experimental_completer = 1

" tab shortcuts
ca tn tabnew
ca th tabp
ca tl tabn

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='term'

" NERDTree
let g:NERDTreeWinPos = "left"
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
