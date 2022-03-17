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
" Multi-line basic strings
syn region nnefString start=/"""/ end=/"""/ contains=nnefEscape,nnefLineEscape
" Literal strings
syn region nnefString oneline start=/'/ end=/'/
" Multi-line literal strings
syn region nnefString start=/'''/ end=/'''/

syn match nnefInteger /[+-]\=\<[1-9]\(_\=\d\)*\>/ display
syn match nnefInteger /[+-]\=\<0\>/ display
syn match nnefInteger /[+-]\=\<0x[[:xdigit:]]\(_\=[[:xdigit:]]\)*\>/ display
syn match nnefInteger /[+-]\=\<0o[0-7]\(_\=[0-7]\)*\>/ display
syn match nnefInteger /[+-]\=\<0b[01]\(_\=[01]\)*\>/ display
syn match nnefInteger /[+-]\=\<\(inf\|nan\)\>/ display

syn match nnefFloat /[+-]\=\<\d\(_\=\d\)*\.\d\+\>/ display
syn match nnefFloat /[+-]\=\<\d\(_\=\d\)*\(\.\d\(_\=\d\)*\)\=[eE][+-]\=\d\(_\=\d\)*\>/ display

syn match nnefBoolean /\<\%(true\|false\)\>/ display

" https://tools.ietf.org/html/rfc3339
syn match nnefDate /\d\{4\}-\d\{2\}-\d\{2\}/ display
syn match nnefDate /\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?/ display
syn match nnefDate /\d\{4\}-\d\{2\}-\d\{2\}[T ]\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?\%(Z\|[+-]\d\{2\}:\d\{2\}\)\?/ display

syn match nnefDotInKey /\v[^.]+\zs\./ contained display
syn match nnefKey /\v(^|[{,])\s*\zs[[:alnum:]._-]+\ze\s*\=/ contains=nnefDotInKey display
syn region nnefKeyDq oneline start=/\v(^|[{,])\s*\zs"/ end=/"\ze\s*=/ contains=nnefEscape
syn region nnefKeySq oneline start=/\v(^|[{,])\s*\zs'/ end=/'\ze\s*=/

syn region nnefTable oneline start=/^\s*\[[^\[]/ end=/\]/ contains=nnefKey,nnefKeyDq,nnefKeySq,nnefDotInKey

syn region nnefTableArray oneline start=/^\s*\[\[/ end=/\]\]/ contains=nnefKey,nnefKeyDq,nnefKeySq,nnefDotInKey

syn region nnefKeyValueArray start=/=\s*\[\zs/ end=/\]/ contains=@nnefValue

syn region nnefArray start=/\[/ end=/\]/ contains=@nnefValue contained

syn cluster nnefValue contains=nnefArray,nnefString,nnefInteger,nnefFloat,nnefBoolean,nnefDate,nnefComment

syn keyword nnefTodo TODO FIXME XXX BUG contained

syn match nnefComment /#.*/ contains=@Spell,nnefTodo

hi def link nnefComment Comment
hi def link nnefTodo Todo
hi def link nnefTableArray Title
hi def link nnefTable Title
hi def link nnefDotInKey Normal
hi def link nnefKeySq Identifier
hi def link nnefKeyDq Identifier
hi def link nnefKey Identifier
hi def link nnefDate Constant
hi def link nnefBoolean Boolean
hi def link nnefFloat Float
hi def link nnefInteger Number
hi def link nnefString String
hi def link nnefLineEscape SpecialChar
hi def link nnefEscape SpecialChar

syn sync minlines=500
let b:current_syntax = 'nnef'

" vim: et sw=2 sts=2
