" Vim syntax file
" Language: Original gol-16 Micro-code
" Maintainer: Matteo Golin matteo.golin@gmail.com
" Last Change: 2023-07-12

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

" Comment
syn keyword mcTodo contained TODO
syn region mcComment start=";" end="$" keepend contains=asmTodo,@spell display

" Delimiters
syn match mcComma "\V," display
syn match mcColon "\V:" display

" Link to highlights
hi def link mcComma        Delimeter
hi def link mcColon        Delimeter
hi def link mcComment      Comment
hi def link mcTodo         Todo
hi def link mcStateLabel   Identifier
hi def link mcSignal       Number

let b:current_syntax = "orgmc"

let &cpo = s:cpo_save
unlet s:cpo_save
