{
  config,
  lib,
  pkgs,
  ...
}: {
  time.timeZone = "Europe/Istanbul";

  # Networking
  networking.networkmanager.enable = true;
  services.resolved.enable = false;

  # Zapret and dnscrypt-proxy
  networking = {
    nameservers = ["127.0.0.1" "::1"];
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      listen_addresses = ["127.0.0.1:53" "[::1]:53"];
    };
  };

  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=fake"
      "--dpi-desync-ttl=3"
    ];
  };

  # Enable udisks2.
  services.udisks2.enable = true;

  # Enable Sway Window manager.
  programs.sway.enable = true;
  services.xserver.displayManager.lightdm.enable = false;

  nixpkgs.overlays = [
    (self: super: {
      swaylock = super.swaylock-effects;
    })
  ];

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.zsh.enable = true;
  users.users.kzzzl = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for this user.
    shell = pkgs.zsh;
  };

  # Enable unfree software. (Stallman is going to be mad at me :( )
  nixpkgs.config.allowUnfree = true;

  # Enable nix and flakes!
  nix.settings.extra-experimental-features = ["nix-command" "flakes"];

  # Enable GnuPG Agent
  programs.gnupg.agent = {
    enable = true;
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["kzzzl"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
