{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix


    # ./modules/catppuccin.nix
    ./modules/plasma.nix
#   ./modules/foot.nix
#   ./modules/kitty.nix
    ./modules/ghostty.nix
    ./modules/halloy.nix
    ./modules/bitwarden.nix
    ./modules/git.nix
    ./modules/mpv.nix
    ./modules/firefox.nix
  ];


  home = {
    username = "kzzzl";
    homeDirectory = "/home/kzzzl";
    stateVersion = "26.05";
  };

  # some user services
  services.ollama.enable = true;

  home.packages = with pkgs; [
    # utilities
    wl-clipboard
    playerctl
    udiskie
    zip
    unzip
    nix-search-cli
    pinentry-qt

    # media
    obs-studio

    # terminal & shell
    fastfetch
    tmux
    tmuxinator
    eza
    starship
    zoxide
    lazygit

    # programming
    neovim
    emacs-pgtk
    vscode
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
    nerd-fonts.iosevka
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    targets = {
      qt.enable = false;
    };
  };

  home.activation.removeConflictingGtkrc = lib.hm.dag.entryBefore ["writeBoundary"] ''
  rm -f "$HOME/.gtkrc-2.0"
'';


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
