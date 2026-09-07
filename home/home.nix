{ config, pkgs, ...}: {
  home = {
    username = "kzzzl";
    homeDirectory = "/home/kzzzl";
    stateVersion = "26.05";
  };

  home.packages = with pkgs; [
    i3status
      alacritty
      vim
      librewolf
      chromium
      picom
      feh
      rofi
      git
      lazygit
      fastfetch
      tmux
      tmuxinator
      eza
      starship
      zoxide
      gajim
      nix-search-cli
      maim
      xclip
      xdotool
      neovim
      zip
      unzip
      nodejs
      cargo
      stylua
      mpv
      grim
      wl-clipboard
      swaybg
      gcc
      tree-sitter
      slurp
      thunar
      nerd-fonts.jetbrains-mono
      ];

  xresources.properties = {
    "Xcursor.size" = 24;
    "Xcursor.theme" = "catppuccin-mocha-blue-cursors";
  };

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
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
  home.file.".config/i3".source = ./config/i3;
  home.file.".config/i3status".source = ./config/i3status;
  home.file.".config/alacritty".source = ./config/alacritty;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/sway".source = ./config/sway;
  home.file.".config/nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
  home.file.".zshrc".source = ./config/zsh/zshrc;
                      }
