command_exists ag || exitf 1 "This module requires the_silver_searcher"

# Search for files with a valid shebang matching the specified string, e.g.:
#   find_with_shebang sh
# Would match files starting with "#!/bin/sh" and "#!/usr/bin/env bash"
find_with_shebang() {
  # ag automatically respects patterns in .gitignore
  # Also ignore tpl files which may contain templatized shell that can't be linted
  ag --nocolor --ignore 'node_modules' --ignore '*.tpl' --ignore '.git' -l '^#!/.*'"$1" .
}

# Finds files matching one or more file extensions
find_with_extension() {
  # The regex that gets built here looks like: .*\.arg1|arg2|arg3$
  ag --nocolor --ignore 'node_modules' --ignore '.git' -l -g ".*\\.$(printf "%s" "$*" | sed 's/ /|/g')$" .
}
