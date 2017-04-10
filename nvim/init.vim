source ~/.config/nvim/vim-plug.vim

set splitbelow
set splitright

" Highlight current line
set cursorline
set number
set relativenumber

set ignorecase

set expandtab
set shiftwidth=2

" Show nth column
set colorcolumn=80
" Always show some lines around current one
set scrolloff=20

" do not wrap long lines
set nowrap
nnoremap <F6> :set wrap!<CR>

" Show tabs, nbsp, trailing spaces, …
set list
let &listchars=''
"set listchars+=eol:¶
set listchars+=nbsp:˽           " example: Non breakable space
set listchars+=tab:↹\           " example:	Tabulation
set listchars+=trail:·          " example: trailing space 
set listchars+=precedes:…
set listchars+=extends:…

" Show match pattern on tag word completion (template for functions)
set showfulltag

syntax enable
colorscheme agnostic

" Enhanced mode command-line completion
set wildmenu
set wildignore=**/target/*,**/node_modules/*,**/bower_components/*
set wildmode=longest,full
" Ignore case when completing file names and directories
set wildignorecase

" Prevent screen from being redrawn while executing macros
set lazyredraw

" String to put at the start of lines that have been wrapped
let &showbreak = '↳ '
" Vertical split char
set fillchars+=vert:│
" Horizontal split when folded
set fillchars+=fold:┄

" Arch Linux packages opened with bsdtar
au BufReadCmd *.pkg.tar.xz let g:tar_cmd = "/usr/bin/bsdtar"

set mouse-=a
" y, d and p interact with the X CLIPBOARD rather than Vim's unnamed registers
set clipboard=unnamedplus

imap jj <Esc>
cmap w! w !sudo tee % > /dev/null

let mapleader=" "
"let maplocalleader=" "
nnoremap <leader><space> :nohlsearch<CR>
"nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader>fap =ap<Space>
nnoremap <Leader>fa( =a(<Space>
nnoremap <Leader>fa[ =a[<Space>
nnoremap <Leader>fa{ =a{<Space>

vnoremap <Leader>e :Eval<CR>
noremap <Leader>e :%Eval<CR>

map <F5> :!ctags -R
      \ --exclude=app/assets
      \ --exclude=public
      \ --exclude=target
      \ --exclude=vendor

" Highlight word under cursor without jumping to next occurrence
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"map <C-H> :execute "tabmove" tabpagenr() - 2<CR>
"map <C-L> :execute "tabmove" tabpagenr() + 1<CR>

"let g:clojure_align_multiline_strings = 1

au BufNewFile,BufRead *.edn set filetype=clojure
au BufNewFile,BufRead *.avsc set filetype=json
au BufNewFile,BufRead *.sbt set filetype=scala

au FileType json setlocal equalprg=python\ -m\ json.tool

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" https://github.com/neovim/neovim/issues/2048
nnoremap <silent>    <M-BS>  :6 wincmd ><CR>

" Enable fenced code block syntax highlighting in markdown documents
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']


nnoremap gz :!zeal "<cword>"&<CR><CR>

let g:netrw_liststyle=3 " tree style listing
