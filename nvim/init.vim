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
autocmd BufReadCmd *.pkg.tar.xz let g:tar_cmd = "/usr/bin/bsdtar"

autocmd BufNewFile,BufRead *.edn setlocal filetype=clojure
autocmd BufNewFile,BufRead *.sbt setlocal filetype=scala

autocmd FileType go setlocal noexpandtab tabstop=2 listchars+=tab:\ \ 
autocmd FileType json setlocal equalprg=python\ -m\ json.tool
autocmd FileType markdown setlocal wrap
autocmd FileType python setlocal noexpandtab

set mouse-=a " Works nicely with urxvt-vim-insert and urxvt-vtwheel
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
      \ --exclude=node_modules
      \ --exclude=public
      \ --exclude=target
      \ --exclude=vendor

" Highlight word under cursor without jumping to next occurrence
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"let g:clojure_align_multiline_strings = 1

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" https://github.com/neovim/neovim/issues/2048
nnoremap <silent>    <M-BS>  :6 wincmd ><CR>

" Enable fenced code block syntax highlighting in markdown documents
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let g:netrw_liststyle=3 " tree style listing

" Move among windows
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

" Move among tabs
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>

nnoremap <silent> <A-1> :tabnext 1<CR>
nnoremap <silent> <A-2> :tabnext 2<CR>
nnoremap <silent> <A-2> :tabnext 2<CR>
nnoremap <silent> <A-3> :tabnext 3<CR>
nnoremap <silent> <A-4> :tabnext 4<CR>
nnoremap <silent> <A-5> :tabnext 5<CR>
nnoremap <silent> <A-6> :tabnext 6<CR>
nnoremap <silent> <A-8> :tabnext 8<CR>
nnoremap <silent> <A-9> :tablast<CR>

" Resize windows
nnoremap <silent> <C-A-h> :vertical resize -5<CR>
nnoremap <silent> <C-A-j> :resize -5<CR>
nnoremap <silent> <C-A-k> :resize +5<CR>
nnoremap <silent> <C-A-l> :vertical resize +5<CR>

nnoremap <silent> <A-=> :wincmd =<CR>

" nnoremap <silent> <C-S-h> :tabmove -1<CR>
" nnoremap <silent> <C-S-l> :tabmove +1<CR>

" Move windows
nnoremap <silent> <A-H> :wincmd H<CR>
nnoremap <silent> <A-J> :wincmd J<CR>
nnoremap <silent> <A-K> :wincmd K<CR>
nnoremap <silent> <A-L> :wincmd L<CR>

