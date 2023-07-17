" Vim syntax file
" Language: gol-16 Microcode
" Maintainer: Matteo Golin matteo.golin@gmail.com
" Last Change: 2023-07-16

" quit when syntax file is already loaded
if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" Signals
syn match mcSignal "\<[a-zA-Z][a-zA-Z0-9]*" display

" State labels
syn match mcStateLabel "\<[[:alpha:]_][[:alnum:]_]*\s*:" display
syn match mcNextState "#\<[[:alpha:]_][[:alnum:]_]*" display

" Opcodes
syn match mcOpcode "\$\<\x\+" display

" Comment
syn keyword mcTodo contained TODO
syn region mcComment start=";" end="$" keepend contains=asmTodo,@spell display

" Delimiters
syn match mcComma "," display
syn match mcColon ":" display

" Link to highlights
hi def link mcComma         Delimeter
hi def link mcColon         Delimeter
hi def link mcComment       Comment
hi def link mcTodo          Todo
hi def link mcStateLabel    Function
hi def link mcNextState     Function
hi def link mcSignal        Character
hi def link mcOpcode        Macro

let b:current_syntax = "orgmc"

let &cpo = s:cpo_save
unlet s:cpo_save
