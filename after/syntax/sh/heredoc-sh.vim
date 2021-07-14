let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @sh syntax/sh.vim
unlet b:current_syntax
syntax include @json syntax/json.vim
unlet b:current_syntax
syntax include @python syntax/python.vim
unlet b:current_syntax
syntax include @gnuplot syntax/gnuplot.vim
unlet b:current_syntax
execute "syntax include @perl syntax/perl.vim"
unlet b:current_syntax
syntax include @lua syntax/lua.vim
let b:current_syntax = s:bcs

syntax cluster shHeredocHL contains=@sh

function! Def_heredoc(marker, contains)
    "let s:bcs = b:current_syntax
    "unlet b:current_syntax
    "execute "syntax include @" . a:contains . " syntax/" . a:contains . ".vim"
    "let b:current_syntax = s:bcs

    execute "syntax region heredoc" . a:marker . " matchgroup=Snip "
        \ "start=+<<\s*'". a:marker . "'.*$+ end=+^" . a:marker . "\s*$+ containedin=@sh,@shHereDocHL contains=@" . a:contains
    execute "syntax region heredoc" . a:marker . "2 matchgroup=Snip "
        \ "start=+<<\s*\"". a:marker . "\".*$+ end=+^" . a:marker . "\s*$+ containedin=@sh,@shHereDocHL contains=@" . a:contains
    execute "syntax region heredoc" . a:marker . "3 matchgroup=Snip "
        \ "start=+<<\s*". a:marker . ".*$+ end=+^" . a:marker . "\s*$+ containedin=@sh,@shHereDocHL contains=@" . a:contains

    execute "syntax cluster shHeredocHL add=heredoc" . a:marker
    execute "syntax cluster shHeredocHL add=heredoc" . a:marker . "2"
    execute "syntax cluster shHeredocHL add=heredoc" . a:marker . "3"
endfunction

call Def_heredoc("PYTHON", "python")
call Def_heredoc("LUA", "lua")
call Def_heredoc("PERL", "perl")
call Def_heredoc("SHELL", "sh")
call Def_heredoc("GNUPLOT", "gnuplot")
call Def_heredoc("JSON", "json")
