#!/bin/sh

# From https://github.com/Homebrew/install/blob/master/install.sh
abort() {
  printf "%s\n" "$@"
  exit 1
}

# string formatters
if [ -t 1 ]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_blue="$(tty_mkbold 34)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$1"
}

# End from https://github.com/Homebrew/install/blob/master/install.sh

download() {
  if command -v curl > /dev/null 2>&1; then
    curl -fsSL "$1"
  else
    wget -qO- "$1"
  fi
}

is_glibc_compatible() {
  getconf GNU_LIBC_VERSION >/dev/null 2>&1 || ldd --version >/dev/null 2>&1 || return 1
}

detect_platform() {
  local platform
  platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

  case "${platform}" in
    linux)
      if is_glibc_compatible; then
        platform="linux"
      else
        platform="linuxstatic"
      fi
      ;;
    darwin) platform="macos" ;;
    windows) platform="win" ;;
    mingw*) platform="win" ;;
  esac

  printf '%s' "${platform}"
}

detect_arch() {
  local arch
  arch="$(uname -m | tr '[:upper:]' '[:lower:]')"

  case "${arch}" in
    x86_64 | amd64) arch="x64" ;;
    armv*) arch="arm" ;;
    arm64 | aarch64) arch="arm64" ;;
  esac

  # `uname -m` in some cases mis-reports 32-bit OS as 64-bit, so double check
  if [ "${arch}" = "x64" ] && [ "$(getconf LONG_BIT)" -eq 32 ]; then
    arch=i686
  elif [ "${arch}" = "arm64" ] && [ "$(getconf LONG_BIT)" -eq 32 ]; then
    arch=arm
  fi

  case "$arch" in
    x64*) ;;
    arm64*) ;;
    *) return 1
  esac
  printf '%s' "${arch}"
}

download_and_install() {
  local platform arch version_json version archive_url tmp_dir
  platform="$(detect_platform)"

  # pnpmTagVersion="latest"
  pnpmTagVersion="next-8"

    npmRegistry="https://registry.npmjs.org"
  # npmRegistry="https://registry.npmmirror.com"
  # npmRegistry="https://mirrors.cloud.tencent.com/npm"
  # npmRegistry="https://mirrors.huaweicloud.com/repository/npm"

  # githubDownloadProxy="https://github.com"
  # githubDownloadProxy="https://ghfast.top/https://github.com"
  githubDownloadProxy="https://ghproxy.net/https://github.com"

  arch="$(detect_arch)" || abort "Sorry! pnpm currently only provides pre-built binaries for x86_64/arm64 architectures."
  if [ -z "${PNPM_VERSION}" ]; then
    version_json="$(download "$npmRegistry/@pnpm/exe")" || abort "Download Error!"
    version="$(echo "$version_json" | grep -o '"latest":[[:space:]]*"[0-9.]*"' | grep -o '[0-9.]*')"
  elif [ -n $pnpmTagVersion ]; then
    version_json="$(download "$npmRegistry/@pnpm/exe")" || abort "Download Error!"
    matchString="\"$pnpmTagVersion\":[[:space:]]*\"[0-9.]*\""
    version="$(echo "$version_json" | grep -o $matchString | grep -o '"[0-9.]*' | grep -o '[0-9.]*')"
  else
    version="${PNPM_VERSION}"
  fi

  archive_url="$githubDownloadProxy/pnpm/pnpm/releases/download/v${version}/pnpm-${platform}-${arch}"
  if [ "${platform}" = "win" ]; then
    archive_url="${archive_url}.exe"
  fi
  printf "Downloading pnpm from %s\n" "${archive_url}"

  # install to PNPM_HOME, defaulting to ~/.pnpm
  tmp_dir="$(mktemp -d)" || abort "Tmpdir Error!"
  trap 'rm -rf "$tmp_dir"' EXIT INT TERM HUP

  ohai "Downloading pnpm binaries ${version}"
  # download the binary to the specified directory
  download "$archive_url" > "$tmp_dir/pnpm"  || return 1
  chmod +x "$tmp_dir/pnpm"
  SHELL="$SHELL" "$tmp_dir/pnpm" setup --force || return 1
}

download_and_install || abort "Install Error!"
