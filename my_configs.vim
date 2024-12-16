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

"Open terminal below and set height to 15
set splitbelow
set termwinsize=15x0
"map KEYSTROKES
map <F2> iJohn Smith<CR>123 Main Street<CR>Anytown, NY<CR><ESC>
map <F1> i<Tab>int temp_func_name(){<CR>}<Esc>O

" Running prettier
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier']
\}
" fix files on save with prettier
let g:ale_fix_on_save = 1

" Turn off all folding
augroup NoFolding
    autocmd!
    autocmd BufRead * setlocal nofoldenable
    autocmd BufNewFile * setlocal nofoldenable
    autocmd BufWrite * setlocal nofoldenable
augroup END

" Disable folding completely
set nofoldenable
set foldmethod=manual
set foldlevelstart=99
let g:markdown_folding = 0
let g:fastfold_savehook = 0
let g:xml_syntax_folding = 0
let g:javaScript_fold = 0
let g:sh_fold_enabled = 0
let g:ruby_fold = 0
let g:perl_fold = 0
let g:perl_fold_blocks = 0
let g:r_syntax_folding = 0
let g:rust_fold = 0
let g:php_folding = 0

let g:ale_fixers = {
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\   'h': ['clang-format'],
\   'hpp': ['clang-format']
\}

" More reliable file type detection and formatting
augroup CLangFormatting
    autocmd!
    autocmd BufNewFile,BufRead *.cpp,*.h,*.hpp,*.c let b:ale_fix_on_save = 1
augroup END

" Make sure clang-format is properly configured
let g:ale_cpp_clangformat_executable = 'clang-format'
let g:ale_cpp_clangformat_options = ''

" Optional debugging
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Compile and run your cpp code
autocmd FileType cpp map <F9> :w <CR>:terminal<CR>g++ main.cpp -o main<CR>main<CR> 

autocmd BufEnter *.tsx,*.jsx set filetype=typescriptreact
autocmd BufEnter *.ts set filetype=typescript
autocmd BufEnter *.js set filetype=javascript

" COC Settings for text
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> (Enter) auto-select the first completion item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" JAVASCRIPT SYNTAX HIGHLIGHTING 
" ################################################################################################
augroup JavaScriptJSXHighlight
    autocmd!
    
    " JSX Component Tags - Teal Green
    autocmd FileType javascript,javascriptreact syntax match jsxComponent /\v<\/?\zs[A-Z][a-zA-Z0-9]*\ze/ contained
    autocmd FileType javascript,javascriptreact highlight jsxComponent guifg=#4EC9B0

    " Styled Component Declaration - Light Blue for 'const' declarations
    autocmd FileType javascript,javascriptreact syntax match styledDecl /\vstyled\.\zs[a-z]+/
    autocmd FileType javascript,javascriptreact highlight styledDecl guifg=#9CDCFE

    " Keywords - Pinkish Purple
    autocmd FileType javascript,javascriptreact syntax keyword jsKeyword import const export default return
    autocmd FileType javascript,javascriptreact highlight jsKeyword guifg=#C586C0

    " Template Literals - Light Orange
    autocmd FileType javascript,javascriptreact syntax region jsTemplate start=/`/ end=/`/ contains=jsTemplateExpr
    autocmd FileType javascript,javascriptreact syntax match jsTemplateExpr /\v\$\{[^}]*\}/ contained
    autocmd FileType javascript,javascriptreact highlight jsTemplateExpr guifg=#9CDCFE
    autocmd FileType javascript,javascriptreact highlight jsTemplate guifg=#CE9178

 " Highlight props/variables inside curly braces '{}' within JSX
    autocmd FileType javascript,javascriptreact syntax match jsxProp /\v\{\s*\w+(\.\w+)*\s*\}/
    autocmd FileType javascript,javascriptreact highlight jsxProp guifg=#D75F5F

   augroup END
" JavaScript/JSX/Styled Components Syntax Highlighting (VS Code colors)
" ############################## END-SYNTAX HIGHLIGHTING #########################################

" Setting PX to VW CONVERTER to match vs code js
" Testing if function loads
"echo "PX converter loaded!"
" #####

function! ConvertUnits(mode, visual)
    let breakpoints = {
        \ 'desktop': 1600,
        \ 'tablet': 1024,
        \ 'mobile': 480
    \ }
    
    let viewport = breakpoints[a:mode]

    " Function to format vw value without trailing zeros
    function! FormatVW(value)
        let formatted = printf("%.3f", a:value)
        let formatted = substitute(formatted, '\.000$', '', '')
        let formatted = substitute(formatted, '0\+$', '', '')
        let formatted = substitute(formatted, '\.$', '', '')
        return formatted . "vw"
    endfunction

    if a:visual
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
        
        let has_vw = 0
        for line_num in range(line_start, line_end)
            let line = getline(line_num)
            if line =~ '\d\+\.\d\+vw\|\d\+vw'
                let has_vw = 1
                break
            endif
        endfor
        
        for line_num in range(line_start, line_end)
            let line = getline(line_num)
            if has_vw
                let new_line = substitute(line, '\(\d\+\.\d\+\|\d\+\)vw', '\=printf("%dpx", float2nr(str2float(submatch(1)) * str2float(viewport) / 100.0))', 'g')
            else
                let new_line = substitute(line, '\(\d\+\.\d\+\|\d\+\)px', '\=FormatVW(str2float(submatch(1)) / str2float(viewport) * 100.0)', 'g')
            endif
            call setline(line_num, new_line)
        endfor
    else
        let line = getline('.')
        let match = matchlist(line, '\(\d\+\.\d\+\|\d\+\)\(px\|vw\)')
        
        if !empty(match)
            let value = match[1]
            let unit = match[2]
            
            if unit ==# 'vw'
                let result = printf("%dpx", float2nr(str2float(value) * viewport / 100.0))
            else
                let result = FormatVW(str2float(value) / str2float(viewport) * 100.0)
            endif
            
            let new_line = substitute(line, '\(\d\+\.\d\+\|\d\+\)\(px\|vw\)', result, '')
            call setline('.', new_line)
        endif
    endif
endfunction

" Normal mode mappings
nnoremap ,d :call ConvertUnits('desktop', 0)<CR>
nnoremap ,t :call ConvertUnits('tablet', 0)<CR>
nnoremap ,m :call ConvertUnits('mobile', 0)<CR>

" Visual mode mappings
vnoremap ,d :call ConvertUnits('desktop', 1)<CR>
vnoremap ,t :call ConvertUnits('tablet', 1)<CR>
vnoremap ,m :call ConvertUnits('mobile', 1)<CR>
