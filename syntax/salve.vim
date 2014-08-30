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
syn region salve_block start='{' end='}' contains=salve_string,salve_attribute_id,salve_attribute_val,salve_number
syn keyword salve_block_delims { }
hi link salve_block_delims Delimiter

" highlight block IDs as types
syn keyword salve_block_id file directory manifest
hi link salve_block_id Type

" attrs are only in blocks, and there are a specific set of them
syn keyword salve_attribute_id action source target user group mode contained
hi link salve_attribute_id Identifier

" raw-string attribute values should be highlighted the same way as strings
syn keyword salve_attribute_val create copy contained
hi link salve_attribute_val Operator

" raw numbers are also valid attribute values that don't need to be quoted
syn match salve_number "[0-9]*" contained
hi link salve_number Number

" modeled on Python String syntax highlighting, note that although a string is
" listed as contained by salve_blocks, it does not itself have the contained
" property (i.e. strings can appear outside of blocks)
syn region salve_string start=+\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=salve_env_var
hi link salve_string String

" environment variables are found in strings, but should be highlighted
" slightly differently to be more identifiable
syn match salve_env_var "$[A-Za-z_][A-Za-z0-9_]*" contained
hi link salve_env_var Macro

" Comments are one line only, starting with a hash character not contained in a
" string
syn match salve_comment "#.*$" contains=salve_todo
hi link salve_comment Comment

" todos are special comment keywords
syn keyword salve_todo FIXME TODO NOTE XXX contained
hi link salve_todo Todo

" undo any changes to cpo
let &cpo = s:save_cpo
unlet s:save_cpo
