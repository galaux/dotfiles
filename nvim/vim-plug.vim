call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'fabi1cazenave/suckless.vim'
Plug 'jamessan/vim-gnupg'

Plug 'Raimondi/delimitMate'
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
au FileType clojure let g:delimitMate_expand_cr = 0
au FileType clojure let g:delimitMate_expand_space = 0
au FileType vim let b:delimitMate_smart_quotes = 0
let b:delimitMate_matchpairs = "(:),[:],{:},«:»"

"Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
"hi IndentGuidesOdd  ctermbg=0
"hi IndentGuidesEven ctermbg=8
"let g:indent_guides_guide_size = 4
"let g:indent_guides_start_level = 2

"Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_extensions = ['tag']
map <C-i> :CtrlPTag <CR>

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
let g:deoplete#enable_at_startup = 1

"Plug 'shougo/neocomplete.vim'
"let g:neocomplete#enable_at_startup = 1
"""let g:neocomplete#sources#syntax#min_keyword_length = 5
"let g:neocomplete#auto_completion_start_length = 6
""let g:neocomplete#manual_completion_start_length = 7
"""let g:neocomplete#min_keyword_length = 8
"" number of candidates displayed in a pop-up menu
"let g:neocomplete#max_list = 20
"let g:neocomplete#disable_auto_complete = 1
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Plug 'tpope/vim-fugitive'

Plug 'mileszs/ack.vim'
nnoremap <Leader>/ :Ack!<Space>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <F4> :NERDTreeToggle<CR>

Plug 'majutsushi/tagbar'
nmap <F7> :TagbarToggle<CR>

"Plug 'rust-lang/rust.vim'

Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces=
  \ '\(controllers\|events\|json|\kafka\|models\|modules\|security\|services\)'

Plug 'gre/play2vim', { 'for': 'scala' }

Plug 'ensime/ensime-vim', { 'for': 'scala,java' }
"au FileType scala nnoremap <localleader>ed :EnDeclaration<CR>
"au FileType scala nnoremap <localleader>edx :EnDeclarationSplit<CR>
"au FileType scala nnoremap <localleader>edv :EnDeclarationSplit v<CR>

Plug 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_error_symbol = '✗'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
set completeopt-=preview
nnoremap <Leader>c :SyntasticCheck<Enter>

" Required by vim-cljfmt and vim-eastwood
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Required by vim-fireplace to fint `lein repl` connection
Plug 'tpope/vim-salve', { 'for': 'clojure' }
" Code formatting, requires vim-fireplace
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
let g:clj_fmt_autosave = 0
nnoremap <Leader>= :Cljfmt<Enter>

" Namespace generation, requires vim-fireplace
Plug 'guns/vim-slamhound', { 'for': 'clojure' }
"nnoremap <LocalLeader>n :Slamhound<CR>

" Clojure lint tool, requires syntastic and vim-fireplace
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }

" Add plugins to &runtimepath
call plug#end()
