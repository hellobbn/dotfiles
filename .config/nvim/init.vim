" Gotta be first
set nocompatible

" ---------- General rules ----------
set ruler
set number
set cursorline
set cursorcolumn
set showcmd
set incsearch
set hlsearch

" Per-directory .vimrc files
set exrc
set secure

syntax on

set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
highlight Cursor guifg=white guibg=black ctermfg=255 ctermbg=232
set guicursor=n-v-c-sm:hor25,i-ci-ve:hor25,c-cr-o:hor25

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set list
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

if has('gui_running')
  set guifont=Input\ Mono\ Medium\ 12
endif

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" map tab
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" ---------- Vim Plug ----------
call plug#begin('~/.vim/plugged')

" dracula color theme
Plug 'dracula/vim'

" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERD Tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" deoplete clang
Plug 'zchee/deoplete-clang'

" fzf
Plug 'junegunn/fzf.vim'

" Pandoc VIM
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" vim-clang-format
Plug 'rhysd/vim-clang-format'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" verilog
Plug 'vhda/verilog_systemverilog.vim'

" echodoc
Plug 'Shougo/echodoc.vim' 

" show code mark
Plug 'kshenoy/vim-signature'

" One theme
Plug 'rakr/vim-one'

" highlighting tool
Plug 'sheerun/vim-polyglot'
call plug#end()

" ---------- Plugin specific ----------

" -- color scheme
colorscheme one 
set background=light
" -- always show status bar
set laststatus=2

" -- airline
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enable=1
let g:airline_theme='one'

" -- NERD tree
" toggle NERD tree with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" -- indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <leader>i :IndentGuidesToggle

" -- deoplete
let g:deoplete#enable_at_startup=1

" -- vim clang format
let g:clang_format#code_style='llvm'

" -- LSP
set hidden

let g:LanguageClient_serverCommands = {
  \ 'c'   : ['clangd'],
  \ 'cpp' : ['clangd', '-background-index'],
  \ 'go'  : ['/home/bbn/go/bin/gopls'],
  \ 'python' : ['pyls']
  \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" -- echodoc
set cmdheight=2
let g:echodoc#enable_at_startup=1

" -- (not plugin) highlight bracket
hi MatchParen cterm=none ctermbg=green ctermfg=blue

" -- vim signature
let g:SignatureMarkTextHLDynamic=1 

" -- doxygen
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_colour=1
