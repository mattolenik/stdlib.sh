#!/bin/bash

##
# Color and style helpers
##
if [[ -t 1 ]]; then
  BLUE=$(tput setaf 4)
  YELLOW=$(tput setaf 3)
  CLR=$(tput sgr0)
  EM=$BLUE  # Block emphasis
  # Inline emphasis
  em() {
	echo "${YELLOW}$*${CLR}"
  }
else
  # Do not use color when the shell isn't interactive
  BLUE=
  YELLOW=
  CLR=
  # shellcheck disable=SC2034
  EM=
  em() { echo "$*"; }
fi
