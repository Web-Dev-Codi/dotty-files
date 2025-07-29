#!/bin/bash
echo "Checking WezTerm dependencies..."
echo "================================"

# Required dependencies
echo "REQUIRED DEPENDENCIES:"
for pkg in bash fontconfig gcc-libs glib2 glibc hicolor-icon-theme libssh2 libx11 libxcb libxkbcommon libxkbcommon-x11 openssl ttf-jetbrains-mono ttf-roboto wayland xcb-util xcb-util-image zlib; do
    echo -n "$pkg: "
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        echo "✓ INSTALLED"
    else
        echo "✗ NOT INSTALLED"
    fi
done

echo ""
echo "OPTIONAL DEPENDENCIES:"
for pkg in ncurses noto-fonts-emoji python-nautilus ttf-nerd-fonts-symbols-mono; do
    echo -n "$pkg: "
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        echo "✓ INSTALLED"
    else
        echo "✗ NOT INSTALLED"
    fi
done

echo ""
echo "BUILD DEPENDENCIES (only needed if compiling from source):"
for pkg in cargo cmake git pkgconf python; do
    echo -n "$pkg: "
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        echo "✓ INSTALLED"
    else
        echo "✗ NOT INSTALLED"
    fi
done