#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# works both inside the release tarball (dir PopCat) and from the repo (themes/PopCat)
if [ -d "PopCat" ]; then
    SRC="PopCat"
else
    SRC="themes/PopCat"
fi

mkdir -p "$HOME/.icons"
rm -rf "$HOME/.icons/PopCat"
cp -r "$SRC" "$HOME/.icons/PopCat"
echo "Installed: $HOME/.icons/PopCat"

if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface cursor-theme 'PopCat'
    echo "GNOME: cursor theme set to PopCat (re-login if some apps keep the old cursor)"
else
    echo "Select 'PopCat' in your desktop's cursor settings (KDE: plasma-apply-cursortheme -a PopCat)."
fi
