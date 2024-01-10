" GUI options:
set lines=50 columns=100	" Initial size (Maximizes window with stacking WMs)
set guifont=Lucida_Console:h10	" Select font/fontsize
set guioptions-=T				" Remove toolbar

"colorscheme evening			" Use this colorscheme if no packages are available

" Onedark colorscheme (vim8 package) with lightline package
let g:lightline = {
   \ 'colorscheme': 'one',
   \ }
packadd! onedark.vim
colorscheme onedark

" gvim resets these so we have to repeat them.
set visualbell
set t_vb=

" Use backspace in insert mode
set backspace=indent,eol,start

" Standard 'muscle memory' shortcuts
" Save (n)
nmap <C-s> :w<CR>
" Save (i)
imap <C-s> <C-O>:w<CR>	
" Copy selected (v)
vnoremap <C-c> "+y		
" Paste (n)
nnoremap <C-v> "+p		
" Paste (i)
inoremap <C-v> <C-o>"+p	
" Paste to selection (v)
vnoremap <C-v> "+p		
" Select all (n)
nnoremap <C-a> ggVG		

" Move to file's parent directory.
cd %:p:h
