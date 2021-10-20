call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
