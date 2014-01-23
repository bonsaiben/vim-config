" Make Rails.vim's :A work for lib/ and spec/lib
" lib/foo.rb -> spec/lib/foo_spec.rb
autocmd User Rails/lib/* let b:rails_alternate = 'spec/' . rails#buffer().name()[0:-4] . '_spec.rb'
" spec/lib/foo_spec.rb -> lib/foo.rb
autocmd User Rails/spec/lib/* let b:rails_alternate = rails#buffer().name()[5:-9] . '.rb'

" AppleScript
au BufRead,BufNewFile *.AppleScript set filetype=applescript
au BufRead,BufNewFile *.scpt set filetype=applescript
