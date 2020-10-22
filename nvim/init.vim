filetype plugin indent off

" ==== set vim environment ======================================
if has('nvim')
  let g:vim_home = expand("~/.config/nvim")
  let g:rc_dir = expand("~/.config/nvim/config")
  let g:plugins_rc_dir = expand("~/.config/nvim/plugins")
else
  let g:vim_home = expand('~/.vim')
  let g:rc_dir = expand('~/.vim/rc')
  let g:plugins_rc_dir = expand("~/.config/nvim/plugins")
endif

" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
  let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
  if filereadable(rc_file)
    execute 'source' rc_file
  endif
endfunction

" 基本設定
call s:source_rc("config.rc.vim")

" エディタの設定
call s:source_rc("editor.rc.vim")

" カラースキーマ
" "call s:source_rc("color.rc.vim")
colorscheme ThemerVim


" ==== set dein.vim ================================================
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/plugins/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/plugins/dein_lazy.toml', {'lazy': 1})

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax enable


" plugin用のrcファイル読み込み関数
function! s:source_plugins_rc(rc_file_name)
  let rc_file = expand(g:plugins_rc_dir . '/' . a:rc_file_name)
  if filereadable(rc_file)
    execute 'source' rc_file
  endif
endfunction

call s:source_plugins_rc("dein.rc.vim")
call s:source_plugins_rc("dein_lazy.rc.vim")

call s:source_plugins_rc("config/vim-lsp.rc.vim")

" ===================================================================
filetype plugin indent on
filetype plugin on
