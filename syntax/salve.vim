" Vim syntax file
" Language:     SALVE
" Maintainer:   Stephen Rosen
" Version:      1

" general syntax highlighting plugin stuff
if exists("b:current_syntax") || exists("b:did_ftplugin") | finish | endif
let b:current_syntax = "salve"
let b:did_ftplugin = 1
let b:undo_ftplugin = "setl com< fo< ofu<"
let s:save_cpo= &cpo

" ignore case, block delimiters are keywords
syn case ignore 

" blocks are regions
syn region Block start='{' end='}' contains=salve_string

" highlight block IDs as types
syn keyword salve_block_id file directory manifest
hi link salve_block_id Type

" attr ids are only in blocks
syn keyword salve_attribute_id containedin=Block action source target
hi link salve_attribute_id Keyword

" modeled on Python String syntax highlighting
syn region salve_string start=+\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
hi link salve_string String

syn match salve_comment "#.*$" contains=salve_todo
hi link salve_comment Comment

syn keyword salve_todo FIXME TODO NOTE XXX contained
hi link salve_todo Todo

let &cpo = s:save_cpo
unlet s:save_cpo
