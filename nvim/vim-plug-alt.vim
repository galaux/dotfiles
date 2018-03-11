call plug#begin('~/.vim/plugged-alt')

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

"Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_extensions = ['tag']
map <C-i> :CtrlPTag <CR>
map <C-b> :CtrlPBuffer <CR>

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'tpope/vim-speeddating'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<Enter>

" GitHub integration
" Plug 'tpope/vim-rhubarb'

Plug 'mileszs/ack.vim'
nnoremap <Leader>/ :Ack!<Space>
let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <F4> :NERDTreeToggle<CR>

Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
nmap <F7> :TagbarToggle<CR>

Plug 'gurpreetatwal/vim-avro'

Plug 'nelstrom/vim-markdown-folding'

call plug#end()
