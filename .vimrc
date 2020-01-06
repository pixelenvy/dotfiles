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
Plug 'tpope/vim-sensible' " Sensible Vim Defaults
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim' " Base file handling
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch' " UNIX commands in vim
Plug 'tpope/vim-surround' " Auto surround in insert mode
Plug 'w0rp/ale' " Linting
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jszakmeister/vim-togglecursor' " Change cursor based on mode
Plug 'qpkorr/vim-bufkill' " Kill a buffer without killing it's window/pane
Plug 'scrooloose/nerdcommenter' " Quick Commenting
Plug 'TaDaa/vimade' " Fade inactive panes
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'craigemery/vim-autotag' " Auto-update tags file on save
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file lookup
Plug 'townk/vim-autoclose' " Auto close pairs ( {}, '', etc )
Plug 'tpope/vim-fugitive' " Git Wrapper

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
set autoread
set tabstop=2
set expandtab
set number
set numberwidth=4
set shiftwidth=2
set nowrap
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey
set cursorline

" ## WildMenu
" -----------------------------------------------------------------------
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" CtrlP
" -----------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage\|dist'

" ## NERDTree config
" -----------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIgnore = ['^node_modules$', '^dist$', '.DS_Store', '\.swp$', '^public$', '.nyc_output', '.git']
let NERDTreeShowHidden=1

" Open NERDtree automatically if vim started without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle NERDTree with ctrl-n
nmap <F1> :NERDTreeToggle<CR>

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
\   'javascript': ['prettier'],
\   'css': ['prettier']
\}
let g:ale_pattern_options = {
\   '\.module\.css$': { 'ale_linters': [], 'ale_fixers': ['prettier'] }
\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'ﮊ'
let g:ale_sign_warning = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Autocompletion
" -----------------------------------------------------------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Rename variable
" -----------------------------------------------------------------------
" local
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" global
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Vimade
" -----------------------------------------------------------------------
let g:vimade = {
\   'basebg': '#000000',
\   'fadelevel': '0.6'
\}

let g:dracula_italic = 0
color dracula

" CtrlP
" -----------------------------------------------------------------------
let g:ctrlp_switch_buffer = 'et'
