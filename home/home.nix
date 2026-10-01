{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/desktop
    ./modules/theme
    ./modules/communication
    ./modules/terminal
    ./modules/shell
    ./modules/util
    ./modules/browser
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
    zoxide
    lazygit
    fzf

    # programming
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

    # AI
    codex

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
}
