" ==== Language ==============================================================
" https://github.com/prabirshrestha/vim-lsp/wiki

" vim-lsp-settings
let g:lsp_settings_servers_dir = '~/.vim/vim-lsp-settings/servers'

" vim-ansible
let g:ansible_unindent_after_newline = 1

" plantuml-syntax
let g:plantuml_executable_script="~/.config/nvim/scripts/plantuml.sh"

" ===== Tool =================================================================
" vim-gitguitter
" git 差分を表示
let g:gitgutter_highlight_lines = 1
set updatetime=300

" open-browser.vim
let g:openbrowser_browser_commands = [
      \ {"name": "firefox-developer-edition", 
      \  "args": ["{browser}", "{uri}"]} 
      \ ]

" previm
let g:previm_open_cmd = "firefox-developer-edition"
