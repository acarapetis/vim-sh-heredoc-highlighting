"
" Thankyou to github.com/acarapetis for his repo which I intend to contribute
" to once I have figured out a way to do it his way with functions and for
" loops.
"
" Explanations {{{1
"
" Use this file in place of after/syntax/sh.vim and try the varioush .sh files
" in this directory and its test subdir.
"
" What $runtime/syntax/sh.vim does:
" - Defines 16 matchgroups to be in a heredoc, this defines 16 ways that we
"   can know that we are inside a heredoc. (search for `shFoldHereDoc syn region`)
"   We need to look at an sh.vim from vim 9.1+ since before that it.
"   These cases are displayed in heredocs-vim-16-types.sh and will be
"   highlighted if you use this file.
"   incorrectly allows spaces between the start of the line and the end marker.
" - Link all the match groups to shRedir, this makes it so the matches that
"   define the region are highlighted like redirections.
"   (search for `hi def link shHereDoc01`).
" - Add shHereDoc to the 'contains' list of shFunctionList, shCaseList,
"   shCommandSublist, and shPPSLeftList
"   (search for `contains=.*shHereDoc`)
" - shHereDoc also appears one other place:
"    hi def link shHereDoc	shString
"    hi def link shHereString	shRedir
"    hi def link shHerePayload	shHereDoc
"   I note this here because shHereDoc is already listed in the 'contains'
"   part of shFunctionList, shCaseList, ... so if we did all things with
"
"       syn region shHereDoc matchgroup= start=+<<\s*MONTH+ end=+^\t*MONTY+ contains=@python
"
"   then we would not have to do the thing where we add shHereDocHL to the
"   contains section of those four clusters.
"
"   But because of the link with shString, stuff would get highlighted
"   like a mix of Python and a Bash string: use this file in place of
"   after/syntax/sh/heredoc-sh.vim and open heredocs-monty-16-types.sh
"
" We define our 16 ways to be a python heredoc the same way except that
" the marker has to be PYTHON instead of grabbing whatever the marker is
" with \z(...\) from the start and using it in end with \z1
"
" Then we link all the matchgroups with shRedir
"
" And finally we add shHereDocHL to the contains list of the four clusters.
" The documentation says we should be able to add by using
"     syn region ... start ... end ... contains@python " containedin=@shFunctionList,...
" but I tried that and it doesn't seem to work.
"

" Load the syntaxes {{{1
let s:bcs = b:current_syntax
unlet b:current_syntax
syn include @python syntax/python.vim
unlet b:current_syntax
let g:is_bash = 1
syn include @sh syntax/sh.vim
unlet b:current_syntax
syn include @vim syntax/vim.vim
let b:current_syntax = s:bcs

" Define highlighted heredocs for Python {{{1
" Define the different ways to be in the region {{{2
syn region shHereDocHL matchgroup=shPyHereDoc01 start="<<\s*PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc02 start="<<-\s*PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc03 start="<<\s*\\PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc04 start="<<-\s*\\PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc05 start="<<\s*'PYTHON'"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc06 start="<<-\s*'PYTHON'"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc07 start="<<\s*\"PYTHON\""		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc08 start="<<-\s*\"PYTHON\""		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc09 start="<<\s*\\\_$\_s*PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc10 start="<<-\s*\\\_$\_s*PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc11 start="<<\s*\\\_$\_s*\\PYTHON"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc12 start="<<-\s*\\\_$\_s*\\PYTHON"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc13 start="<<\s*\\\_$\_s*'PYTHON'"		end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc14 start="<<-\s*\\\_$\_s*'PYTHON'"		end="^\t*PYTHON$"	contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc15 start="<<\s*\\\_$\_s*\"PYTHON\""	end="^PYTHON$"		contains=@python
syn region shHereDocHL matchgroup=shPyHereDoc16 start="<<-\s*\\\_$\_s*\"PYTHON\""	end="^\t*PYTHON$"	contains=@python

" Link all the match groups to shRedir {{{2
hi def link shPyHereDoc01 shRedir
hi def link shPyHereDoc02 shRedir
hi def link shPyHereDoc03 shRedir
hi def link shPyHereDoc04 shRedir
hi def link shPyHereDoc05 shRedir
hi def link shPyHereDoc06 shRedir
hi def link shPyHereDoc07 shRedir
hi def link shPyHereDoc08 shRedir
hi def link shPyHereDoc09 shRedir
hi def link shPyHereDoc10 shRedir
hi def link shPyHereDoc11 shRedir
hi def link shPyHereDoc12 shRedir
hi def link shPyHereDoc13 shRedir
hi def link shPyHereDoc14 shRedir
hi def link shPyHereDoc15 shRedir
hi def link shPyHereDoc16 shRedir

" Define highlighted heredocs for MONTY Python again but on region shHereDoc {{{1
" Define the different ways to be in the region {{{2
syn region shHereDoc matchgroup=shMoHereDoc01 start="<<\s*MONTY"		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc02 start="<<-\s*MONTY"		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc03 start="<<\s*\\MONTY"		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc04 start="<<-\s*\\MONTY"		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc05 start="<<\s*'MONTY'"		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc06 start="<<-\s*'MONTY'"		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc07 start="<<\s*\"MONTY\""		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc08 start="<<-\s*\"MONTY\""		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc09 start="<<\s*\\\_$\_s*MONTY"		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc10 start="<<-\s*\\\_$\_s*MONTY"		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc11 start="<<\s*\\\_$\_s*\\MONTY"		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc12 start="<<-\s*\\\_$\_s*\\MONTY"		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc13 start="<<\s*\\\_$\_s*'MONTY'"		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc14 start="<<-\s*\\\_$\_s*'MONTY'"		end="^\t*MONTY$"	contains=@python
syn region shHereDoc matchgroup=shMoHereDoc15 start="<<\s*\\\_$\_s*\"MONTY\""		end="^MONTY$"		contains=@python
syn region shHereDoc matchgroup=shMoHereDoc16 start="<<-\s*\\\_$\_s*\"MONTY\""		end="^\t*MONTY$"	contains=@python

" Link all the match groups to shRedir {{{2
hi def link shMoHereDoc01 shRedir
hi def link shMoHereDoc02 shRedir
hi def link shMoHereDoc03 shRedir
hi def link shMoHereDoc04 shRedir
hi def link shMoHereDoc05 shRedir
hi def link shMoHereDoc06 shRedir
hi def link shMoHereDoc07 shRedir
hi def link shMoHereDoc08 shRedir
hi def link shMoHereDoc09 shRedir
hi def link shMoHereDoc10 shRedir
hi def link shMoHereDoc11 shRedir
hi def link shMoHereDoc12 shRedir
hi def link shMoHereDoc13 shRedir
hi def link shMoHereDoc14 shRedir
hi def link shMoHereDoc15 shRedir
hi def link shMoHereDoc16 shRedir

" Define highlighted heredocs for Shell {{{1
" Define the different ways to be in the region {{{2
syn region shHereDocHL matchgroup=shShHereDoc01 start="<<\s*SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc02 start="<<-\s*SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc03 start="<<\s*\\SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc04 start="<<-\s*\\SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc05 start="<<\s*'SHELL'"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc06 start="<<-\s*'SHELL'"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc07 start="<<\s*\"SHELL\""		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc08 start="<<-\s*\"SHELL\""		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc09 start="<<\s*\\\_$\_s*SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc10 start="<<-\s*\\\_$\_s*SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc11 start="<<\s*\\\_$\_s*\\SHELL"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc12 start="<<-\s*\\\_$\_s*\\SHELL"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc13 start="<<\s*\\\_$\_s*'SHELL'"		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc14 start="<<-\s*\\\_$\_s*'SHELL'"		end="^\t*SHELL$"	contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc15 start="<<\s*\\\_$\_s*\"SHELL\""		end="^SHELL$"		contains=@sh
syn region shHereDocHL matchgroup=shShHereDoc16 start="<<-\s*\\\_$\_s*\"SHELL\""	end="^\t*SHELL$"	contains=@sh

" Link all the match groups to shRedir {{{2
hi def link shShHereDoc01 shRedir
hi def link shShHereDoc02 shRedir
hi def link shShHereDoc03 shRedir
hi def link shShHereDoc04 shRedir
hi def link shShHereDoc05 shRedir
hi def link shShHereDoc06 shRedir
hi def link shShHereDoc07 shRedir
hi def link shShHereDoc08 shRedir
hi def link shShHereDoc09 shRedir
hi def link shShHereDoc10 shRedir
hi def link shShHereDoc11 shRedir
hi def link shShHereDoc12 shRedir
hi def link shShHereDoc13 shRedir
hi def link shShHereDoc14 shRedir
hi def link shShHereDoc15 shRedir
hi def link shShHereDoc16 shRedir

" Define highlighted heredocs for Vim {{{1
" Define the different ways to be in the region {{{2
syn region shHereDocHL matchgroup=shViHereDoc01 start="<<\s*VIM"	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc02 start="<<-\s*VIM"	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc03 start="<<\s*\\VIM"	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc04 start="<<-\s*\\VIM"	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc05 start="<<\s*'VIM'"	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc06 start="<<-\s*'VIM'"	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc07 start="<<\s*\"VIM\""	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc08 start="<<-\s*\"VIM\""	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc09 start="<<\s*\\\_$\_s*VIM"	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc10 start="<<-\s*\\\_$\_s*VIM"	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc11 start="<<\s*\\\_$\_s*\\VIM"	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc12 start="<<-\s*\\\_$\_s*\\VIM"	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc13 start="<<\s*\\\_$\_s*'VIM'"	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc14 start="<<-\s*\\\_$\_s*'VIM'"	end="^\t*VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc15 start="<<\s*\\\_$\_s*\"VIM\""	end="^VIM$"	contains=@vim
syn region shHereDocHL matchgroup=shViHereDoc16 start="<<-\s*\\\_$\_s*\"VIM\""	end="^\t*VIM$"	contains=@vim

" Link all the match groups to shRedir {{{2
hi def link shViHereDoc01 shRedir
hi def link shViHereDoc02 shRedir
hi def link shViHereDoc03 shRedir
hi def link shViHereDoc04 shRedir
hi def link shViHereDoc05 shRedir
hi def link shViHereDoc06 shRedir
hi def link shViHereDoc07 shRedir
hi def link shViHereDoc08 shRedir
hi def link shViHereDoc09 shRedir
hi def link shViHereDoc10 shRedir
hi def link shViHereDoc11 shRedir
hi def link shViHereDoc12 shRedir
hi def link shViHereDoc13 shRedir
hi def link shViHereDoc14 shRedir
hi def link shViHereDoc15 shRedir
hi def link shViHereDoc16 shRedir

" Add shHereDocHL to the same clusters that contain shHereDoc {{{1
syn cluster shCaseList	contains=@shCommandSubList,shCaseEsac,shColon,shCommandSub,shCommandSubBQ,shSubshare,shValsub,shComment,shDblBrace,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shCtrlSeq,shHereDocHL
syn cluster shCommandSubList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shComment,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL
syn cluster shFunctionList	contains=shBracketExpr,@shCommandSubList,shCaseEsac,shColon,shComment,shDo,shEcho,shExpr,shFor,shHereDoc,shIf,shOption,shHereString,shRedir,shSetList,shSource,shStatement,shVariable,shOperator,shCtrlSeq,shHereDocHL
syn cluster shPPSLeftList	contains=shAlias,shArithmetic,shBracketExpr,shCmdParenRegion,shCommandSub,shSubshare,shValsub,shCtrlSeq,shDeref,shDerefSimple,shDoubleQuote,shEcho,shEscape,shExDoubleQuote,shExpr,shExSingleQuote,shHereDoc,shNumber,shOperator,shOption,shPosnParm,shHereString,shRedir,shSingleQuote,shSpecial,shStatement,shSubSh,shTest,shVariable,shHereDocHL

" vim: ts=16 fdm=marker
