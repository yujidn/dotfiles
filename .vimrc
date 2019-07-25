" 挙動を vi 互換ではなく、Vim のデフォルト設定にする => .vimrcが存在すれば自動的に有効化されるので設定不要
" set nocompatible
" 一旦ファイルタイプ関連を無効化する => vim-plugでは不要
" filetype off

" leaderをSpaceにする
let mapleader = "\<Space>"

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
" Gitを便利に使う
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Rails向けのコマンドを提供する
" Plug 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
" Plug 'KohPoll/vim-less'

" RubyMineのように自動保存する
Plug '907th/vim-auto-save'
let g:auto_save = 1


"""python"""
" pythonの補間プラグイン
Plug 'davidhalter/jedi-vim'
" pythonのスタイルチェック
Plug 'andviro/flake8-vim'
" pythonのインデント違反をなくす奴
Plug 'hynek/vim-python-pep8-indent'


""" 入力補完
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

""" LSP だいたいgoよう
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

let g:LanguageClient_serverCommands = {
      \  'go': [$GOPATH.'/bin/gopls','-format-tool','gofmt','-lint-tool','golint'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'python': ['/usr/local/bin/pyls'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }

set hidden

"""c++"""
Plug 'zchee/deoplete-clang'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

Plug 'Shougo/vimproc.vim',{
            \ 'build' : {
            \ 'windows' : 'make -f make_mingw32.mak',
            \ 'cygwin' : 'make -f make_cygwin.mak',
            \ 'mac' : 'make -f make_mac.mak',
            \ 'unix' : 'make -f make_unix.mak',
            \ },
            \ }
Plug 'justmao945/vim-clang'
Plug 'Shougo/neoinclude.vim'


"""markdown"""
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'tpope/vim-markdown'


" quickrun
Plug 'thinca/vim-quickrun'

" filetypeの検出を有効化する => vim-plugでは不要
" filetype plugin indent on
"

""" review """
Plug 'tokorom/vim-review'
let g:vim_review#include_filetypes = ['c++']
let g:vim_review#include_filetypes = ['cpp']


""" 日本語入力補助"""
Plug 'deton/jasegment.vim'

"""easy motion"""
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_keys = 'asdfhjkl'

""" go """
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/nvim-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

""" vlang """
Plug 'ollykel/v-vim'
au BufNewFile,BufRead *.v,*.vh	setf vlang

""" 括弧に色つけるやつ """
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle



call plug#end()

"""""""""""""""""""""""""""

""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" undoファイルは作成しない
set noundofile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
autocmd FileType review setlocal noet
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 勝手に改行するのを防ぐ
" set textwidth=0
set formatoptions=q
" textwidthでフォーマットさせたくない
set formatoptions=q
" クラッシュ防止（http://superuser.com/questions/810622/vim-crashes-freezes-on-specific-files-mac-osx-mavericks）
set synmaxcol=200
" clipboard
" "+yと打つとclipboardにヤンク内容が入る
" nvim では使用できない
" set clipboard=unnamed,autoselect

""""""""""""""""""""""""""""""
""" map関連
" shift-hで先頭に移動
noremap <S-h> ^
" shift-lで末尾に移動
noremap <S-l> $
" shift-jでページダウンに移動
noremap <S-j> }
" shift-kでページアップに移動
noremap <S-k> {
" Ctrl-cでクリップボードにコピー
noremap <C-c> "+y

" Ctrl-jでEscする
noremap! <C-j> <ESC>
noremap <C-j> <ESC>

" gtnでtabnew ついでにNERDTreeを
" gTとgtでタブ移動(デフォルト)
noremap gtn :tabnew+NERDTree<CR>
" gnでNERDTreeを起動する
noremap gn :NERDTree<CR>

" 検索時のハイライトをESC2連で消す
nnoremap <ESC><ESC> :noh<CR><ESC>

" 水平タブにvimrcを開く
noremap :vimrc :edit ~/dotfiles/.vimrc
noremap :svimrc :source ~/dotfiles/.vimrc

""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
"""""""""""""""""""""""""""""

" jedivim用設定
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1
autocmd FileType python let b:did_ftplugin = 1


" cudaのファイルをc++にする
autocmd BufNewFile,BufRead *.cu setf cpp

"""""""""""""""""""""""""""
" vim-clang周りの設定
"""""""""""""""""""""""""""
" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

if executable('clang-6.0')
    let g:clang_exec = 'clang-6.0'
elseif executable('clang-3.9')
    let g:clang_exec = 'clang-3.9'
elseif executable('clang-3.8')
    let g:clang_exec = 'clang-3.8'
elseif executable('clang-3.7')
    let g:clang_exec = 'clang-3.7'
elseif executable('clang-3.6')
    let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
    let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
    let g:clang_exec = 'clang-3.4'
else
    let g:clang_exec = 'clang'
endif

if executable('clang-format-6.0')
    let g:clang_format_exec = 'clang-format-6.0'
elseif executable('clang-format-3.9')
    let g:clang_format_exec = 'clang-format-3.9'
elseif executable('clang-format-3.8')
  let g:clang_format_exec = 'clang-format-3.8'
elseif executable('clang-format-3.7')
  let g:clang_format_exec = 'clang-format-3.7'
elseif executable('clang-format-3.6')
    let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
    let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
    let g:clang_format_exec = 'clang-format-3.4'
else
    let g:clang_format_exec = 'clang-format'
endif

let g:clang_c_options = '-std=c14'
"let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'
let g:clang_cpp_options = '-std=c++14'


""" clang-formatを実行する
""" pyの場所がわからない時は、$ dkpg -L clang-format
""" をするとインストール先がわかる。パーミッション設定必要かも
function! CPPCodeCleanup()
  " echo "Cleanup cpp code"
  let l:lines="all"
  let g:clang_format_fallback_style = 'Google'
  :pyf /usr/share/vim/addons/syntax/clang-format.py
endfunction
command! CPPCodeCleanup call CPPCodeCleanup()

autocmd BufWrite *.{cpp} :CPPCodeCleanup
autocmd BufWrite *.{hpp} :CPPCodeCleanup
autocmd BufWrite *.{c} :CPPCodeCleanup
autocmd BufWrite *.{h} :CPPCodeCleanup


""" lspの設定
""""""""""""""""""""""""""""""
" filetypeの自動検出(最後の方に書いた方がいいらしい)
""""""""""""""""""""""""""""""
filetype on

