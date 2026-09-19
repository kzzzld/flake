{
  config,
  pkgs,
  inputs,
  ...
}: {

  imports = [
    ./modules/catppuccin.nix
    ./modules/plasma.nix
    ./modules/foot.nix
    ./modules/halloy.nix
    ./modules/bitwarden.nix
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
    mpv
    obs-studio

    # terminal & shell
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
    dino
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

  home.file."Wallpapers".source = ./config/walls;
  home.file.".gitconfig".source = ./config/git/gitconfig;
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
