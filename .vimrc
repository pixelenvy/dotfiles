" ## Auto load vim plug
" -----------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ## vim-plug plugins
" -----------------------------------------------------------------------
call plug#begin('~/.vim/extensions')

" Git
Plug 'tpope/vim-sensible'
Plug 'townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jszakmeister/vim-togglecursor'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdcommenter'
Plug 'iagofumo/vim-nerdtree-syntax-highlight'
Plug 'TaDaa/vimade'

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Syntax Highlighting
Plug 'digitaltoad/vim-pug'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'

" Dev Icons (always last)
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ## General Settings
" -----------------------------------------------------------------------
set tabstop=2
set expandtab
set number relativenumber
set numberwidth=4
set shiftwidth=2
set nowrap
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey

" ## WildMenu
" -----------------------------------------------------------------------
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" ## NERDTree config
" -----------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIgnore = ['^node_modules$', '^dist$', '.DS_Store', '\.swp$', '^public$']

" Open NERDtree automatically if vim started without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle NERDTree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Ale Linting
" -----------------------------------------------------------------------
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'ﮊ'
let g:ale_sign_warning = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Rename variable
" -----------------------------------------------------------------------
" local
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" global
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
