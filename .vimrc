set number
set background=dark

syntax on
filetype plugin indent on

set autoindent
set wrap
set completeopt=menuone,noinsert,noselect
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set foldmethod=syntax
set foldlevelstart=99
set hlsearch
set mouse+=a
set nocompatible

command Prev echo "last command exit status: " . v:shell_error

set shortmess +=I
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch

set visualbell
set termguicolors

syntax enable

let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='kalisi'
let g:user_emmet_expandabbr_keys = '<Tab>'
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1

let g:ale_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_cursor = 1

" Enable specific linters
let g:ale_linters = {
\   'c': ['gcc', 'clang'],
\   'python': ['flake8', 'pylint'],
\   'html': ['htmlhint'],
\   'css': ['stylelint'],
\}

" Enable specific fixers
let g:ale_fixers = {
\   'c': ['clang-format'],
\   'python': ['black', 'autopep8'],
\}

" Automatically fix on save
let g:ale_fix_on_save = 1

let g:workspace_autosave_always = 1

if has('termguicolors')
  set termguicolors
endif

nnoremap <Left>  :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up>    :echo "Use k"<CR>
nnoremap <Down>  :echo "Use j"<CR>
nnoremap <C-N>   :NERDTreeToggle

inoremap <Left>  <C-o>:echo "Use h"<CR>
inoremap <Right> <C-o>:echo "Use l"<CR>
inoremap <Up>    <C-o>:echo "Use k"<CR>
inoremap <Down>  <C-o>:echo "Use j"<CR>

autocmd BufRead,BufNewFile * if getline(1) =~ '^#!.*\(bash\|sh\)' | set filetype=sh | endif

 " Required for vim-workspace(autosave)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'haishanh/night-owl.vim'
Plug 'thaerkh/vim-workspace'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/everforest'
call plug#end()

" colorscheme gruvbox-material
colorscheme everforest
