packloadall | silent! helptags ALL
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


" emmet
let g:user_emmet_expandabbr_keys = '<Tab>'

" auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup

" let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_cursor = 1

 " instant markdown options
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1
let g:instant_markdown_theme = 'dark'

" Enable specific linters
let g:ale_linters = {
\   'c': ['gcc', 'clang'],
\   'python': ['flake8', 'pylint'],
\   'html': ['htmlhint'],
\   'css': ['stylelint'],
\   'javascript': ['eslint'],
\}

" Enable specific fixers
let g:ale_fixers = {
\   'c': ['clang-format'],
\   'python': ['black', 'autopep8'],
\   'javascript': ['prettier'],
\}


let g:workspace_autosave_always = 1
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

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

let ayucolor="dark"

call plug#begin('~/.vim/plugged')
Plug 'tribela/vim-transparent'
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
Plug 'thaerkh/vim-workspace'
Plug 'christoomey/vim-system-copy'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_theme = 'zenburn'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail' " unique_tail, 'filename'

colorscheme gruvbox-material

highlight Normal guibg=NONE
highlight Normal ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight FoldColumn guibg=NONE ctermbg=NONE
