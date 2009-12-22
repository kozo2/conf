if exists("b:current_syntax")
  finish
endif

syntax case match

syn keyword processingFunction contained setup size loadStrings split
syn keyword processingType     String int

hi def link processingFunction Function
hi def link processingType     Type

let b:current_syntax = "processing"
