:let mapleader = " "
colo zellner
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
"Plug 'scalameta/coc-metals', {'do':'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch':'release'}
call plug#end()

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction


au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+
"Plug 'Valloric/YouCompleteMe', {'do':'./install.py --all --clangd-completer'}
"Plug 'vim-utils/vim-alt-mappings'
"Plug '/usr/bin/fzf'
"Plug '/usr/share/fzf'
"Plug 'junegunn/fzf'
"set rtp+=/usr/share/fzf
"set rtp+=/usr/bin/fzf
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
filetype plugin on " for nerd commenter 
"autocmd vimenter * NERDTree
":let g:NERDTreeHijackNetrw=0
set laststatus=2 "needed for lightline
let g:lightline = {
	\ 'colorscheme': 'jellybeans'
	\ }	
"inoremap {<CR> {<CR>}<Esc>ko<BS><BS><BS><BS>
" needed for youcompleteme
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set expandtab
"execute pathogen#infect()
	"syntax on
	"filetype plugin indent on
syntax on
" filetype plugin indent on
" " show existing tab with 4 spaces width
" " On pressing tab, insert 4 spaces
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>
" " Enable line numbering
set nu
" 
" " Show cursor position
set ruler
" 
" " Show incomplete commands
set showcmd
" 
" 
set wildmenu
" 
"
set incsearch
" 
" " Ignore case when searching
set ignorecase
set smartcase
" 
" " Don't line wrap midword
set lbr
" 
" " Auto indent/Smart indent
set ai
set si
" 
" set bg=dark
" 
" " Color scheme (~/.vim/color)

" \ is leader by default 
":let mapleader = "]"
" quit current buffer without closing window (needed for nerdtree)
"nnoremap <leader>q :bp<cr>:bd #<cr>
"nnoremap ]q :bp<cr>:bd #<cr>
" moving between windows and resizing
"map <A-w> :w<CR>
"map <A-h> <C-w>h
"map <A-j> <C-w>j
"map <A-k> <C-w>k
"map <A-l> <C-w>l
"map <A-<> <C-w><
"map <A->> <C-w>>
"map <A-=> <C-w>+
"map <A--> <C-w>-
"map <A-1> :NERDTreeToggle<CR>


map <leader>w :w<CR>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <leader>, <C-w><
map <leader>. <C-w>>
map <leader>= <C-w>+
map <leader>- <C-w>-
map <leader>1 :NERDTreeToggle<CR>
map <leader>w :bp<cr>:bd #<cr>
map <leader>s :w<CR>
map <leader>n :bn<CR>
map <leader>p :bp<CR>
" 
" " Edit multiple files without saving
set hidden
" 
set splitright
set splitbelow
map <ESC>1 :NERDTreeToggle<CR>








" ~/.vimrc
" Configuration for coc.nvim

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <spae>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>c
