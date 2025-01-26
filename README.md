# 🏠 Personal Dotfiles

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
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
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
   ln -s ~/.dotfiles/hypr ~/.config/hypr
   ln -s ~/.dotfiles/waybar ~/.config/waybar
   ln -s ~/.dotfiles/nvim ~/.config/nvim
   ln -s ~/.dotfiles/kitty ~/.config/kitty
   ln -s ~/.dotfiles/btop ~/.config/btop
   ln -s ~/.dotfiles/fastfetch ~/.config/fastfetch
   ln -s ~/.dotfiles/lazygit ~/.config/lazygit
   ln -s ~/.dotfiles/wlogout ~/.config/wlogout
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

## 🎨 Themes and Customization

The configurations use a consistent color scheme across all applications. To modify the theme:

1. Edit the color variables in `~/.dotfiles/hypr/themes/colors.conf`
2. Update Waybar colors in `~/.dotfiles/waybar/style.css`
3. Modify Kitty's color scheme in `~/.dotfiles/kitty/kitty.conf`
4. Adjust Neovim's colorscheme in `~/.dotfiles/nvim/lua/config/colorscheme.lua`

## 📝 Notes

- Backup your existing configurations before installing these dotfiles
- Some configurations might need adjustment based on your hardware
- Regular updates recommended to get the latest features and fixes

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for improvements. Please:

1. Follow the existing code style
2. Test your changes thoroughly
3. Update documentation as needed
4. Create meaningful commit messages

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Thanks to the Hyprland, Neovim, and other project maintainers
- Special thanks to the Linux ricing community for inspiration
- Credit to various theme creators and plugin developers

## 📞 Contact

For questions or suggestions, feel free to:
- Open an issue in this repository
- Reach out on Matrix: @yourusername:matrix.org
- Send an email: your.email@example.com
