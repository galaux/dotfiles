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
au BufReadCmd *.pkg.tar.xz let g:tar_cmd = "bsdtar"

set mouse-=a
set clipboard+=unnamedplus

let mapleader=","
imap jj <Esc>
cmap w! w !sudo tee % > /dev/null

map <F5> :!ctags -R --exclude=target --exclude=node_modules --exclude=public --exclude=assets
"nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
let maplocalleader=" "
nnoremap <localleader><space> :nohlsearch<CR>
" Highlight word under cursor without jumping to next occurrence
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"nnoremap <Leader>f :Ack!<Space>

"map <C-H> :execute "tabmove" tabpagenr() - 2<CR>
"map <C-L> :execute "tabmove" tabpagenr() + 1<CR>

"let g:clojure_align_multiline_strings = 1

au BufNewFile,BufRead *.edn set filetype=clojure
au BufNewFile,BufRead *.avsc set filetype=json

au FileType json setlocal equalprg=python\ -m\ json.tool

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" https://github.com/neovim/neovim/issues/2048
nnoremap <silent>    <M-BS>  :6 wincmd ><CR>
