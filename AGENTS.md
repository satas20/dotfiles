# AGENTS.md - Guide for AI Coding Agents

This document provides essential information for AI coding agents working with this dotfiles repository.

## Repository Overview

Personal dotfiles for **Omarchy Linux** (Arch + Hyprland), managed with **GNU Stow** for symlink management.

**Tech Stack:**
- **OS:** Omarchy Linux (Arch-based)
- **WM:** Hyprland (Wayland compositor)
- **Terminal:** Kitty
- **Shell:** Fish
- **Editor:** Neovim (LazyVim)
- **Multiplexer:** Tmux

**Target User:** Turkish keyboard layout (tr) user in Ankara timezone.

## Repository Structure

```
dotfiles/
├── fish/           # Fish shell configuration
├── hypr/           # Hyprland window manager configuration
├── nvim/           # Neovim configuration (LazyVim-based)
├── tmux/           # Tmux terminal multiplexer configuration
├── README.md       # User-facing documentation
├── AGENTS.md       # This file (for AI agents)
├── .gitignore      # Git ignore patterns
└── .stow-local-ignore  # Stow ignore patterns
```

Each directory follows GNU Stow convention: `<package>/.config/<app>/` structure.

## Build, Test, and Lint Commands

### No Automated Testing
This is a dotfiles repository with **no build system, test suite, or CI/CD**. Validation is manual.

### Manual Validation

**Test Configuration Syntax:**
```bash
# Hyprland - check for syntax errors
hyprctl reload

# Neovim - launch and check for errors
nvim --headless +qa
nvim  # Then run :checkhealth

# Tmux - validate config
tmux source ~/.tmux.conf

# Fish - validate syntax
fish -n ~/.config/fish/config.fish
```

**Apply Changes:**
```bash
# After editing configs in ~/dotfiles/<package>/
cd ~/dotfiles
stow <package>  # Creates symlinks to ~/.config/

# Specific examples:
stow hypr    # Links hypr configs
stow nvim    # Links neovim configs
stow tmux    # Links tmux configs
stow fish    # Links fish configs
```

**Reload Services:**
```bash
# Hyprland - auto-reloads on save (or force with hyprctl reload)
# Waybar - MUST restart: omarchy-restart-waybar
# Neovim - reopen or :source $MYVIMRC
# Tmux - Ctrl+s then r (bound to source-file)
# Fish - restart shell or: source ~/.config/fish/config.fish
```

### Code Style Guidelines

#### General Principles

1. **Turkish Keyboard Optimizations:** All keybindings must consider Turkish (tr) layout
2. **Modular Structure:** Split configs into logical files (don't create monolithic configs)
3. **Comments:** Use descriptive comments for non-obvious configurations
4. **Consistency:** Follow existing patterns in each config type

#### Lua (Neovim)

**Formatting (stylua):**
```toml
indent_type = "Spaces"
indent_width = 2
column_width = 120
```

**Code Style:**
```lua
-- Use double quotes for strings
local example = "like this"

-- Trailing commas in tables
local config = {
  option1 = true,
  option2 = false,
}

-- Descriptive comments above complex logic
-- Use numbered sections for organization:
-- 1. Bootstrap lazy.nvim
-- 2. Load configurations

-- Function definitions with clear names
local function setup_keymaps()
  -- Implementation
end
```

**Neovim Plugin Patterns:**
```lua
-- Each plugin in separate file under lua/plugins/
return {
  "author/plugin-name",
  dependencies = { "other/plugin" },
  keys = {
    { "<leader>x", "<cmd>Command<cr>", desc = "Description" },
  },
  opts = {
    -- Plugin configuration
  },
}
```

**Imports:**
- Use `require()` for Lua modules
- Lazy loading preferred with `keys`, `cmd`, `ft`, `event`
- Group related plugin files logically

**Naming:**
- Files: `kebab-case.lua` (e.g., `todo-comments.lua`)
- Variables: `snake_case` (e.g., `local my_var`)
- Functions: `snake_case` (e.g., `function setup_config()`)

#### Hyprland Configuration

**File Organization:**
- `hyprland.conf` - Main entry with `source` directives
- Split into logical files: `input.conf`, `bindings.conf`, `looknfeel.conf`, etc.

**Comment Style:**
```conf
# Section headers with descriptive text
# Use full sentences for complex rules

# Floating terminal window rules
windowrule = float 1, match:class ^(floating_terminal)$
```

**Syntax (v0.53.2+):**
```conf
# Window rules use 'windowrule' (NOT windowrulev2 - deprecated)
windowrule = RULE VALUE, match:CRITERIA PATTERN

# Examples:
windowrule = float 1, match:class ^(app)$
windowrule = size 750 500, match:class ^(app)$
windowrule = center 1, match:class ^(app)$, match:title ^(Title)$

# Boolean flags require explicit values (1 or 0)
# Use snake_case for multi-word rules: stay_focused, no_blur, keep_aspect_ratio
```

**Critical Rules:**
- Always use `match:` prefix for criteria (class, title, etc.)
- Boolean values must be explicit: `float 1` not just `float`
- Check Hyprland wiki for latest syntax: https://wiki.hyprland.org/Configuring/Window-Rules/

#### Fish Shell

**Style:**
```fish
# Functions with clear names
function my_function
    # 4-space indent
    echo "Implementation"
end

# Abbreviations for common commands
abbr -a shortcut 'full command here'

# Environment variables with -gx (global export)
set -gx VARIABLE value
```

#### Tmux

**Style:**
```conf
# ASCII art section dividers
# ╔════════════════════════════════════════╗
# ║          Section Name                  ║
# ╚════════════════════════════════════════╝

# Clear comments for custom bindings
bind key command # Description
```

### Git Commit Conventions

**Preferred Format:** Conventional Commits (but not strictly enforced)

```
type: short description

Longer description if needed (optional)
```

**Types:**
- `feat:` - New features
- `fix:` - Bug fixes
- `add:` - Adding new files/configs
- `update:` - General updates
- `refactor:` - Code restructuring
- `docs:` - Documentation only

**Guidelines:**
- Use lowercase for type
- No scope required (e.g., `feat(nvim):` is okay but `feat:` is fine)
- First line < 72 characters
- Be descriptive but concise
- Multi-line commits for complex changes

**Examples:**
```
feat: enable relative numbers and install lang extras

fix: update window rules to Hyprland 0.53.2+ syntax

add: Fish shell configuration with Starship and Go setup
```

### Error Handling

**Config Files:**
- Test changes before committing
- Keep backups when making breaking changes
- Document workarounds for known issues
- Use `omarchy-refresh-<app>` to reset to defaults if needed

**Never:**
- Commit broken configurations
- Remove comments without understanding them
- Change Turkish keyboard mappings without user approval
- Push to remote (user handles `git push` manually)

### Important Constraints

1. **Never `git push`** - User handles all remote operations
2. **Respect Turkish keyboard** - Don't override `ö`, `ç`, `ğ`, `ü` mappings
3. **Test Hyprland changes** - Window manager errors are disruptive
4. **Preserve Omarchy integration** - Don't override `omarchy-*` commands
5. **Check Hyprland wiki** - Window rule syntax changes frequently

### Common Tasks for Agents

**Adding a new Neovim plugin:**
1. Create `lua/plugins/<plugin-name>.lua`
2. Return plugin spec with lazy loading
3. Test with `:Lazy` in Neovim
4. Commit with `feat: add <plugin> for <purpose>`

**Adding Hyprland keybinding:**
1. Check existing bindings in `bindings.conf`
2. Add `unbind` if key already used
3. Add new `bind` with comment
4. Test with `hyprctl reload`
5. Commit with `feat: add keybinding for <action>`

**Modifying window rules:**
1. **ALWAYS** check latest Hyprland wiki syntax first
2. Use `windowrule` (not windowrulev2)
3. Use `match:` prefix and explicit boolean values
4. Test by opening the target application
5. Commit with `fix:` or `feat:` prefix

### Resources

- Main README: `~/dotfiles/README.md`
- Hyprland Wiki: https://wiki.hyprland.org/
- LazyVim Docs: https://www.lazyvim.org/
- Omarchy Docs: https://omarchy.org/
