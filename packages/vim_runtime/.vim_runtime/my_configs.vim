" Keybindings
nmap <leader>q :q!<cr>

"Theme
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme gruvbox


" NerdTree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1

autocmd StdinReadPre * let s:std_in=1
" Open nerdtree on vim startup
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open nerdtree if directory opened
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close nerdtree if only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


