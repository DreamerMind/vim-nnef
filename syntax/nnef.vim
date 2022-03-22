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

syntax keyword nnefStdFragment external variable constant update reshape transpose concat split slice squeeze stack unstack tile pad add sub mul div pow exp log sin cos abs sign rcp neg copy lt gt le ge eq ne and or not floor ceil round select sqr sqrt rsqr rsqrt log2 min max clamp matmul conv deconv box debox argmax_pool sample desample nearest_downsample area_downsample nearest_upsample multilinear_upsample sum_reduce max_reduce min_reduce argmax_reduce argmin_reduce any_reduce all_reduce mean_reduce moments relu sigmoid tanh softabs softmax softplus elu prelu leaky_relu max_pool_with_index max_pool avg_pool rms_pool linear separable_conv separable_deconv local_response_normalization local_mean_normalization local_variance_normalization local_contrast_normalization l1_normalization l2_normalization batch_normalization avg_roi_pool max_roi_pool roi_resample avg_roi_align max_roi_align min_max_linear_quantize zero_point_linear_quantize linear_quantize logarithmic_quantize copy_n add_n

syn keyword nnefType scalar integer string tensor
syn match nnefArrow /->/

syn match nnefComment /#.*/ contains=@Spell,nnefTodo

hi def link nnefComment Comment
hi def link nnefTodo Todo
hi def link nnefType Type
hi def link nnefMainKeyword Keyword
hi def link nnefFragment Special
hi def link nnefStdFragment Function
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
