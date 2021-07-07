" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
     
     Plug 'morhetz/gruvbox'     
     Plug 'terryma/vim-multiple-cursors' " ctrl-n / c
     Plug 'sheerun/vim-polyglot'
     Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
     Plug 'junegunn/fzf.vim' 
     Plug 'vim-scripts/AutoComplPop'
     Plug 'cohama/lexima.vim'

call plug#end()

colorscheme gruvbox 
set background=dark

set hidden

set hlsearch
set incsearch

set number
set relativenumber

set nowrap

set mouse=a
set ve=all

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set bs=2

" Tab completion
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :Files<cr>
