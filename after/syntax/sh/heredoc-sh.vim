let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @Sh syntax/sh.vim
unlet b:current_syntax
syntax include @Perl syntax/perl.vim
unlet b:current_syntax
syntax include @Python syntax/python.vim
let b:current_syntax = s:bcs

function! Def_heredoc(marker, contains)
    execute "syntax region heredoc" . a:marker . " matchgroup=Snip "
        \ "start=+<<'". a:marker . "'.*$+ end=+^" . a:marker . "\s*$+ containedin=@Sh contains=" . a:contains
    execute "syntax region heredoc" . a:marker . "2 matchgroup=Snip "
        \ "start=+<<\"". a:marker . "\".*$+ end=+^" . a:marker . "\s*$+ containedin=@Sh contains=" . a:contains
    execute "syntax region heredoc" . a:marker . "3 matchgroup=Snip "
        \ "start=+<<". a:marker . ".*$+ end=+^" . a:marker . "\s*$+ containedin=@Sh contains=" . a:contains
endfunction

call Def_heredoc("PYTHON", "@Python")
call Def_heredoc("PERL", "@Perl")
call Def_heredoc("SHELL", "@Sh")
