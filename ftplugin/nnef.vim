" Vim filetype plugin
" Language:    NNEF
" Homepage:    https://github.com/DreamerMind/vim-nnef
" Maintainer:  DreamerMind
" Author:      DreamerMind <sigmer66@yahoo.com>
" Last Change: 2022-03-17

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim
let b:undo_ftplugin = 'setlocal commentstring< comments<'

setlocal commentstring=#\ %s
setlocal comments=:#

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: et sw=2 sts=2
