set background=dark
colorscheme badwolf
"set bg=dark "Uncomment for gruvbox

syntax on
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set number
set showcmd
set cursorline
set showmatch
set incsearch
nnoremap j gj
nnoremap k gk
nnoremap gV '[v']
set autoindent
set pastetoggle=<f2>    "Press F2 before pasting to prevent indent cascading

filetype on "detect filetype

" C++ highlighing options
autocmd BufRead,BufNewFile *.cc,*.h let g:cpp_class_scope_highlight = 1
autocmd BufRead,BufNewFile *.cc,*.h let g:cpp_member_variable_highlight = 1
autocmd BufRead,BufNewFile *.cc,*.h let g:cpp_experimental_template_highlight = 1
autocmd BufRead,BufNewFile *.cc,*.h set cindent

" turn python hilighting on in .py files
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
