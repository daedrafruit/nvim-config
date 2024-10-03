""""""""""
" OPTIONS
""""""""""

" relative numbers
set number
set relativenumber

" syntax highlighting
syntax on

" mouse support
set mouse=a

" true colors
set termguicolors

" use system clipboard
set clipboard=unnamedplus

" persistent undo
set undofile

" indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" auto write file when switching buffers or exiting
set autowrite

" auto read file if changed outside of nvim
set autoread

""""""""
" NETRW
""""""""

" disable banner
let g:netrw_banner = 0
" open in previous window
let g:netrw_browse_split = 4
" take up 25% of the window
let g:netrw_winsize = 25

" load netrw then set keymappings
autocmd VimEnter * call LoadNetrw()

function! LoadNetrw()
  silent! call netrw#CheckIfLoaded()  " load netrw
  " keymappings
  nnoremap <silent> <leader>n :let g:netrw_browse_split = 4<CR>:Vex<CR>
endfunction

""""""""""""""
" KEYMAPPINGS
""""""""""""""
let mapleader = " "

" change directory to current file's directory and print pwd
nnoremap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>cD :cd %:p:h:h<CR>:pwd<CR>

" Window management
nnoremap <silent> <leader>w <C-w>
nnoremap <silent> <leader>wv <C-w>v<C-w>w
nnoremap <silent> <leader>ws <C-w>s<C-w>w
nnoremap <silent> <leader>w, 5<C-w><
nnoremap <silent> <leader>w. 5<C-w>>

"""""""""""""""
" APPEARANCE
"""""""""""""""

" Visual mode highlight colors
highlight Visual cterm=NONE ctermbg=darkcyan ctermfg=black guibg=darkcyan guifg=black

" Line numbers color
highlight LineNr ctermfg=gray ctermbg=NONE guifg=gray guibg=NONE

" Current line number color
highlight CursorLineNr ctermfg=lightgray guifg=lightgray

" Statusline configuration
set statusline=
set statusline+=%l              " current line
set statusline+=/%L             " total lines
set statusline+=%=              " split in half (go to right side)
set statusline+=%f              " relative path
set statusline+=%m              " modified flag
set statusline+=%R              " read-only flag
