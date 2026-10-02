{
  pkgs,
  inputs,
  ...
}: {
  # NOTE: Font settings are in ./font.nix file.

  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    targets = {
      qt.enable = false; # don't enable qt when using plasma
    };
  };
}
