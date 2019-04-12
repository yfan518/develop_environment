" the following line sets tabs to 4 spaces.
set tabstop=4
"set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab
" the following line says to vim to highlight the searched words.
set hlsearch
" make searches case insensitive
set ignorecase
" the following line says to vim to execute incremental search.
set incsearch
" the following line adds line number to the text.
set number
set cindent
set autoindent
set smartindent
" show the editing mode on the last line
set showmode

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set textwidth=0		" no wrap line automatically
set wrapmargin=0	" no wrap
"set wrap
set formatoptions=l

" the following line activates the syntax highlighting.
syntax on

" maxsize and minsize current windows horizontally
nmap - <C-W><C-_>
nmap _ <C-W>=

" change window easily
nmap , <C-W><C-W>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" move fastter
nmap J 5j
nmap K 5k

" tabpage
nmap H :tabp<CR>
nmap L :tabn<CR>

" color
" colo mydarkblue

" keep N lines visible below the cursor
set scrolloff=3

" ctags | cscope
set tags=tags;
setglobal complete-=i
nmap <F11> :!update_ctags<CR><CR>
map <F12> <C-]>

nmap <space> :
nmap <F3> :Grep<CR>

cmap qo only

" filetype plugin indent on
" set completeopt=longest,menu

" jump to the position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	      \| exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""map command (plugin: a.vim)""""""""""""""""""""""""""
let g:alternateRelativeFiles=1
:cabbrev av <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'AV' : 'av')<CR>
:cabbrev as <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'AS' : 'as')<CR>
:cabbrev a <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'A' : 'a')<CR>
:cabbrev at <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'AT' : 'at')<CR>

" 状态栏
set laststatus=2      " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
         return curdir
endfunction

set statusline=[%n]\%f%m%r%h\ \|\pwd:\ %{CurDir()}\ \|%=\%l,\%c\ %p%%\%{((&fenc==\"\")?\"\":\"\ \|\\".&fenc)}\|\ascii=%b,hex=%b\|

""""""""""""""""""""""""""""""""""make cur file""""""""""""""""""""""""""""""""""""""
" nmap <F8> : wa<CR> call DLVI_mkCurFile()<CR> <CR> cw<CR>

noremap <F7> :NERDTreeToggle<CR>
noremap <silent> <leader>d :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""dlvi""""""""""""""""
let g:DLVI_Auther = 'DL'
let g:DLVI_Mail = 'donglei_program@126.com'

" I HATE VIMSCRIPT
if has('python')
	" noremap c :py DLVI_InsertComment()<CR>
	" noremap i :py DLVI_ImplementMethod()<CR>
	" noremap m :py DLVI_GetMyReadmine()<CR>
	" vmap y "+y :py DLVI_ClipBoard_VMode()<CR>	
	" nmap y "+ye :py DLVI_ClipBoard_NMode()<CR>
	" vmap = :py DLVI_Vertical_Align('<','>',' ', '//', '=')<CR>
elseif has('python3')
	"" noremap c :py3 DLVI_InsertComment()<CR>
	"" noremap i :py3 DLVI_ImplementMethod()<CR>
	"" noremap m :py3 DLVI_GetMyReadmine()<CR>
	"" vmap y "+y :py3 DLVI_ClipBoard_VMode()<CR>	
	"" nmap y "+ye :py3 DLVI_ClipBoard_NMode()<CR>
	"" vmap = :py3 DLVI_Vertical_Align('<','>',' ', '//', '=')<CR>
endif
"""""""""""""""""""""""""""""""""""

