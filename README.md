# 🏠 Personal dotty-files

A carefully curated collection of configuration files for my Linux desktop environment, focused on productivity and aesthetics.

## 🌟 Features

- **Hyprland**: A dynamic tiling Wayland compositor configuration
- **Waybar**: A highly customizable status bar
- **Neovim**: Modern text editor setup with custom plugins and keybindings
- **Kitty**: Fast, feature-rich terminal emulator
- **btop**: Resource monitor with detailed system statistics
- **fastfetch**: System information display
- **lazygit**: Terminal UI for Git operations
- **wlogout**: Stylish logout screen

## 📁 Repository Structure

```
.
├── hypr/
│   ├── hyprland.conf
│   └── themes/
├── waybar/
│   ├── config
│   └── style.css
├── nvim/
│   ├── init.lua
│   └── lua/
├── kitty/
│   └── kitty.conf
├── btop/
│   └── btop.conf
├── fastfetch/
│   └── config.conf
├── lazygit/
│   └── config.yml
└── wlogout/
    ├── layout
    └── style.css
```

## 🚀 Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Web-Dev-Codi/dotty-files.git ~/.dotty-files
   ```

2. Install required dependencies:

   ```bash
   # Arch Linux / Manjaro
   sudo pacman -S hyprland waybar neovim kitty btop fastfetch lazygit wlogout

   # Ubuntu / Debian
   sudo apt install neovim kitty btop fastfetch
   # Note: Some packages might need to be installed from source or other repositories
   ```

3. Create symbolic links:

   ```bash
   # Create necessary directories
   mkdir -p ~/.config

   # Link configurations
   ln -s ~/.dotty-files/hypr ~/.config/hypr
   ln -s ~/.dotty-files/waybar ~/.config/waybar
   ln -s ~/.dotty-files/nvim ~/.config/nvim
   ln -s ~/.dotty-files/kitty ~/.config/kitty
   ln -s ~/.dotty-files/btop ~/.config/btop
   ln -s ~/.dotty-files/fastfetch ~/.config/fastfetch
   ln -s ~/.dotty-files/lazygit ~/.config/lazygit
   ln -s ~/.dotty-files/wlogout ~/.config/wlogout
   ```

## ⚙️ Configuration Details

### Hyprland

- Dynamic tiling configuration
- Custom keybindings for window management
- Multi-monitor support
- Workspace rules and window rules

### Waybar

- System monitoring modules
- Custom styling with CSS
- Workspace indicators
- Network, battery, and system tray integration

### Neovim

- Modern IDE-like features
- Custom keymaps and plugins
- LSP configuration
- Treesitter integration

### Kitty Terminal

- GPU-accelerated rendering
- Custom color scheme
- Split panes and layouts
- Session management

### Additional Tools

- **btop**: Customized resource monitoring
- **fastfetch**: Styled system information display
- **lazygit**: Efficient Git workflow
- **wlogout**: Themed logout interface

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Thanks to the Hyprland, Neovim, and other project maintainers
- Special thanks to the Linux ricing community for inspiration
- Credit to various theme creators and plugin developers

## 📞 Contact

For questions or suggestions, feel free to:

- Reach out on Web-Dev-Codi: www.webdevcodi.com
- Send an email: webdevcodi@gmail.com
