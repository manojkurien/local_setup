syntax on
set relativenumber
set hlsearch 
" Custom remaps
nnoremap <Leader>s :SemanticHighlightToggle<cr>

" Enable Semantic highlighting
" Colours generated here: https://medialab.github.io/iwanthue
let s:semanticGUIColors = ['#e9b198', '#d7d09e', '#b1d8a0', '#90c6ae', '#b3edd5', '#6fd5c9', '#78d8e4', '#90c6ed', '#b2b6ec', '#e6afd3']

" Dracula theme
if v:version < 802
    packadd! dracula
endif
colorscheme dracula
