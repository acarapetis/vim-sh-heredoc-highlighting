# Notes about how original handles various files

## heredocs-python-16-types

Recognizes 01-08 except 03 04 (`cat << \PYTHON`, `cat <<- \PYTHON`).

Doesn't recognize any of the 09-16, the ones with a backslash on the first line
and the marker on the next line.

## Marker association

- `should_not_match/unindented_start_with_indented_end.sh`: tab-indented end
  marker ends the heredoc but should not.

  To fix we need to split into two cases `start=+<<...+ end=+^...` and
  `start=+<<-...+ end=+\t*...`

- `should_not_match/spacs_at_end_indented.sh`: Heredoc starts with `<<-` but
  end marker is indented with spaces.

  To fix we have to use `\t` in the end marker expression.

- `should_not_match/stuff_before_end_marker.sh`: Here doc is ended by end marker
  even though it has random junk before it on the line.

  To fix we need to have `^` in the end marker expression.

## Inside other things

- `should_yes_match/inside_function.sh`:  It does match.  I expected it wouldn't
  but it does because of the `containedin=@sh,@shHereDocHL` specifically the
  `shHereDocHL` because if I remove just the `@sh` it still matches.

  This works but if we want to do like `sh.vim`, we should instead add
  `shHereDocHL` to the list of regions that `shFunctionList` can contain.

- `should_yes_match/inside_case.sh`:  It doesn't match.  It's highlighted as
  a normal heredoc.

  We need to add `shHereDoc` to the list of regions that `shCaseList` can
  contain.
