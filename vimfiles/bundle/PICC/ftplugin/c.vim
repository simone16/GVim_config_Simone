" The following regexs are used to parse device and compiler information
" if they are not found, the file is assumed to be regular c source code.
let compiler_pattern = '\v//! *compiler *\= *(\w+)'
let device_pattern = '\v//! *device *\= *(\w+)'
let b:compiler = ""		" Stores the compiler name
let b:device = ""			" Stores the device name (uppercase)

" Search for the patterns:
if search( compiler_pattern, 'cW') > 0
	let b:compiler = matchlist(getline('.'), compiler_pattern)[1]
endif
if search( device_pattern, 'cW') > 0
	let b:device = toupper(matchlist(getline('.'), device_pattern)[1])
endif

" Setup xc work environment:
if (b:compiler !=? "") && (b:device !=? "")
	"Status line:
	let &rulerformat = "%30(" . b:device . ", " . b:compiler . " (%c%V,%l) %p%%%)"
	"mappings:
	"	view Datasheet
	nnoremap <buffer> <localleader>d :execute "!~/bin/datasheet.sh " . b:device<CR>
	"	Compile
	nnoremap <buffer> <localleader>c :execute "!" . b:compiler . " --chip=" . b:device . " %:p"<CR>
	"	inspect Header
	nnoremap <buffer> <localleader>h :execute "vsplit /opt/microchip/" . b:compiler . "/v2.00/pic/include/pic" . tolower(b:device) . ".h"<CR>
	"	inspect configuration Word documentation
	nnoremap <buffer> <localleader>w :execute "!firefox /opt/microchip/" . b:compiler . "/v2.00/docs/chips/" . tolower(b:device) . ".html"<CR>
	"	Load to device (pk2cmd)
	nnoremap <buffer> <localleader>l :execute "!pk2cmd -B/usr/local/share/pk2cmd/ -PPIC" . b:device . " -M -F%:p:r.hex"<CR>
	"	Verify device (pk2cmd)
	nnoremap <buffer> <localleader>v :execute "!pk2cmd -B/usr/local/share/pk2cmd/ -PPIC" . b:device . " -Y -F%:p:r.hex"<CR>
	"menu entries:
	menu PICs.datasheet<Tab><localleader>d <localleader>d<CR>
	menu PICs.compile<Tab><localleader>c <localleader>c<CR>
	menu PICs.header<Tab><localleader>h <localleader>h<CR>
	menu PICs.config_word<Tab><localleader>w <localleader>w<CR>
	menu PICs.load<Tab><localleader>l <localleader>l<CR>
	menu PICs.verify<Tab><localleader>v <localleader>v<CR>
endif
