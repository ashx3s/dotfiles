" Neovim Configuration

" ------ Plugin Management ------"
call plug#begin('~/.config/nvim/plugged')
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Debugger
Plug 'puremourning/vimspector'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" NerdTree
Plug 'scrooloose/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ggreer/the_silver_searcher'
"Nerd Commenter (use \ + cc to comment and \ + cu to uncomment)
Plug 'scrooloose/nerdcommenter'

" Indent guides
Plug 'thaerkh/vim-indentguides'

" Coc-neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" --- Language Support --- "
Plug 'jceb/vim-orgmode'
Plug 'sersorrel/vim-lilypond'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'APZelos/blamer.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jelera/vim-javascript-syntax'
Plug 'phpactor/phpactor'
" --- Linting --- "
Plug 'dense-analysis/ale'

" Distraction free writing
Plug 'junegunn/goyo.vim'

"Lens Autofocus
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

"--- Themes --- "
Plug 'dracula/vim'
Plug 'sainnhe/gruvbox-material'
Plug 'rakr/vim-one'
Plug 'ghifarit53/tokyonight-vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
"Icons
Plug 'ryanoasis/vim-devicons'

" Tmux integration
Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'tmux-plugins/vim-tmux'
"Plug 'edkolev/tmuxline.vim'
call plug#end()

" -----------------------SETTINGS"----------------------- "

syntax on
set smartindent				    " smartindent
set autoindent
set expandtab				    " converts tabs to spaces
set incsearch                   " incremental search
set number 				        " line numbers
set mouse=a				        " enables mouse
set pumheight=10			    " smaller popup menu
set smarttab
set tabstop=2			
set shiftwidth=2
set softtabstop=2
set showtabline=2       "always show tabs
set noshowmode          " remove showing current mode
set title
set cursorline
set background=dark
set showmatch           " Show matching brackets
set encoding=utf-8
set updatetime=300      "Faster Update time for errors
set cmdheight=2

" ------ Themes ------ "
colorscheme one
let g:airline_theme = 'onedark'
"colorscheme OceanicNextLight
"let g:airline_theme = "oceanicnextlightminimal"

if has ('autocmnd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" ------ Airline Configuration ------ "
" ALE Support
let g:airline#extensions#ale#enabled = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tablline#left_sep = ''
let g:airline#extensions#tablline#left_alt_sep = ''
let g:airline#extensions#tablline#right_sep = ''
let g:airline#extensions#tablline#right_alt_sep = ''
"
" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" set symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" ------ ALE Linting Configuration ------ "
" ALE work with coc.vim
let g:ale_disable_lsp = 1
" change ALE signs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"
" error navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" default height for error list
let g:ale_list_window_size = 5

"set when ALE runs
let g:ale_lint_on_enter = 0
"AutoFixing
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
\}

"Ale gutter open
let g:ale_sign_column_always = 1

" Ale Fix keybinding
nmap <leader>d <Plug>(ale_fix)

" -------------Git-Blamer------------- "
"let g:blamer_enabled = 1
let g:blamer_delay = 1000

" Use <C-L> to clear highlighting of search within a file
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Copy to clipboard
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR> 

"------ File Navigation ------"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automatically close nerdtree if its the only thing left open
autocmd bufenter " if (winnr("%") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" Toggle
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" ------ File Searching ------ "
"Toggle
nnoremap <C-p> :FZF<CR>
" Where to open file
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \}

" ------ Pane Movement ------ "
" alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

set foldmethod=syntax
set foldnestmax=10
"set nofoldenable
set foldlevel=2


" ----- Lens ------ "
" Max height
let g:lens#height_resize_max = 50
" Min height
let g:lens#height_resize_min = 20
" Max width
let g:lens#width_resize_max = 50
" Min width
let g:lens#width_resize_min = 20

"Term gui colors
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
"Allow color schemes bright olors w/o forcing bold
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co= 16
endif

" ------ Terminal ------ "
" open newsplit panes to right and below
set splitright
set splitbelow

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>
"Close Terminal Mode
tnoremap <Esc> <C-\><C-n>:q!<CR>

" ------ YATS ------ "
let g:yats_host_keyword = 1

" ----- Background transparency ----- "
highlight Normal guibg=none
highlight Normal ctermbg=none

