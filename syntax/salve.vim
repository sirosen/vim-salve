" Vim syntax file
" Language:     SALVE
" Maintainer:   Stephen Rosen
" Version:      1

if exists("b:current_syntax") || exists("b:did_ftplugin") | finish | endif
let b:current_syntax = "salve"
let b:did_ftplugin = 1
let b:undo_ftplugin = "setl com< fo< ofu<"
let s:save_cpo= &cpo

" ignore case, block delimiters are keywords
syn case ignore 
setlocal iskeyword={,}
setlocal comments=#

" highlight block IDs as types
syn match block_identifier "file"
syn match block_identifier "directory"
syn match block_identifier "manifest"
highlight link block_identifier Type

let &cpo = s:save_cpo
unlet s:save_cpo
