"---------------------------------------
" vim settings
"---------------------------------------
set nocompatible      " No vim compatibility
set number            " 行数を表示
set expandtab
set tw=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%   " 見えない文字を可視化
set clipboard+=unnamed
syntax on
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

"load vim setting files
runtime! conf.d/*.vim

call neobundle#end()
NeoBundleCheck
