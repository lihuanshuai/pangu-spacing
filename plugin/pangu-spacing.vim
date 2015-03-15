" plugin/pangu-spacing.vim
" Author:   Li Huanshuai <lihuanshuaiplus@qq.com>
" License:  APLv2

" Install this file as plugin/pangu-spacing.vim.

" ============================================================================

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if &cp || exists("g:pangu_spacing_loaded") && g:pangu_spacing_loaded
  finish
endif
let g:pangu_spacing_loaded = 1

let s:save_cpo = &cpo
set cpo&vim

func! SpaceLines() range " {{{1
python << EOF
import pangu
import vim
firstline = int(vim.eval('a:firstline')) - 1
lastline = int(vim.eval('a:lastline'))
coding = 'utf-8'
cb = vim.current.buffer
lines = cb[firstline:lastline]
for idx, line in enumerate(lines):
    line = line.decode(coding)
    lines[idx] = pangu.spacing(line).encode(coding)
cb[firstline:lastline] = lines
EOF
endfunc
" 1}}}

let &cpo = s:save_cpo
unlet s:save_cpo

