# hyprlock-netlogin-themes

Hyprlock lock screen configuration based on **EnviiLock** by [Kaushallrai](https://github.com/Kaushallrai/hyprlock).

## Differences from stock EnviiLock

| Aspect | Original EnviiLock | This adaptation |
|---|---|---|
| Background | `screenshot` (blurred screen cap) | Static `too_close.jpg` — no blur |
| Font | SF Pro Display / Metropolis / Stange | Iosevka |
| Shell | `/bin/zsh` | `/bin/bash` (zsh not required) |
| Invalid options | `grace`, `disable_loading_bar`, `fade_timeout`, `fail_timeout`, etc. | Removed — only valid hyprlock options |
| Music progress bar | Hardcoded to Spotify | Auto-detects any active player |
| Music progress/time | Single line | Progress bar + time on separate lines |
| Spaced characters | `A u g u s t` style letter spacing | Normal text |
| Corner rounding | Rounded input field (`rounding = 25`) | Square (`rounding = 0`) |
| Text opacity | Mixed (0.4 – 0.9) | Full opacity (1.0) throughout |
| Avatar path | `/var/lib/AccountsService/icons/$USER` | Local `assets/avatar.png` |
| Side info | Username/hostname/uptime/battery | Removed — clean center layout |
| Paths | Absolute | Relative (`./assets/`, `./scripts/`) |

## Files

```
├── hyprlock.conf          # Main config (relative paths)
├── lock.sh                # Launch helper (cd + hyprlock -c)
├── assets/
│   ├── too_close.jpg      # Background
│   └── avatar.png         # User avatar
├── scripts/
│   ├── music-progress.sh  # Player progress bar
│   └── music-time.sh      # Player elapsed / total time
├── hyprlock-netlogin-red/ # Original SDDM NetLogin (red variant)
├── hyprlock-netlogin-blue/# Original SDDM NetLogin (blue variant)
└── Makefile               # Install targets for SDDM variants
```

## Usage

```bash
# From project directory:
cd ~/Projects/hyprlock-netlogin-themes
hyprlock -c hyprlock.conf

# Or from anywhere:
~/Projects/hyprlock-netlogin-themes/lock.sh
```

Requires: `hyprlock`, `playerctl` (for music display), `Iosevka` font.

## Requirements

- hyprlock (≥ 0.9.5)
- playerctl (for music progress/title)
- Iosevka font

## Credits

- **EnviiLock** by [Kaushallrai](https://github.com/Kaushallrai/hyprlock) — base config
- **NetLogin SDDM themes** by [SethDigerati](https://github.com/SethDigerati) — original SDDM variants (in `hyprlock-netlogin-red/` and `hyprlock-netlogin-blue/`)
