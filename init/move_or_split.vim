function! MoveOrSplit(direction)
  let cur_pane1 = winnr()
  :exec "normal \<c-w>" . a:direction
  let cur_pane2 = winnr()
  let under_four_splits = winnr('$') < 4
  let same_pane = cur_pane1 == cur_pane2
  if same_pane
    if a:direction == 'j' || a:direction == 'k'
      :split
    else
      :vsplit
    endif
    :exec "normal \<c-w>" . a:direction
  endif
endfunction

:command! MoveOrSplitDown :call MoveOrSplit('j')
:command! MoveOrSplitUp :call MoveOrSplit('k')
:command! MoveOrSplitRight :call MoveOrSplit('l')
:command! MoveOrSplitLeft :call MoveOrSplit('h')

" unmap regreplop keys and free <C-k>
"autocmd VimEnter * nunmap <C-k>
"autocmd VimEnter * nunmap <C-k><C-k>

:map <c-j> :MoveOrSplitDown<cr>
:nmap <c-k> :MoveOrSplitUp<cr>
:map <c-l> :MoveOrSplitRight<cr>
:map <c-h> :MoveOrSplitLeft<cr>
