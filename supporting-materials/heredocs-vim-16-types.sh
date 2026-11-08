# shHereDoc01 | quote: None | indent: No | bs_before_marker: No | bs_newline: No
cat << VIM
syn region shHereDoc matchgroup=shHereDoc01 start="<<\s*\z([^ \t|>]\+\)"		matchgroup=shHereDoc01 end="^\z1$"	contains=@shDblQuoteList
VIM

# shHereDoc02 | quote: None | indent: Yes | bs_before_marker: No | bs_newline: No
cat <<- VIM
syn region shHereDoc matchgroup=shHereDoc02 start="<<-\s*\z([^ \t|>]\+\)"		matchgroup=shHereDoc02 end="^\t*\z1$"	contains=@shDblQuoteList
	VIM

# shHereDoc03 | quote: None | indent: No | bs_before_marker: Yes | bs_newline: No
cat << \VIM
syn region shHereDoc matchgroup=shHereDoc03 start="<<\s*\\\z([^ \t|>]\+\)"		matchgroup=shHereDoc03 end="^\z1$"
VIM

# shHereDoc04 | quote: None | indent: Yes | bs_before_marker: Yes | bs_newline: No
cat <<- \VIM
syn region shHereDoc matchgroup=shHereDoc04 start="<<-\s*\\\z([^ \t|>]\+\)"		matchgroup=shHereDoc04 end="^\t*\z1$"
	VIM

# shHereDoc05 | quote: Single | indent: No | bs_before_marker: No | bs_newline: No
cat << 'VIM'
syn region shHereDoc matchgroup=shHereDoc05 start="<<\s*'\z([^']\+\)'"		matchgroup=shHereDoc05 end="^\z1$"
VIM

# shHereDoc06 | quote: Single | indent: Yes | bs_before_marker: No | bs_newline: No
cat <<- 'VIM'
syn region shHereDoc matchgroup=shHereDoc06 start="<<-\s*'\z([^']\+\)'"		matchgroup=shHereDoc06 end="^\t*\z1$"
	VIM

# shHereDoc07 | quote: Double | indent: No | bs_before_marker: No | bs_newline: No
cat << "VIM"
syn region shHereDoc matchgroup=shHereDoc07 start="<<\s*\"\z([^"]\+\)\""		matchgroup=shHereDoc07 end="^\z1$"
VIM

# shHereDoc08 | quote: Double | indent: Yes | bs_before_marker: No | bs_newline: No
cat <<- "VIM"
syn region shHereDoc matchgroup=shHereDoc08 start="<<-\s*\"\z([^"]\+\)\""		matchgroup=shHereDoc08 end="^\t*\z1$"
	VIM

# shHereDoc09 | quote: None | indent: No | bs_before_marker: No | bs_newline: Yes
cat << \
VIM
syn region shHereDoc matchgroup=shHereDoc09 start="<<\s*\\\_$\_s*\z([^ \t|>]\+\)"		matchgroup=shHereDoc09 end="^\z1$"	contains=@shDblQuoteList
VIM

# shHereDoc10 | quote: None | indent: Yes | bs_before_marker: No | bs_newline: Yes
cat <<- \
VIM
syn region shHereDoc matchgroup=shHereDoc10 start="<<-\s*\\\_$\_s*\z([^ \t|>]\+\)"	matchgroup=shHereDoc10 end="^\t*\z1$"	contains=@shDblQuoteList
	VIM


# shHereDoc11 | quote: None | indent: No | bs_before_marker: Yes | bs_newline: Yes
cat << \
\VIM
syn region shHereDoc matchgroup=shHereDoc11 start="<<\s*\\\_$\_s*\\\z([^ \t|>]\+\)"	matchgroup=shHereDoc11 end="^\z1$"
VIM

# shHereDoc12 | quote: None | indent: Yes | bs_before_marker: Yes | bs_newline: Yes
cat <<- \
\VIM
syn region shHereDoc matchgroup=shHereDoc12 start="<<-\s*\\\_$\_s*\\\z([^ \t|>]\+\)"	matchgroup=shHereDoc12 end="^\t*\z1$"
	VIM

# shHereDoc13 | quote: Single | indent: No | bs_before_marker: No | bs_newline: Yes
cat << \
'VIM'
syn region shHereDoc matchgroup=shHereDoc13 start="<<\s*\\\_$\_s*'\z([^']\+\)'"		matchgroup=shHereDoc13 end="^\z1$"
VIM

# shHereDoc14 | quote: Single | indent: Yes | bs_before_marker: No | bs_newline: Yes
cat <<- \
'VIM'
syn region shHereDoc matchgroup=shHereDoc14 start="<<-\s*\\\_$\_s*'\z([^']\+\)'"		matchgroup=shHereDoc14 end="^\t*\z1$"
	VIM

# shHereDoc15 | quote: Double | indent: No | bs_before_marker: No | bs_newline: Yes
cat << \
"VIM"
syn region shHereDoc matchgroup=shHereDoc15 start="<<\s*\\\_$\_s*\"\z([^"]\+\)\""		matchgroup=shHereDoc15 end="^\z1$"
VIM

# shHereDoc16 | quote: Double | indent: Yes | bs_before_marker: No | bs_newline: Yes
cat <<- \
"VIM"
syn region shHereDoc matchgroup=shHereDoc16 start="<<-\s*\\\_$\_s*\"\z([^"]\+\)\""	matchgroup=shHereDoc16 end="^\t*\z1$"
	VIM

# vim: ts=16:fdm=marker
