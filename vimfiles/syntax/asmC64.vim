" Syntax vim file for Commodore 64 assembly (ax65 assembler syntax specifically)
" Author: Simone Pilon <wertyseek@gmail.com>

" Comments and the like
syntax keyword asmC64Todo TODO FIXME XXX
syntax match asmC64Comment :;.*$: contains=asmC64Todo

" Operands (addresses, immediate values)
syntax match asmC64Operand '\d\+'
syntax match asmC64Operand '\$\x\+'
syntax match asmC64Operand '&\o\+'
syntax match asmC64Operand '%[01]\+'
syntax match asmC64Operand '"[^"]*"'
syntax match asmC64ImmediateOperand '#'

" Opcodes (upper and lower case variants, legal opcodes only)
syntax keyword asmC64Opcode adc and asl bit brk clc cld cli clv cmp cpx cpy dec dex dey eor inc inx iny lda ldx ldy lsr nop ora pha php pla plp rol ror rti rts sbc sec sed sei sta stx sty tax tay tsx txa txs tya jmp jsr bcc bcs beq bmi bne bpl bvc bvs nextgroup=asmC64Operand,asmC64Label skipwhite
syntax keyword asmC64Opcode ADC AND ASL BIT BRK CLC CLD CLI CLV CMP CPX CPY DEC DEX DEY EOR INC INX INY LDA LDX LDY LSR NOP ORA PHA PHP PLA PLP ROL ROR RTI RTS SBC SEC SED SEI STA STX STY TAX TAY TSX TXA TXS TYA JMP JSR BCC BCS BEQ BMI BNE BPL BVC BVS nextgroup=asmC64Operand,asmC64Label skipwhite

" Indirect addressing modes
syntax match asmC64Opcode ')\?\s*,\s*[xXyY])\?'
syntax match asmC64Opcode '('

" Underline text between labels and opcodes
syntax match asmC64lineup ':\s*\w'hs=s+1,he=e-1,me=e-1

" Preprocessor directives
syntax match asmC64PreProc '^#\h\w*'

" Assembler commands
syntax match asmC64Type '\.[()]'
syntax match asmC64Type '\.\h\w*' nextgroup=asmC64Operand,asmC64Label skipwhite

" Labels and program counter
syntax match asmC64ProgramCounter '\*'
syntax match asmC64LabelDef '^\h\w*' nextgroup=asmC64Opcode skipwhite
syntax match asmC64Label '\h\w*'

" Linking to generic classes
highlight default link asmC64Comment Comment
highlight default link asmC64Operand Constant
highlight default link asmC64ProgramCounter Identifier
highlight default link asmC64Label Identifier
highlight default link asmC64LabelDef Identifier
highlight default link asmC64Opcode Statement
highlight default link asmC64PreProc PreProc
highlight default link asmC64Type Type
highlight default link asmC64ImmediateOperand Special
highlight default link asmC64Ignore Ignore
highlight default link asmC64Todo Todo
highlight default link asmC64lineup Underlined

let b:current_syntax = "asmC64"
