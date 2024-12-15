" Basic C++ settings
autocmd FileType cpp setlocal cindent
autocmd FileType cpp setlocal cino=j1,(0,ws,Ws
set relativenumber

" Set runtime path to find the theme
set rtp+=~/.vim_runtime/my_plugins/vim-code-dark

" Syntax and color settings
syntax enable
syntax on
" forces syntax highlighting 
filetype plugin on
filetype indent on
colorscheme codedark
set background=dark
set smartcase

" Ensure proper terminal Color Support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Make the colors match VS Code more closely
let g:codedark_conservative = 0
let g:codedark_italics = 1
let g:codedark_transparent = 0

" Enhanced C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"
" MODIFYING C++ COLOR SCHEME
" =========================

" Variables in light blue
autocmd FileType cpp,c,hpp,h syntax match cppCustomVariable "\v<\h\w*>"
autocmd FileType cpp,c,hpp,h highlight cppCustomVariable guifg=#9CDCFE

" Type 'string' keyword in teal
autocmd FileType cpp,c,hpp,h syntax keyword cppString string
autocmd FileType cpp,c,hpp,h highlight cppString guifg=#4EC9B0 gui=none

" String literals in orange (modified for better override)
autocmd FileType cpp,c,hpp,h highlight String ctermfg=180 guifg=#CE9178
autocmd FileType cpp,c,hpp,h highlight cString ctermfg=180 guifg=#CE9178
" Force string patterns to use our color
autocmd FileType cpp,c,hpp,h syntax region String start=+"+ skip=+\\\\\|\\"+ end=+"+
autocmd FileType cpp,c,hpp,h syntax region String start=+'+ skip=+\\\\\|\\'+ end=+'+

" Make cin/cout white like VS Code
autocmd FileType cpp,c,hpp,h syntax keyword cppIO cin cout endl
autocmd FileType cpp,c,hpp,h highlight cppIO guifg=#D4D4D4

" Functions in yellow (VS Code style)
autocmd FileType cpp,c,hpp,h syntax match cppFunction "\v\w+\ze\s*\("
autocmd FileType cpp,c,hpp,h highlight cppFunction guifg=#DCDCAA

" Exceptions - don't highlight these as variables
autocmd FileType cpp,c,hpp,h syntax keyword cppStatement return if else while for break continue
autocmd FileType cpp,c,hpp,h syntax keyword cppType int float double char void string bool
autocmd FileType cpp,c,hpp,h syntax keyword cppStructure class struct enum namespace

" Ensure syntax is properly loaded
autocmd FileType cpp,c,hpp,h syntax sync fromstart
"
" =========================
" END OF C++ COLOR SCHEME UPDATES 


" ALE (Linter) settings
let g:ale_linters = {
    \ 'cpp': ['clang', 'gcc', 'cpplint'],
    \ }
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" Optional: Show errors in the status line
let g:airline_section_error = '%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'

" ========================
" GENERAL VIM SETTINGS

" set history to 1000
set history=1000
" Tab out of parentheses/brackets/quotes
inoremap <expr> <Tab> search('\%#[]>)}''"]', 'n') ? '<Right>' : '<Tab>'

"map KEYSTROKES
map <F2> iJohn Smith<CR>123 Main Street<CR>Anytown, NY<CR><ESC>
map <F1> i<Tab>int temp_func_name(){<CR>}<Esc>O
