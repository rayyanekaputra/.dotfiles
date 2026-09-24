# PopCat Cursor 🐱 (bản tiếng Việt)

Bộ cursor meme cho Linux (X11 + Wayland) — Pop Cat, mèo tuxedo, mèo spinner.
Làm hoàn toàn thủ công: file Xcursor nhị phân được đóng gói bằng Python packer
tự viết (không dùng `xcursorgen`).

![preview](preview.png)

## Danh sách cursor

| Trạng thái | Hình |
|---|---|
| Bình thường (`left_ptr`) | Popcat đóng miệng |
| Hover link (`pointer`) | Popcat mở miệng |
| Chọn text (`xterm`) | Mèo tuxedo uống latte |
| Loading (`wait`) | Mèo cam + spinner quay (12 frame @ 90 ms) |
| Help (`help`) | Mèo hoang mang + dấu `?` |
| Resize (28 tên) | Popcat + chevron chỉ hướng |
| All-scroll | Popcat + 4 chevron |

Kèm 3 size (24/32/48) cho HiDPI scaling. Cursor không có trong theme sẽ
fallback về `Adwaita → Breeze` qua `Inherits`.

## Cài đặt

### GNOME (Wayland/X11)
```bash
bash install.sh
# hoặc thủ công (tên thư mục phải trùng tên theme):
mkdir -p ~/.icons
cp -r themes/PopCat ~/.icons/
gsettings set org.gnome.desktop.interface cursor-theme 'PopCat'
```

### KDE Plasma
Copy `themes/PopCat` vào `~/.icons/PopCat`, rồi chọn `PopCat` trong
*System Settings → Appearance → Cursors*, hoặc:
```bash
plasma-apply-cursortheme -a PopCat
```

### XFCE / Cinnamon / MATE
Copy vào `~/.icons/`, chọn `PopCat` trong phần cài đặt cursor.

### Window manager (i3, Hyprland, sway…)
Set `XCURSOR_THEME=PopCat` trong environment.

> Một số app đang mở có thể cần restart (hoặc logout/login) mới nhận cursor mới.

## Gỡ / Revert

```bash
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
rm -rf ~/.icons/PopCat
```

## Build từ nguồn

```bash
./build.sh
```

- `src/cursors.conf` — config build (section `@cursor`, mỗi dòng một chunk:
  `size xhot yhot png [delay_ms]`)
- `src/pack.py` — trình ghi Xcursor thuần Python → `themes/PopCat/cursors/`
- `out/` — PNG theo size (24/32/48) — input của packer
- `src/artgen/` — script xử lý ảnh one-off (tách nền, frame spinner)
- `dist/PopCat-Cursors.tar.xz` — gói phát hành (chuẩn gnome-look)

Xem [CHANGELOG.md](CHANGELOG.md) — bản tiếng Anh ở [README.md](README.md).

## License

MIT cho phần code — xem [LICENSE](LICENSE). Hình ảnh trong theme dựa trên
meme trên internet, thuộc về tác giả gốc; chỉ dùng cho mục đích cá nhân.
