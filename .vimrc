" No vi compatibility
set nocompatible
" 行数を表示
set number
" ~ファイルを作らない
set nobackup
" swpファイルを作らない
set noswapfile
" スクロール時の余白確保
" set scrolloff=10
" No beep sound
set visualbell t_vb=
" 前行へのバックスペース許可など
set backspace=indent,eol,start
" 見えない文字を可視化
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set hidden
syntax on
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

"------------------------------------
" status bar
"------------------------------------
set ruler
set cmdheight=1
set title
set linespace=0
set wildmenu
set showcmd
" バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1
" 現在のバッファをハイライト
let g:buftabs_active_highlight_group="Visual"
" ステータスライン
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\[%04l,%04v][%02p%%]
" ステータスラインを常に表示
set laststatus=2
" No paren match
let loaded_matchparen = 1
 
"------------------------------------
" indent
"------------------------------------
" Tab 文字を空白文字に置き換える (:set noet to off)
set expandtab
" Tab 入力時に挿入する空白文字の数
set softtabstop=2 " ruby
" Indent 時に挿入する空白文字の数
set shiftwidth=2
" 改行時にオートインデント
set autoindent
" スマートインデント
set smartindent


"----------------------------------------------------
" neobundle.vim
" memo: NeoBundleList NeoBundleInstall NeoBundleClean
"----------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'violetyk/cake.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'taglist.vim'
NeoBundle 'ZenCoding.vim'
NeoBundle 'ref.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'fugitive.vim'
NeoBundle 'TwitVim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'dbext.vim'
NeoBundle 'rails.vim'
NeoBundle 'Gist.vim'
NeoBundle 'motemen/hatena-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'open-browser.vim'
NeoBundle 'ctrlp.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'tpope/vim-markdown'

" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin indent on

NeoBundleCheck
