# Dotfiles

Personal configuration files for Omarchy Linux (Arch + Hyprland).

## What's Included

- **hypr/** - Hyprland window manager configuration
  - Turkish keyboard layout (tr)
  - Custom keybindings for productivity apps
  - Night light (hyprsunset) configured for Ankara timezone
  - Floating terminal support
- **nvim/** - Neovim configuration (LazyVim)
  - Turkish keyboard optimizations
  - Plugins: copilot-chat, trouble, todo-comments, harpoon, undotree
  - Tmux navigation integration
- **tmux/** - Tmux terminal multiplexer configuration
  - Leader key: Ctrl+s
  - Catppuccin Mocha theme
  - Turkish keyboard split bindings
  - Vi copy mode
- **fish/** - Fish shell configuration
  - Starship prompt integration
  - Go path setup (GOPATH)
  - Custom functions and abbreviations

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/satas20/dotfiles.git ~/dotfiles
   ```

2. Use GNU Stow to symlink configs:
   ```bash
   cd ~/dotfiles
   stow hypr
   stow nvim
   stow tmux
   stow fish
   ```

3. Install tmux plugins (inside tmux):
   ```
   Ctrl+s then Shift+I
   ```

4. Open Neovim to auto-install plugins:
   ```bash
   nvim
   ```

## Notes

- **Turkish Keyboard**: Custom keybindings optimized for Turkish layout
- **Night Light**: Configured for Ankara (7 AM daylight, 7 PM warm)
- **Floating Terminal**: Super+Shift+Return for quick terminal access
- **Tmux Leader**: Changed from default Ctrl+b to Ctrl+s

## For Developers

See [AGENTS.md](AGENTS.md) for:
- Code style guidelines and formatting rules
- Manual validation commands for each config
- Git commit conventions
- Common tasks and troubleshooting

## System Info

- OS: Omarchy Linux (Arch-based)
- WM: Hyprland
- Terminal: Kitty
- Shell: Fish
- Editor: Neovim (LazyVim)
