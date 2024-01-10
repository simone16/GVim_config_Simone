" Indentation vim file for asmC64 (xa65 dialect)
" Author: Simone Pilon <wertyseek@gmail.com>

if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal shiftwidth=32
setlocal tabstop=32
setlocal noexpandtab
setlocal nolisp
setlocal autoindent
setlocal indentexpr=GetAsmC64Indent(v:lnum)

" Reindent after writing a label
" This fucks up if you just need a colon, but the assembler does not
" like them either, so...
inoremap <buffer> : :<c-r>=IsNewLine('<tab>','')<cr>
inoremap <buffer> --- <c-r>=repeat('-', 101-col('$'))<cr>

" Checks whether we are writing at the end of a newline
" or inside an oldline.
" Returns either input based on this.
function! IsNewLine(true, false)
	if col('.') == col('$')
		return a:true
	else
		return a:false
	endif
endfunction

function! GetAsmC64Indent(lin_num)
	
	let line_tokens=split(getline(a:lin_num))

	" Empty line
	if len(line_tokens) == 0
		if a:line_num == 1
			return 0
		else
			return GetAsmC64Indent(a:line_num-1)
		endif
	endif

	" Line starts with a comment
	if line_tokens[0] =~? ';.*'
		return 0
	endif

	" Line starts with a preprocessor directive
	if line_tokens[0] =~? '#\w\+'
		return 0
	endif

	" Line starts with program counter assignment
	if line_tokens[0][0] == "*"
		return 0
	endif

	" Line starts with a pseudo-op
	if line_tokens[0] =~? '\.\w\+'
		return shiftwidth
	endif

	" Line starts with an op-code mnemonic
	if line_tokens[0] =~? 'adc\|and\|asl\|bit\|brk\|clc\|cld\|cli\|clv\|cmp\|cpx\|cpy\|dec\|dex\|dey\|eor\|inc\|inx\|iny\|lda\|ldx\|ldy\|lsr\|nop\|ora\|pha\|php\|pla\|plp\|rol\|ror\|rti\|rts\|sbc\|sec\|sed\|sei\|sta\|stx\|sty\|tax\|tay\|tsx\|txa\|txs\|tya\|jmp\|jsr\|bcc\|bcs\|beq\|bmi\|bne\|bpl\|bvc\|bvs'
		return &shiftwidth
	endif

	" Line starts with a label
	if line_tokens[0] =~? '\h\w*:\?'
		return 0
	endif

	" Unrecognized line
	return -1
endfunction
