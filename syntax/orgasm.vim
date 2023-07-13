" Vim syntax file
" Language: Original gol-16 Assembly Language
" Maintainer: Matteo Golin matteo.golin@gmail.com
" Last Change: 2023-07-06

" quit when syntax file was already loaded
if exists("b:current_syntax")
    finish
endif


let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" Comment
syn keyword asmTodo          contained TODO FIXME NOTE
syn region asmComment        start=";" end="$" keepend contains=asmTodo,@Spell display

"Identifiers
syn match asmIdentifier     "[[:alpha:]_][[:alnum:]_]*" display
syn match asmRegister       "[rR][0-3]" display
syn keyword asmSpecialRegister SP PC FR LR

" Delimiting
syn match comma             "\,"     display
syn match squarebrackets    "\]"    display
syn match squarebrackets    "\["    display
syn match curlybrackets     "}"     display
syn match curlybrackets     "{"     display

" Data types
syn match asmDec                "#\<[0-9]\d*\>"             display
syn match asmHex                "#\<0x[0-9a-fA-F]\+\>"      display
syn match asmBin                "#\<0b[0-1]\+\>"            display
syn match asmCharacterEscape	"\\."                       contained display
syn match asmCharacter          "'.\{1,2}'"                 contains=asmCharacterEscape display
syn match asmStringEscape       "\\\_."                     contained display
syn match asmStringEscape       "\\\%(\o\{3}\|00[89]\)"     contained display
syn match asmStringEscape       "\\x\x\+"                   contained display
syn region asmString            start="\"" end="\"" skip="\\\\\|\\\"" contains=asmStringEscape display

" Operators and keywords
syn keyword asmArithmeticOp SUB ADD MUL DIV CMP sub add mul div cmp nextgroup=asmRegister
syn keyword asmLogicalOp AND OR NOT LSR LSL ROR ROL and or not lsr lsl ror rol nextgroup=asmRegister
syn keyword asmMemoryOp MOV LDR STR LEA PUSH POP mov ldr str lea push pop nextgroup=asmRegister
syn keyword asmDataOp DCD EQU dcd equ nextgroup=asmHex,asmBin,asmDec,asmString,asmCharacter
syn match asmBranchOp "B[[:alpha:]]\{2}\>"       display
syn keyword asmBranchOp B
syn match asmBranchLinkOp "BL[[:alpha:]]\{2}\>"  display
syn keyword asmBranchOp BL


syn case match

" Link to highlights
hi def link asmHex              Number
hi def link asmBin              Number
hi def link asmDec              Number
hi def link asmCharacter        Character
hi def link asmString           String
hi def link asmStringEscape     Special
hi def link asmCharacterEscape	Special

hi def link asmComment          Comment
hi def link asmTodo             Todo
hi def link asmIdentifier       Identifier
hi def link asmRegister         Type " Registers are not types but this is the best colour
hi def link asmSpecialRegister  Type

hi def link comma               Delimiter
hi def link brackets            Delimiter
hi def link squarebrackets      Delimiter
hi def link curlybrackets       Delimiter

hi def link asmArithmeticOp     Operator
hi def link asmLogicalOp        Operator
hi def link asmMemoryOp         Function
hi def link asmDataOp           Define
hi def link asmBranchOp         Conditional
hi def link asmBranchLinkOp     Conditional

let b:current_syntax = "orgasm"

let &cpo = s:cpo_save
unlet s:cpo_save
