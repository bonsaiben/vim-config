" Run a test tool with the current file and line number
" The test tool is run in the last Terminal window
function! RunTestTool(tool_cmd)
  let dir = system('pwd')
  let applescript = "osascript -e '".'tell application "Terminal"'
  let applescript .= "\n"
  let applescript .= 'do script "cd '.dir.'" in last window'
  let applescript .= "\n"
  let applescript .= 'do script "'.a:tool_cmd.'" in last window'
  let applescript .= "\n"
  let applescript .= 'end tell'."'"
  let foo = system(applescript)
endfunction

function! ShowVisor()
  let dir = system('pwd')
  let applescript = "osascript -e 'tell application \"Terminal\" to activate'"
  let foo = system(applescript)
endfunction

" If the file ends with _spec.rb, RunTestTool with rspec
" If the file ends with .feature, RunTestTool with cuke
function! RunFocusedTest()
  "let spec_command = system('if [ x != "x"$(which spec) ] ; then echo -n spec ; elif [ x != "x"$(which rspec) ] ; then echo -n rspec ; fi')
  let spec_command = "bin/rspec"
  let filename = expand("%")
  if filename =~ '_spec\.rb$'
    call RunTestTool(spec_command." ".expand("%").":".line("."))
  endif
  if filename =~ '\.feature$'
    call RunTestTool("cuke ".expand("%").":".line("."))
  endif
  call ShowVisor()
endfunction
command! RunFocusedTest :call RunFocusedTest()
nmap <leader>tl :RunFocusedTest<cr>

function! RunTests()
  "let spec_command = system('if [ x != "x"$(which spec) ] ; then echo -n spec ; elif [ x != "x"$(which rspec) ] ; then echo -n rspec ; fi')
  let spec_command = "bin/rspec"
  let filename = expand("%")
  if filename =~ '_spec\.rb$'
    call RunTestTool(spec_command." ".expand("%"))
  endif
  if filename =~ '\.feature$'
    call RunTestTool("cuke ".expand("%"))
  endif
  call ShowVisor()
endfunction
command! RunTests :call RunTests()
nmap <leader>tf :RunTests<cr>

function! RunAllTests()
  let spec_command = "bin/rspec"
  call RunTestTool(spec_command)
  call ShowVisor()
endfunction
command! RunAllTests :call RunAllTests()
nmap <leader>tt :RunAllTests<cr>
