" Add legend to ruler:
set rulerformat=%30(col,lin=(%c%V,%l)\ %p%%%)

" This is for lightline package, makes the status line 2 lines.
set laststatus=2

" Disable alarms:
set visualbell " No beep sound
set t_vb=		" Visualbell does nothing

" Tab appearence
set shiftwidth=3	" Indentation used by autoindent, >>, <<, = in spaces
set tabstop=3		" Apparent width of tab in spaces
set noexpandtab	" Keep as many \t ass possible in indentation

" Browse tabs:
nnoremap < :tabN<CR>
nnoremap > :tabn<CR>

" Open path. (o = open), first select the path in visual mode.
vnoremap <leader>o "ay<CR>:execute "!xdg-open ./".@a."&"<CR>
" Insert current date (t = today)
nnoremap <leader>t "=strftime("%d/%m/%y")<CR>p
" Enter starts a newline
nnoremap <CR> o

" Filetype plugin:
filetype plugin on
filetype indent on
syntax on		" Syntax highlighting

" Enable pathogen plugin manager:
" execute pathogen#infect()
