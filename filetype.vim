if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.podspec setfiletype ruby
    au! BufRead,BufNewFile Podfile setfiletype ruby
augroup END
