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
Bundle "elliottt/haskell-indent"
Bundle "kana/vim-filetype-haskell"
Bundle "vividchalk.vim"
Bundle "jellybeans.vim"
Bundle "plasticboy/vim-markdown"
" Python stuff
Bundle "Python-mode-klen"
" original repos on github

" vim-scripts repos
" non github repos
colorscheme vividchalk

filetype plugin indent on     " required!
set expandtab
" or 
filetype plugin on          " to not use the indentation settings set by plugins

" Default tab settings
set ts=4
set sts=4
set sw=4

" Tab settings for different filetypes
autocmd Filetype c setlocal ts=2 sts=2 sw=2
autocmd Filetype cpp setlocal ts=2 sts=2 sw=2

autocmd FileType haskell setlocal expandtab
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4

autocmd FileType python setlocal ts=4 expandtab sw=4 sts=4
autocmd FileType python colorscheme jellybeans


syntax on
" TODO: This needs to be tuned
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Statusline
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" Per plugin settings
" Markdown
let g:vim_markdown_folding_disabled=1
