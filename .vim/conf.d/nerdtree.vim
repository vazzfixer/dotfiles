" ブックマークを最初から表示
let g:NERDTreeShowBookmarks=1
" NERDTreeをデフォルトで起動
let file_name = expand("%")
" if has('vim_starting') &&  file_name == ""
if has('vim_starting')
    autocmd VimEnter * NERDTree|normal gg3j
endif
