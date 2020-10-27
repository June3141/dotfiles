" ==== general ================================================================
" shell の指定
set shell=/bin/zsh

" 文字コードの設定
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

" mouse の有効化
set mouse=a

" ヤンクをクリップボードに
set clipboard+=unnamedplus
set hls

" xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x

" 折返し行移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" Leader キーの設定
let mapleader = "\<Space>"

" ==== search =============================================================== "
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" ==== command ===============================================================
set wildmenu " コマンドモードの補完
