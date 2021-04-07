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
Plug 'tpope/vim-sensible'                             " Sensible Vim Defaults
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'                  " Base file handling
Plug 'itchyny/lightline.vim'                          " A light and configurable statusline/tabline
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-eunuch'                               " UNIX commands in vim
Plug 'tpope/vim-surround'                             " Auto surround in insert mode
Plug 'w0rp/ale'                                       " Linting
Plug 'jszakmeister/vim-togglecursor'                  " Change cursor based on mode
Plug 'qpkorr/vim-bufkill'                             " Kill a buffer without killing it's window/pane
Plug 'scrooloose/nerdcommenter'                       " Quick Commenting
Plug 'TaDaa/vimade'                                   " Fade inactive panes
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'ctrlpvim/ctrlp.vim'                             " Fuzzy file lookup
Plug 'townk/vim-autoclose'                            " Auto close pairs ( {}, '', etc )
Plug 'tpope/vim-fugitive'                             " Git Wrapper
Plug 'skywind3000/asyncrun.vim'                       " Async Runner
Plug '/usr/local/opt/fzf'                             " fzf (!install fzf with homebrew first)
Plug 'junegunn/fzf.vim'                               " Fzf wrapper
Plug 'easymotion/vim-easymotion'                      " Easy motion
Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'                              " Ctags in a handy sidebar
Plug 'sjl/vitality.vim'
Plug 'isRuslan/vim-es6'                               " ES6 Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Intelisense

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Syntax Highlighting
Plug 'pangloss/vim-javascript'
Plug 'findango/vim-mdx'
Plug 'digitaltoad/vim-pug'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

" Dev Icons (always last)
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ## General Settings
" -----------------------------------------------------------------------
let mapleader = ','
set autoread
set tabstop=2
set expandtab
set number
set numberwidth=4
set shiftwidth=2
set nowrap
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey
set cursorline

" ## Code Folding
" -----------------------------------------------------------------------
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" ## WildMenu
" -----------------------------------------------------------------------
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.lock
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*,.cache/*,.vscode/*,__snapshots__/*,.DS_Store/*,coverage/*

" CtrlP
" -----------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage\|dist'

" CTags
" -----------------------------------------------------------------------
nmap <F3> :TagbarToggle<CR>

" ## NERDTree config
" -----------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 50
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIgnore = ['^node_modules$', '^dist$', '.DS_Store', '\.swp$', '^public$', '.nyc_output', '.git', '.cache', '.idea', '.vscode', '\.lock$', '^coverage$']
let NERDTreeShowHidden=1

" Open NERDtree automatically if vim started without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle NERDTree with ctrl-n
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeFind<CR>

" Ale Linting
" -----------------------------------------------------------------------
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier']
\}
let g:ale_pattern_options = {
\   '\.[sp]*css$': { 'ale_linters': ['stylelint'], 'ale_fixers': ['prettier'] }
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
 
" Emmet
" -----------------------------------------------------------------------
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

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

" Coc
" https://github.com/neoclide/coc.nvim#example-vim-configuration
" -----------------------------------------------------------------------
let g:coc_global_extensions = [ 'coc-tsserver' ]

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \ },
        \ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Split Pane management
" -----------------------------------------------------------------------
"  nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
