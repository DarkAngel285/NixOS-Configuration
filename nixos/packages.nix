{
  pkgs,
  flavor,
  accent,
  cursor-flavor,
  cursor-accent,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    kitty
    # CLI utils
    bash
    zsh
    nix-index
    ntfs3g
    doas-sudo-shim
    killall
    openssh
    openssl
    wget
    git
    zapret
    # Sound
    pipewire
    wireplumber
    alsa-lib
    alsa-utils
    pamixer
    bluez
    bluez5
    bluez-tools
    # GPU stuff
    amdvlk
    mesa
    # Other
    home-manager
    adwaita-icon-theme
    vimix-cursors
    (catppuccin-cursors.override {
      flavor = cursor-flavor;
      accent = cursor-accent;
    })
    (catppuccin-papirus-folders.override {
      inherit flavor accent;
    })
  ];

  fonts.packages = with pkgs; [
    iosevka
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
  ];
}
