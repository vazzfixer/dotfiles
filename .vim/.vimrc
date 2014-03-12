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
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))

filetype plugin indent on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
NeoBundle 'Shougo/neobundle.vim'
