{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/font.nix
    ./modules/stylix.nix
    ./modules/plasma.nix
    ./modules/vesktop.nix
    ./modules/kitty.nix
    ./modules/tmux.nix
    ./modules/halloy.nix
    ./modules/bitwarden.nix
    ./modules/git.nix
    ./modules/mpv.nix
    ./modules/firefox.nix
    ./modules/vscode.nix
    ./modules/neovim.nix
    ./modules/zsh.nix
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
    eza
    starship
    zoxide
    lazygit
    fzf

    # programming
    emacs-pgtk
    nodejs
    cargo
    stylua
    clang-tools
    alejandra
    nixd
    gcc
    cmake
    gnumake
    libtool
    tree-sitter
    lua-language-server

    # internet
    gajim
    signal-desktop
    thunderbird

    # games
    xonotic
    ddnet

    # office
    libreoffice-stable
  ];

  home.activation.removeConflictingGtkrc = lib.hm.dag.entryBefore ["writeBoundary"] ''
    rm -f "$HOME/.gtkrc-2.0"
  '';

  home.file.".emacs.d" = {
    source = ./config/emacs;
    recursive = true;
  };
}
