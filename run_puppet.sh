#!/bin/bash
#set -x

function error()
{
  echo "error: $@" >&2
  echo "Usage: $(basename $0) [-p] <manifest file>" >&2
  echo "       -p      pretend"
  exit 1
}

repo_path=$(dirname "$(readlink -e "$0")")
modules_path="$repo_path/modules"

while getopts "p" opt ; do
  case $opt in
    p)
      noop="--noop"
      ;;
    \?)
      error "invalid option"
      ;;
  esac
done

shift $((OPTIND - 1))
manifest="$repo_path/manifests/dawn.pp"
sudo_manifest="$repo_path/manifests/sudo_dawn.pp"
[ $# -eq 1 ] && { manifest="$1"; sudo_manifest="$(dirname $manifest)/sudo_$(basename $manifest)"; }
[ -f $manifest ] || error "could not find manifest $manifest"

echo "Running puppet with $manifest"
puppet apply -v --modulepath=$modules_path $noop $manifest || error "puppet error"

echo ""
[ -f $sudo_manifest ] || { echo "No $sudo_manifest file"; exit 0; }

echo "Sudo running puppet with $sudo_manifest"
sudo puppet apply -v --modulepath=$modules_path $noop $sudo_manifest

