" Autor: wallacy 
" Código: https://github.com/wlcsv/my-dotfiles.git

" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    
    " Plug 'vim-scripts/AutoComplPop'
    Plug 'Raimondi/delimitMate'
    Plug 'codota/tabnine-vim'
    Plug 'crusoexia/vim-dracula'
    Plug 'sheerun/vim-polyglot'

call plug#end()

" LINE
set number " switch on line numbering

" COMMAND LINE
set wildmenu
set wildmode=list:longest

" COLOR SCHEME
colorscheme dracula

" COMPATIBLE
set nocp
set ve=all

" FONT
set antialias

" ENCODING
set encoding=utf-8

" SOUND ERROR
set vb

" IDENTATION
set ai 
set tabstop=4
set softtabstop=4
set smartindent
set expandtab
set backspace=indent,eol,start

" ARCHIVE
set title
set ttyfast
set background=dark

" SYNTAX
syntax on
