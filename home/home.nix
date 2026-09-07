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
    catppuccin-cursors.mochaBlue
    nerd-fonts.jetbrains-mono
  ];
  
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xcursor.theme" = "catppuccin-mocha-blue-cursors";
  };

  home.file."Wallpapers".source = ./config/walls;
  home.file.".config/i3".source = ./config/i3;
  home.file.".config/i3status".source = ./config/i3status;
  home.file.".config/alacritty".source = ./config/alacritty;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".zshrc".source = ./config/zsh/zshrc;
  home.file.".config/gtk-3.0".source = ./config/gtk3;
}
