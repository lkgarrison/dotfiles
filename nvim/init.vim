" Pull in .vimrc as a starting point
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" nvim 

" Install Vim-plug if it isn't already
let $NVIMRC = '~/.config/nvim/init.vim'
if empty(glob($NVIMRC))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $NVIMRC
endif

" Specifies the directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Add plugins here
"
" ALE uses filetype-specific settings located:
"   ~/.local/share/nvim/site/ftplugin/
Plug 'w0rp/ale'
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:airline#extensions#ale#enabled = 1

" Enable completions as you type
let g:ale_completion_enabled = 1
" Use tab and shift-tab to cycle through completion suggestions
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Initialize plugin system
call plug#end()

" Enables ftplugin to load language-specific settings when the relevant file
" type is loaded in the buffer
" https://github.com/neovim/neovim/blob/master/runtime/ftplugin/README.txt
:filetype plugin on
