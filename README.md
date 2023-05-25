# vim-sh-heredoc-highlighting
This vim plugin enables syntax highlighting for code snippets in shell (sh,
bash, ksh, etc.) here-docs.

It will highlight code snippets when it sees heredocs delimited by markers
named after the corresponding language, e.g.:

```sh
python <<PYTHON
import sys
print(sys.path)
PYTHON
```

The languages enabled by default are:

- GNUPLOT
- JSON
- LUA
- PERL
- PYTHON
- SHELL

To configure additional languages, put a dictionary mapping markers to syntax
names in the variable `g:heredocs`: e.g.

```vim
" in your vimrc
let g:heredocs = {"SQL": "sql"}
```

would highlight heredocs delimited by `SQL` using `syntax/sql.vim`.
