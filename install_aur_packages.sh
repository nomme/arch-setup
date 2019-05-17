#!/bin/bash

function error()
{
  echo "Error: $@" >&2
  exit -1
}

pushd "$HOME/tmp/aur" >/dev/null

[ -d $HOME/tmp/aur/auracle-git ] || error "No auracle-git dir found"

pushd $HOME/tmp/aur/auracle-git
makepkg --syncdeps --install --needed
popd

aur_packages="cntlm
android-apktool
android-sdk-build-tools
android-studio
plantuml
pidgin-sipe"
#timeshift/snapper
#ttf-ms-fonts

for package in $aur_packages;
do
    auracle -r download "$package" || { echo "failed $package" ; continue; }
    pushd "$package" >/dev/null
    makepkg --syncdeps --install --needed
    popd >/dev/null
done

popd

echo ""
echo ""
echo "Remember!"
echo "Configure and enable cntlm!"
echo ""
