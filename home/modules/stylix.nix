{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";
    targets = {
      qt.enable = false; # don't enable qt when using plasma
    };
  };
}
