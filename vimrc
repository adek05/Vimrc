set nocompatible               " be iMproved
filetype off                   " required!

" Vundle setup
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" My Bundles here:
Bundle "Valloric/YouCompleteMe"
Bundle "scrooloose/syntastic"
Bundle "scrooloose/nerdtree"
Bundle "vividchalk.vim"
Bundle "elliottt/haskell-indent"
" original repos on github

" vim-scripts repos
" non github repos
colorscheme vividchalk

filetype plugin indent on     " required!
set expandtab
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

" Tab settings for different filetypes
autocmd Filetype c setlocal ts=2 sts=2 sw=2
autocmd Filetype cpp setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

autocmd FileType haskell setlocal expandtab
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4

syntax on
" TODO: This needs to be tuned
let g:ycm_global_ycm_extra_conf = '/Users/adek/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
