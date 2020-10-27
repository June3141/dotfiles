" NERDTree
let NERDTreeShowHidden = 1

" NerdTree の自動起動
function s:MoveToFileAtStart()
  call feedkeys("\<Space>")
  call feedkeys("\s")
  call feedkeys("\l")
endfunction

autocmd VimEnter *  NERDTree | call s:MoveToFileAtStart()

" nerdtree-git-plugin
" you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusUseNerdFonts = 1 

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

