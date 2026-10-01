{pkgs, ...}: {
  home.packages = [pkgs.nerd-fonts.iosevka];
  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    sansSerif = ["Iosevka Nerd Font"];
    monospace = ["Iosevka Nerd Font"];
  };

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };

    emoji = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };
  };
}
