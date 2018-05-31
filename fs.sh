# Search for files with a valid shebang matching the specified string, e.g.:
#   find_with_shebang sh
# Would match files starting with "#!/bin/sh" and "#!/usr/bin/env bash"
find_with_shebang() {
  # ag automatically respects patterns in .gitignore
  # Also ignore tpl files which may contain templatized shell that can't be linted
  ag --ignore 'node_modules' --ignore '.git' -l '^#!/.*'"$1" .
}

find_with_extension() {
  ag --ignore 'node_modules' --ignore '.git' -l -G "$1" .
}
