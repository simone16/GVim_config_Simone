" Define mappings for quick compile and disk transfer
" Author: Simone Pilon <wertyseek@gmail.com>

" Compile
" Requires xa65 assembler
nnoremap <buffer> <localleader>c :execute "!xa -O PETSCII %:p -o %:p:r.prg -l %:p:r.lbl"<CR>
nnoremap <buffer> <localleader>ac :execute "!xa -O ASCII %:p -o %:p:r.prg -l %:p:r.lbl"<CR>
nnoremap <buffer> <localleader>pc :execute "!xa -O PETSCREEN %:p -o %:p:r.prg -l %:p:r.lbl"<CR>
" create a new virtual floppy drive and Write the .prg executable to it
" Requires VICE emulator
nnoremap <buffer> <localleader>w :execute "!c1541 -format %:t:r_disk,0 d64 %:p:r.d64 -attach %:p:r.d64 -write %:p:r.prg %:t:r"<CR>

" Build menu on gvim
menu Assembler.Compile_PETSCII<tab><localleader>c <localleader>c<CR>
menu Assembler.Compile_ASCII<tab><localleader>ac <localleader>ac<CR>
menu Assembler.Compile_PETSCREEN<tab><localleader>pc <localleader>pc<CR>

" Autocorrect case:
inoreab <buffer> adc ADC
inoreab <buffer> and <c-r>=IsComment('and','AND')<cr>
inoreab <buffer> asl ASL
inoreab <buffer> bit <c-r>=IsComment('bit','BIT')<cr>
inoreab <buffer> brk BRK
inoreab <buffer> clc CLC
inoreab <buffer> cld CLD
inoreab <buffer> cli CLI
inoreab <buffer> clv CLV
inoreab <buffer> cmp CMP
inoreab <buffer> cpx CPX
inoreab <buffer> cpy CPY
inoreab <buffer> dec DEC
inoreab <buffer> dex DEX
inoreab <buffer> dey DEY
inoreab <buffer> eor EOR
inoreab <buffer> inc INC
inoreab <buffer> inx INX
inoreab <buffer> iny INY
inoreab <buffer> lda LDA
inoreab <buffer> ldx LDX
inoreab <buffer> ldy LDY
inoreab <buffer> lsr LSR
inoreab <buffer> nop NOP
inoreab <buffer> ora ORA
inoreab <buffer> pha PHA
inoreab <buffer> php PHP
inoreab <buffer> pla PLA
inoreab <buffer> plp PLP
inoreab <buffer> rol ROL
inoreab <buffer> ror ROR
inoreab <buffer> rti RTI
inoreab <buffer> rts RTS
inoreab <buffer> sbc SBC
inoreab <buffer> sec SEC
inoreab <buffer> sed SED
inoreab <buffer> sei SEI
inoreab <buffer> sta STA
inoreab <buffer> stx STX
inoreab <buffer> sty STY
inoreab <buffer> tax TAX
inoreab <buffer> tay TAY
inoreab <buffer> tsx TSX
inoreab <buffer> txa TXA
inoreab <buffer> txs TXS
inoreab <buffer> tya TYA
inoreab <buffer> jmp JMP
inoreab <buffer> jsr JSR
inoreab <buffer> bcc BCC
inoreab <buffer> bcs BCS
inoreab <buffer> beq BEQ
inoreab <buffer> bmi BMI
inoreab <buffer> bne BNE
inoreab <buffer> bpl BPL
inoreab <buffer> bvc BVC
inoreab <buffer> bvs BVS
inoreab <buffer> ,y ,Y
inoreab <buffer> ,x ,X

" Returns input true if cursor is in a comment, false otherwise
function! IsComment(true, false)
	let line = getline('.')
	let cmnt_start = match(line,';')
	if cmnt_start == -1
		return a:false
	endif
	if cmnt_start < col('.')-1
		return a:true
	else
		return a:false
endfunction
