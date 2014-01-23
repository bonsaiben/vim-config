function! OpenLastMigration()
  let migration = system('ls db/migrate | tail -n 1')
  exec "edit db/migrate/" . migration
endfunction
command! OpenLastMigration call OpenLastMigration()
map <leader>gdm :OpenLastMigration<cr>
