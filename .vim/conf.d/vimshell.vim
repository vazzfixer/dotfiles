NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'

let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "

" vimshell map
" nnoremap <silent> vs :VimShell<CR>
" nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vs :VimShellPop<CR>
