{ ... }: {
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      minimizeToTray = false;
      arRPC = false;
      customTitlebar = true;
      tray = false;
      themeLinks = [
        "https://raw.githubusercontent.com/Dyzean/Tokyo-Night/main/themes/tokyo-night.theme.css"
      ];
      useQuickCss = true;
      plugins = {
        ClearURLs.enable = true;
        AnonymiseFileNames.enable = true;
        AlwaysTrust.enable = true;
        WebScreenShareFixes.enable = true;
      };
    };
  };

  xdg.configFile."vesktop/settings/quickCss.css".text = ''
    * {
      font-family: "Iosevka Nerd Font" !important;
    }

    @font-face {
      font-family: "Iosevka Nerd Font" !important;
    }
  '';
}
