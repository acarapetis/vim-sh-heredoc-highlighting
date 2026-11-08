function! Def_heredoc(marker, contains)
    let s:bcs = b:current_syntax
    unlet b:current_syntax
    " Load the relavant syntax file
    execute "syntax include @" . a:contains . " syntax/" . a:contains . ".vim"
    let b:current_syntax = s:bcs

    " number | marker on next line | Quote type | Backslash before marker | indented |
    "   01   |        No           |   Plain    |         No              |   No     |
    "   02   |        No           |   Plain    |         No              |   Yes    |
    "   03   |        No           |   Plain    |         Yes             |   No     |
    "   04   |        No           |   Plain    |         Yes             |   Yes    |
    "   05   |        No           |   Single   |         No              |   No     |
    "   06   |        No           |   Single   |         No              |   Yes    |
    "   **   |        No           |   Single   |         Yes             |   No     | Skipped (not plain and bs before marker)
    "   **   |        No           |   Single   |         Yes             |   Yes    | Skipped (not plain and bs before marker)
    "   07   |        No           |   Double   |         No              |   No     |
    "   08   |        No           |   Double   |         No              |   Yes    |
    "   **   |        No           |   Double   |         Yes             |   No     | Skipped (not plain and bs before marker)
    "   **   |        No           |   Double   |         Yes             |   Yes    | Skipped (not plain and bs before marker)
    "   09   |        Yes          |   Plain    |         No              |   No     |
    "   10   |        Yes          |   Plain    |         No              |   Yes    |
    "   11   |        Yes          |   Plain    |         Yes             |   No     |
    "   12   |        Yes          |   Plain    |         Yes             |   Yes    |
    "   13   |        Yes          |   Single   |         No              |   No     |
    "   14   |        Yes          |   Single   |         No              |   Yes    |
    "   **   |        Yes          |   Single   |         Yes             |   No     | Skipped (not plain and bs before marker)
    "   **   |        Yes          |   Single   |         Yes             |   Yes    | Skipped (not plain and bs before marker)
    "   15   |        Yes          |   Double   |         No              |   No     |
    "   16   |        Yes          |   Double   |         No              |   Yes    |
    "   **   |        Yes          |   Double   |         Yes             |   No     | Skipped (not plain and bs before marker)
    "   **   |        Yes          |   Double   |         Yes             |   Yes    | Skipped (not plain and bs before marker)

    " Do all the ones with the marker on the same line, then the ones with the
    " marker on the next line.
    for [bsSuffix, startSuffix] in [["", ""], ["Bs", "\\\\\\_$\\_s*"]]
        " Do 4 for each type of quote (none, single, double) except we only
        " except we will skip two for for single and double quote so 4+2+2=8
        " total iterations that do something.
        for [matchGroup, quotation] in items({"heredoc" . a:marker . "Plain": "", "heredoc" . a:marker . "SingleQuote": "'", "heredoc" . a:marker . "DoubleQuote": "\""})
            " Do without and with a backslash right before the start marker
            " where the 'with' part being skipped for all the quoted ones
            for [extra, startExtraSuffix] in [[ "", ""], ["Extra", "\\\\" ]]
                if (matchGroup != ("heredoc" . a:marker . "Plain")) && (extra != "")
                    continue
                endif
                " Do not indented and indented
                for [mgSuffix, startPrefix, endPrefix] in [["", "<<\\s*", "^"], ["Indented", "<<-\\s*", "^\\t*"]]
                    let mgName = matchGroup . extra . mgSuffix . bsSuffix
                    let start  = startPrefix . startSuffix . startExtraSuffix . quotation . a:marker .quotation . "\\s*"
                    let end    = endPrefix   . a:marker . "$"
                    execute "syntax region shHereDocHL matchgroup=" . mgName . " start=+" . start . "+ end=+" . end . "+ contains=@" . a:contains
                    execute "hi def link " . mgName . " shRedir"
                endfor
            endfor
        endfor
    endfor
endfunction

let g:heredocs_default = #{PYTHON: "python", LUA: "lua", PERL: "perl", SHELL: "sh", GNUPLOT: "gnuplot", JSON: "json", VIM: "vim"}
for [marker, contains] in items(extend(g:heredocs_default, get(g:, 'heredocs', {})))
    call Def_heredoc(marker, contains)
endfor

for container in ['shFunctionList', 'shCaseList', 'shCommandSublist', 'shPPSLeftList']
    execute "syn cluster " . container . " add=shHereDocHL"
endfor
" vim: ts=16 fdm=marker
