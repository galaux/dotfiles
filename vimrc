source ~/.vim/vimrc.neobundle

" Auto-reload configuration files
autocmd! BufWritePost ~/vimrc         source $MYVIMRC
autocmd! BufWritePost ~/.vimrc        source $MYVIMRC
autocmd! BufWritePost ~/.vim/*.vimrc  source $MYVIMRC
autocmd! BufWritePost ~/.vim/*.vimrc  source $MYVIMRC

set nocompatible
set history=10000
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undodir
set undofile
set undolevels=1000   "maximum number of changes that can be undone
set undoreload=10000  "maximum number lines to save for undo on a buffer reload

" everytime we change window, check if file has been updated outside of vim
autocmd WinEnter * checktime

set splitbelow
set splitright

"set showmode            " display current mode below the status line
set laststatus=2        " always show the status line
set cursorline          " highlight current line
set number
set relativenumber

set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

set colorcolumn=80          " show nth column
set scrolloff=20            " always show some lines around current one

set nowrap                      " do not wrap long lines

set list                        " Show tabs, nbsp, trailing spaces, …
let &listchars=''
"set listchars+=eol:¶
set listchars+=nbsp:˽           " example: Non breakable space
set listchars+=tab:↹\           " example: 	Tabulation
set listchars+=trail:·          " example: trailing space 
set listchars+=precedes:…
set listchars+=extends:…

set showfulltag               " show match pattern on tag word completion (template for functions)

syntax enable
colorscheme agnostic
set background=dark

set wildmenu                  " enhanced mode command-line completion
set wildignore=**/target/*,**/node_modules/*,**/bower_components/*
set wildmode=longest,full
set wildignorecase            " ignore case when completing file names and directories

" Enable yanking from and to X
set clipboard=unnamedplus

"set nodigraph
set lazyredraw      " prevent screen from being redrawn while executing macros

let &showbreak = '↳ '         " string to put at the start of lines that have been wrapped
set fillchars+=vert:│         " change vertical split char
set fillchars+=fold:┄

au BufNewFile,BufRead *.md set filetype=markdown
au BufReadCmd *.pkg.tar.xz let g:tar_cmd = "bsdtar"   " Arch Linux packages opened with bsdtar
"au BufEnter *.scala setl formatprg=java\ -jar\ /opt/scalariform.jar\ --stdin\ --stdout

" Mappings
let mapleader=","
:imap jj <Esc>
cmap ww w !sudo  tee % > /dev/null
"map <F2> :set noautoindent!<CR>
set pastetoggle=<F2>
map <F5> :!ctags -R --exclude=target --exclude=node_modules --exclude=public --exclude=assets

" Clear search highlighting with Esc+Space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
:nnoremap <F6> :set wrap!<CR>
" Highlight word under cursor without jumping to next occurrence
:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

nnoremap <Leader>f :Ack!<Space>

" Enable Alt shortcuts
"let c='a'
"while c <= 'z'
"exec "set <A-".c.">=\e".c
"exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
"
"set timeout ttimeoutlen=50
"nnoremap <A-j> <C-W><C-j>
"nnoremap <A-k> <C-W><C-k>
"nnoremap <A-l> <C-W><C-l>
"nnoremap <A-h> <C-W><C-h>

" Enable italic
set t_ZH=[3m
set t_ZR=[23m

map <C-H> :execute "tabmove" tabpagenr() - 2 <CR>
map <C-L> :execute "tabmove" tabpagenr() + 1<CR>
