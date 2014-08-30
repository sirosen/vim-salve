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
syn region salve_block start='{' end='}' contains=salve_string,salve_attribute_id,salve_attribute_val

" highlight block IDs as types
syn keyword salve_block_id file directory manifest
hi link salve_block_id Type

" attrs are only in blocks
syn keyword salve_attribute_id action source target contained
hi link salve_attribute_id Identifier

syn keyword salve_attribute_val create copy contained
hi link salve_attribute_val Special

" modeled on Python String syntax highlighting
syn region salve_string start=+\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=salve_env_var
hi link salve_string String

syn match salve_env_var "$[A-Za-z0-9_]*" contained
hi link salve_env_var Macro

syn match salve_comment "#.*$" contains=salve_todo
hi link salve_comment Comment

syn keyword salve_todo FIXME TODO NOTE XXX contained
hi link salve_todo Todo

let &cpo = s:save_cpo
unlet s:save_cpo
