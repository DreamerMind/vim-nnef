" Vim syntax file
" Language:            NNEF
" Homepage:            https://github.com/
" Maintainer:          DreamerMind
" Last Change:         2022-03-17

if exists('b:current_syntax')
  finish
endif

syn match nnefEscape /\\[btnfr"/\\]/ display contained
syn match nnefEscape /\\u\x\{4}/ contained
syn match nnefEscape /\\U\x\{8}/ contained
syn match nnefLineEscape /\\$/ contained

" Basic strings
syn region nnefString oneline start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=nnefEscape
syn region nnefString oneline start=/'/ end=/'/

syn match nnefInteger /[+-]\=\<[1-9]\(_\=\d\)*\>/ display
syn match nnefInteger /[+-]\=\<0\>/ display
syn match nnefInteger /[+-]\=\<0x[[:xdigit:]]\(_\=[[:xdigit:]]\)*\>/ display
syn match nnefInteger /[+-]\=\<0o[0-7]\(_\=[0-7]\)*\>/ display
syn match nnefInteger /[+-]\=\<0b[01]\(_\=[01]\)*\>/ display
syn match nnefInteger /[+-]\=\<\(inf\|nan\)\>/ display

syn match nnefFloat /[+-]\=\<\d\(_\=\d\)*\.\d\+\>/ display
syn match nnefFloat /[+-]\=\<\d\(_\=\d\)*\(\.\d\(_\=\d\)*\)\=[eE][+-]\=\d\(_\=\d\)*\>/ display

syn match nnefBoolean /\<\%(true\|false\)\>/ display

syn region nnefArray start=/\[/ end=/\]/ contains=@nnefValue contained

syn cluster nnefValue contains=nnefArray,nnefString,nnefInteger,nnefFloat,nnefBoolean,nnefComment

syn keyword nnefTodo TODO FIXME XXX BUG

syn keyword nnefMainKeyword graph version fragment extension

syn region nnefOpParams start="(" end=")" fold transparent
syntax match nnefFragment /[a-z]\w*(/he=e-1 nextgroup=nnefOpParams

syn keyword nnefType scalar integer string tensor
syn match nnefArrow /->/

syn match nnefComment /#.*/ contains=@Spell,nnefTodo

hi def link nnefComment Comment
hi def link nnefTodo Todo
hi def link nnefType Type
hi def link nnefMainKeyword Keyword
hi def link nnefFragment Function
hi def link nnefArrow Keyword
hi def link nnefBoolean Boolean
hi def link nnefFloat Float
hi def link nnefInteger Number
hi def link nnefString String
hi def link nnefLineEscape SpecialChar
hi def link nnefEscape SpecialChar

syn sync minlines=500
let b:current_syntax = 'nnef'

" vim: et sw=2 sts=2
