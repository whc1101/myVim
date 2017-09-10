set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

" Outline
Plugin 'majutsushi/tagbar'

" Code folding
Plugin 'tmhedberg/SimpylFold'

" Auto completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" Status line
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Turn on numbering
set nu

" Number of spaces that a pre-existing tab is equal to.
set tabstop=4

" Global clipboard
set clipboard=unnamed

" Spaces for indents
set shiftwidth=4
set expandtab
set softtabstop=4

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Set stauts
set statusline=%2*%n%m%r%h%w%*\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [TYPE=%2*%Y%1*]\ [COL=%2*%03v%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]

" Set show cmd
set showcmd

" make backspaces more powerfull
set backspace=indent,eol,start

" Color adaptive
set t_Co=256
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme molokai
endif

nnoremap <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc']

nmap <F8> :TagbarToggle<CR>

filetype plugin on  

""""""""""""""""""""""
" Quickly Run
""""""""""""""""""""""
map <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    endif
endfunc
