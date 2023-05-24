syntax cluster shHeredocHL contains=@sh

function! Def_heredoc(marker, contains)
    let s:bcs = b:current_syntax
    unlet b:current_syntax
    " Load the relavant syntax file
    execute "syntax include @" . a:contains . " syntax/" . a:contains . ".vim"
    let b:current_syntax = s:bcs

    for [region, quotation] in items({"heredoc" . a:marker . "Plain": "", "heredoc" . a:marker . "SingleQuote": "'", "heredoc" . a:marker . "DoubleQuote": "\""})
        execute "syntax region " . region . " matchgroup=Snip start=+<<[-]\\?\\s*" . quotation . a:marker . quotation . ".*$+ end=+\\s*" . a:marker . "\\s*$+ containedin=@sh,@shHereDocHL contains=@" . a:contains
        execute "syntax cluster shHeredocHL add=" . region
    endfor
endfunction

let g:heredocs_default = #{PYTHON: "python", LUA: "lua", PERL: "perl", SHELL: "sh", GNUPLOT: "gnuplot", JSON: "json"}
for [marker, contains] in items(extend(g:heredocs_default, get(g:, 'heredocs', {})))
    call Def_heredoc(marker, contains)
endfor
