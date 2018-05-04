" Header {{{
" vim: set foldmethod=marker foldlevel=0:
" Author: David Richardson
" Author Email: davidrichardson96@gmail.com
" }}}
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
" General Key Mappings {{{
    let mapleader=","
    " Quick vimrc edits
    nnoremap <leader>ev :sp $MYVIMRC
    nnoremap <leader>sv :source $MYVIMRC
    " Easier escape
    inoremap jk <esc>
    vnoremap jk <esc>
    inoremap kj <esc>
    vnoremap kj <esc>
    " Easy All Caps
    nnoremap viwU
    inoremap <esc>viwUea
    " File Explorer
    nnoremap <leader>se :Sexplore<cr>
    nnoremap <leader>ve :Vexplore<cr>
    nnoremap <leader>e :Explore<cr>
    " }}}
" General Abbreviations {{{
    iabbrev adn and
    iabbrev tehn then
    iabbrev @@ davidrichardson96@gmail.com
    " }}}
" Better Movement {{{
    " Super h,l
    nnoremap H ^
    nnoremap L $
    " Better j,k
    nnoremap j gj
    nnoremap k gk
    " Easier movement between splits
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l
    nnoremap <c-h> <c-w>h
    " }}}
" Tabs and Buffers {{{
    set hidden
    " Easily open last buffer
    nnoremap <leader>b :silent execute "rightbelow split " .bufname("#")<cr>
    " }}}
" Searching {{{
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    nnoremap <leader><space> :nohlsearch<cr>
    " }}}
" Folding {{{
    set foldenable
    set foldlevelstart=11
    set foldnestmax=10
    set foldmethod=manual
    nnoremap <space> za
    " Change fold level
    nnoremap <leader>f0 :set foldlevel=0<cr>
    nnoremap <leader>f1 :set foldlevel=1<cr>
    nnoremap <leader>f2 :set foldlevel=2<cr>
    nnoremap <leader>f3 :set foldlevel=3<cr>
    nnoremap <leader>f4 :set foldlevel=4<cr>
    nnoremap <leader>f5 :set foldlevel=5<cr>
    nnoremap <leader>f6 :set foldlevel=6<cr>
    nnoremap <leader>f7 :set foldlevel=7<cr>
    nnoremap <leader>f8 :set foldlevel=8<cr>
    nnoremap <leader>f9 :set foldlevel=9<cr>
    " }}}
" Tabs {{{
    " Tab is 4 characters wide and not expanded
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    " }}}
" File Formatting and Display {{{
    filetype plugin indent on
    set autoindent
    set number
    set wildmenu
    set cursorline
    set showcmd
    set scrolloff=3
    set showmatch
    " Display tabs and extra spaces
    set list
    " Allow changing indent without exiting visual mode
    vnoremap < <gv
    vnoremap > >gv
    " }}}
" Extra Settings {{{
    set modeline=1
    set splitright
    set splitbelow
    " }}}
" Plugins {{{
    " Autoinstall Vim-Plug {{{
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
        " }}}

    call plug#begin('~/.vim/plugged')

    " Git Integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " Unix Integration
    Plug 'tpope/vim-eunuch'
    " Easier (),{},[],'',"" Management
    Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-surround'
    " Intelligently End Functions
    Plug 'tpope/vim-endwise'
    " Useful Paired Mappings
    Plug 'tpope/vim-unimpaired'
    " Expand . To Repeat Plugin Commands
    Plug 'tpope/vim-repeat'
    " Easier Commenting - Nerd Commenter {{{
        " Plug 'tpope/vim-commentary'
        Plug 'scrooloose/nerdcommenter'
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDCommentEmptyLines = 1
        let g:NERDTrimTrailingWhitespace = 1
        " }}}
    " Better Filetype Specific Support {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        Plug 'dhruvasagar/vim-table-mode' { 'for': 'markdown' }
        let g:table_mode_corner='|'
        Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
        let g:SimpylFold_docstring_preview=1
        " }}}
    " Better Status-line - Airline {{{
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme='gruvbox'
        let g:airline_powerline_fonts = 1
        " }}}
    " File Explorer {{{
        Plug 'tpope/vim-vinegar'
        Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
        Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
        autocmd StdinReadPre * let s:std_in=1
        noremap <C-n> :NERDTreeToggle<cr>
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
            \b:NERDTree.isTabTree()) | q | endif
        " }}}
    " Autocompletion - Deoplete {{{
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
            Plug 'zchee/deoplete-jedi'
            Plug 'zchee/deoplete-clang'
            let g:deoplete#enable_at_startup=1
            " Deoplete Enable Tab Completion
            inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
            " Required Clang Settings
            let g:deoplete#sources#clang#libclang_path='/usr/lib64/llvm/libclang.so'
            let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
            call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
        else
            Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
        " }}}
    " Quickly Navigate Through a File
    Plug 'easymotion/vim-easymotion'
    " Fuzzy Searcher - FZF {{{
        " Plug 'ctrlpvim/ctrlp.vim'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        let g:fzf_action = {
            \ 'ctrl-j': 'split',
            \ 'ctrl-k': 'vsplit',
            \ 'ctrl-t': 'tab split' }
        nnoremap ; :Buffers<cr>
        nnoremap <leader>f :Files<cr>
        nnoremap <leader>g :GFiles<cr>
        nnoremap <leader>t :Tags<cr>
    " }}}
    " Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'reedes/vim-colors-pencil', {'on': 'Goyo'}
    " Distraction Free Editing - Goyo {{{
        Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
        function! s:goyo_enter()
            set nonumber
            set norelativenumber
            colorscheme pencil
            set background=light
        endfunction
        
        function! s:goyo_leave()
            colorscheme gruvbox
            set number
            set background=dark
        endfunction

        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()
        " }}}
    " }}}
