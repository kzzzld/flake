{
  config,
  pkgs,
  inputs,
  ...
}: let
  waybar-git = pkgs.waybar.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/Alexays/Waybar";
      ref = "master";
      rev = "6d60c8e02be67bb85bb9b1ea803f2fbcf0722002";
    };
    mesonFlags = (old.mesonFlags or []) ++ [ "-Dwwan=disabled" "-Dcava=disabled" ];
  });
in {
  home = {
    username = "kzzzl";
    homeDirectory = "/home/kzzzl";
    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    # desktop utilities
    i3blocks
    waybar-git
    rofi
    grim
    wl-clipboard
    swaybg
    slurp
    playerctl

    # other utilities
    thunar
    thunar-volman
    udiskie
    zip
    unzip
    nix-search-cli

    # media
    mpv
    obs-studio

    # terminal & shell
    foot
    fastfetch
    tmux
    tmuxinator
    eza
    starship
    zoxide
    git
    lazygit

    # programming
    neovim
    emacs-pgtk
    nodejs
    cargo
    stylua
    gcc
    cmake
    gnumake
    libtool
    tree-sitter

    # internet
    librewolf
    chromium
    gajim
    vesktop
    signal-desktop
    thunderbird

    # games
    xonotic
    ddnet

    # office
    libreoffice-stable

    # fonts
    nerd-fonts.jetbrains-mono
  ];

  xresources.properties = {
    "Xcursor.size" = 24;
    "Xcursor.theme" = "catppuccin-mocha-blue-cursors";
  };

  home.pointerCursor = {
    name = "catppuccin-mocha-blue-cursors";
    package = pkgs.catppuccin-cursors.mochaBlue;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
    };

    cursorTheme = {
      name = "catppuccin-mocha-blue-cursors";
      package = pkgs.catppuccin-cursors.mochaBlue;
    };
  };

  home.file."Wallpapers".source = ./config/walls;
  # home.file.".config/i3".source = ./config/i3;
  # home.file.".config/i3status".source = ./config/i3status;
  home.file.".config/i3blocks".source = ./config/i3blocks;
  # home.file.".config/alacritty".source = ./config/alacritty;
  home.file.".config/foot".source = ./config/foot;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/sway".source = ./config/sway;
  home.file.".config/mango".source = ./config/mango;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/swaylock".source = ./config/swaylock;
  home.file.".gitconfig".source = ./config/git/gitconfig;
  # home.file.".xinitrc".source = ./config/xorg/xinitrc;
  home.file.".config/nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
  home.file.".emacs.d" = {
    source = ./config/emacs;
    recursive = true;
  };
  home.file.".zshrc".source = ./config/zsh/zshrc;
}
