call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-unimpaired'

Plug 'mkitt/tabline.vim'

" Plug 'pmalek/toogle-maximize.vim'
" map <silent> <A-f> :call ToggleMaximizeCurrentWindow()<CR>

Plug 'szw/vim-maximizer'
let g:maximizer_set_default_mapping = 1
let g:maximizer_default_mapping_key = '<A-f>'

Plug 'jamessan/vim-gnupg'

Plug 'vim-scripts/deb.vim'

" Provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
autocmd FileType clojure let b:delimitMate_expand_cr = 0
autocmd FileType clojure let b:delimitMate_expand_space = 0
let delimitMate_matchpairs = "(:),[:],{:},<:>,«:»"
let delimitMate_nesting_quotes = ['"',"\'",'`']
autocmd FileType markdown let b:delimitMate_quotes = " _ \" ' `"

" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
" hi IndentGuidesOdd  ctermbg=0
" hi IndentGuidesEven ctermbg=8
" let g:indent_guides_guide_size = 8
" let g:indent_guides_start_level = 2

"TODO check Shougo/unite.vim again it looks awesome
"Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_extensions = ['tag']
map <C-i> :CtrlPTag <CR>
map <C-b> :CtrlPBuffer <CR>

" Asynchronous word completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'tpope/vim-speeddating'

" Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<Enter>

Plug 'mileszs/ack.vim'
nnoremap <Leader>/ :Ack!<Space>
nnoremap <Leader>? :Ack<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <F4> :NERDTreeToggle<CR>

Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
nmap <F7> :TagbarToggle<CR>

Plug 'gurpreetatwal/vim-avro'

"Plug 'rust-lang/rust.vim'

Plug 'nelstrom/vim-markdown-folding'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" let g:airline_powerline_fonts = 0

" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''


" TODO see about these Scala/Clojure plugins
"Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"let g:scala_sort_across_groups=1
"let g:scala_first_party_namespaces=
"  \ '\(controllers\|events\|json|\kafka\|models\|modules\|security\|services\)'
"
"Plug 'gre/play2vim', { 'for': 'scala' }
"
""Plug 'ensime/ensime-vim', { 'for': 'scala,java' }
"Plug 'ensime/ensime-vim', { 'for': 'scala' }
""au FileType scala nnoremap <localleader>ed :EnDeclaration<CR>
""au FileType scala nnoremap <localleader>edx :EnDeclarationSplit<CR>
""au FileType scala nnoremap <localleader>edv :EnDeclarationSplit v<CR>
"
""Plug 'scrooloose/syntastic'
"""set statusline+=%#warningmsg#
"""set statusline+=%{SyntasticStatuslineFlag()}
"""set statusline+=%*
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 0
""let g:syntastic_check_on_wq = 0
""let g:syntastic_warning_symbol = '⚠'
""let g:syntastic_error_symbol = '✗'
""let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
""set completeopt-=preview
""nnoremap <Leader>c :SyntasticCheck<Enter>
"
""" Required by vim-cljfmt and vim-eastwood
""Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
""" Required by vim-fireplace to fint `lein repl` connection
""Plug 'tpope/vim-salve', { 'for': 'clojure' }
""" Code formatting, requires vim-fireplace
""Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
""let g:clj_fmt_autosave = 0
""nnoremap <Leader>= :Cljfmt<Enter>
"
"Plug 'tpope/vim-salve', { 'for': 'clojure' } | Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"" Code formatting, requires vim-fireplace
"
"" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
"" let g:clj_fmt_autosave = 0
"" nnoremap <Leader>= :Cljfmt<Enter>
"
"" Namespace generation, requires vim-fireplace
"Plug 'guns/vim-slamhound', { 'for': 'clojure' }
""nnoremap <LocalLeader>n :Slamhound<CR>
"
"" Plug 'clojure-vim/acid.nvim'
"
"" Clojure lint tool, requires syntastic and vim-fireplace
""Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
"
"" Plug 'neovim/node-host' | Plug 'clojure-vim/nvim-parinfer.js', { 'for': 'clojure' }
"" let g:parinfer_preview_cursor_scope = 1
"" nnoremap <Leader>,o :ParinferOff<Enter>
"" nnoremap <Leader>,t :ParinferToggle<Enter>


call plug#end()
