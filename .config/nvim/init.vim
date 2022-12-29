call plug#begin("~/.vim/plugged")

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-system-copy'
Plug 'airblade/vim-gitgutter'
Plug 'udalov/kotlin-vim'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'joshdick/onedark.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'jvirtanen/vim-hcl'
Plug 'phanviet/vim-monokai-pro'
Plug 'doums/darcula'
Plug 'itchyny/lightline.vim'
Plug 'MrcJkb/haskell-tools.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'github/copilot.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start: General VIM Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set relativenumber

set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=n
set wildmenu
set colorcolumn=120

" Indentation
set autoindent
set cindent
set smartindent

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

let mapleader = ","

vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>Y "+y

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End: General VIM Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start: Airline configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make airline to appear on all the tabs
"set laststatus=2

"let g:airline_theme='draculaOriginal'

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#format = 1
"let g:airline#extensions#branch#displayed_head_limit = 13
let g:lightline = { 'colorscheme': 'darculaOriginal' }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End: Airline configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start: Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (has("termguicolors"))
	set termguicolors
endif

syntax enable
colorscheme darcula

" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

map <leader>l :NERDTreeToggle<CR>

" Terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End: Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start: FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

set rtp+=/opt/homebrew/opt/fzf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End: FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start: COC IntelliSense
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End: COC IntelliSense
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start: Prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-f> :PrettierAsync<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End: Prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start: Vim Viki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_list = [{'path': '~/Documents/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap linebreak nolist
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End: Vim Viki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start: Vim-Tex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor = 'latex'
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End: Vim-Tex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
