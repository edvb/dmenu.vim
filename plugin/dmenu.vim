" dmenu.vim - dmenu functions for vim
" Author:  Ed van Bruggen
" Version: 1.0
" License: Vim License. See :help license

if exists('g:loaded_dmenu')
  finish
endif
let g:loaded_dmenu = 1

let s:save_cpo = &cpo
set cpo&vim

" global varibles {{{1
if !exists('g:dmenu_cmd')
  let g:dmenu_cmd = 'dmenu -i -l 20'
endif

if !exists('g:dmenu_ls')
  let g:dmenu_ls = 'find -type f -printf "%P\n" | tail -n +2'
endif

if !exists('g:dmenu_git_ls')
  let g:dmenu_git_ls= 'git ls-files'
endif

" functions {{{1
" return true if vim is in a git repository
function! s:is_git_repo()
  call system('git rev-parse')
  return v:shell_error ? 0 : 1
endfunction

" launches dmenu with input and opens selection with given vim cmd
function! s:dmenu_open(input, cmd)
  let file = system('echo -e "' . a:input . '" | ' . g:dmenu_cmd . ' -p :' . a:cmd)
  if !empty(file)
    execute a:cmd . ' ' . file
  endif
endfunction

" open file in cwd with cmd
function! s:dmenu_file(cmd)
  let files = s:is_git_repo() ? g:dmenu_git_ls : g:dmenu_ls
  call s:dmenu_open(system(files), a:cmd)
endfunction

" switch to already loaded buffer with cmd
function! s:dmenu_buf(cmd)
  let bufs = range(1, bufnr('$'))               " get open buffers
  call filter(bufs, 'buflisted(v:val)')         " remove unlisted buffers
  let files = map(copy(bufs), 'bufname(v:val)') " convert numbers to names

  call s:dmenu_open(join(files, '\n'), a:cmd)
endfunction

" commands {{{1
command! -nargs=1 DmenuFile call s:dmenu_file(<args>)
command! -nargs=1 DmenuBuf  call s:dmenu_buf(<args>)

" }}}

let &cpo = s:save_cpo
