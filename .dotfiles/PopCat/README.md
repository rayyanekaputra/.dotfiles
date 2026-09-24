# PopCat Cursor 🐱

A meme cursor theme for Linux (X11 + Wayland) — Pop Cat, tuxedo cat, spinner
cat and friends. Fully hand-made: the Xcursor binaries are packed by a custom
pure-Python packer (no `xcursorgen`).

![preview](preview.png)

## Cursors

| State | Cursor |
|---|---|
| Normal (`left_ptr`) | Popcat, closed mouth |
| Link hover (`pointer`) | Popcat, open mouth |
| Text selection (`xterm`) | Tuxedo cat drinking a latte |
| Loading (`wait`) | Orange cat + spinning loader (12 frames @ 90 ms) |
| Help (`help`) | Confused cat with floating `?` |
| Resize (28 names) | Popcat + direction chevrons |
| All-scroll | Popcat + 4 chevrons |

Ships 3 sizes (24/32/48) for HiDPI scaling. Cursors not included in the theme
fall back to `Adwaita → Breeze` via `Inherits`.

## Install

### GNOME (Wayland/X11)
```bash
bash install.sh
# or manually (dir name must match the theme name):
mkdir -p ~/.icons
cp -r themes/PopCat ~/.icons/
gsettings set org.gnome.desktop.interface cursor-theme 'PopCat'
```

### KDE Plasma
Copy `themes/PopCat` to `~/.icons/PopCat`, then pick `PopCat` in
*System Settings → Appearance → Cursors*, or:
```bash
plasma-apply-cursortheme -a PopCat
```

### XFCE / Cinnamon / MATE
Copy to `~/.icons/`, select `PopCat` in cursor settings.

### Window managers (i3, Hyprland, sway…)
Set `XCURSOR_THEME=PopCat` in your environment.

> Some running apps may need a restart (or re-login) to pick up the new cursor.

## Uninstall

```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
rm -rf ~/.icons/PopCat
```

## Build from source

```bash
./build.sh
```

- `src/cursors.conf` — build config (`@cursor` sections, one line per chunk:
  `size xhot yhot png [delay_ms]`)
- `src/pack.py` — pure-Python Xcursor writer → `themes/PopCat/cursors/`
- `out/` — per-size PNGs (24/32/48) used as packer input
- `src/artgen/` — one-off image-processing scripts (bg removal, spinner frames)
- `dist/PopCat-Cursors.tar.xz` — release tarball (gnome-look layout)

See [CHANGELOG.md](CHANGELOG.md) and [README.vi.md](README.vi.md) (tiếng Việt).

## License

MIT for the code — see [LICENSE](LICENSE). The bundled artwork is based on
internet meme images and belongs to their respective creators; provided for
personal, non-commercial use.
