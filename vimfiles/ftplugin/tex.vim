setlocal spell
setlocal spelllang=ench  " Latex documents use US English + chemistry spell-check by default.

" Compile with latexmk
nnoremap <buffer> <leader>r :cd %:p:h<CR>:!latexmk -pdf -shell-escape %;<CR>
" Clean auxiliary files (latexmk)
nnoremap <buffer> <leader>c :cd %:p:h<CR>:!latexmk -c %;rm -f *.run.xml *.bbl *.glo *-pics.pdf;<CR>

let g:Tex_Env_scheme = "\\begin{scheme}[<++>]\<CR>\\centering\<CR>\\replacecmpd{<++>}\<CR>\\includegraphics[scale=<++>]{<++>}\<CR>\\caption{<++>}\<CR>\\label{sch:<++>}\<CR>\\end{scheme}"

