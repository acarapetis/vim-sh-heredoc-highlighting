# vim-sh-heredoc-highlighting
This vim plugin enables syntax highlighting for code snippets in shell (sh, bash, ksh, etc.) here-docs.

It will highlight shell, perl and python snippets when it sees heredocs
delimited by the markers SHELL, PERL or PYTHON respectively. You should be able
to extend this to whatever you want very easily by modifying
[`heredoc-sh.vim`](after/syntax/sh/heredoc-sh.vim) following the pattern that's apparent. I'd make it
configurable, but vimscript continues to elude me.

## Override / Extends the heredoc highlighting

```vim
" basically a dictionary with shape {[MARKER]: syntax} that merges with or overrides the existing g:heredocs_default
let g:heredocs = {"GRAPHQL": "graphql"}
```
