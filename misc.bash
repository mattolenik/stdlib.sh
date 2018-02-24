# bash specific features

# Verify version of running bash shell, exit if required version is not met.
# 1: major and minor version, as one number, e.g. 42, 43, 44
# 2: status code to exit with, default 1
vercheck() {
  local min_ver="$1"
  local major=${min_ver:0:1}
  local minor=${min_ver:1:2}
  local status="${2:-1}"
  ver=$(echo "$BASH_VERSION" | awk -F '.' '{print $1$2}')
  (( ver >= min_ver )) || printf "bash version >= %d.%d required" "$major" "$minor" >&2 && exit "$status"
}
