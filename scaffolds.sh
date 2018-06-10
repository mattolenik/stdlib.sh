scaffold_bash_strict() {
  # shellcheck disable=SC1117
  cat <<'EOF' > "$1"
#!/usr/bin/env bash
# http://tiny.cc/bash-strict-mode
set -euo pipefail
IFS=$'\t\n'
[[ -n ${DEBUG:-} ]] && set -x

main() {
  echo Hello "$@"
}

main "$@"
EOF
  chmod +x "$1"
}
