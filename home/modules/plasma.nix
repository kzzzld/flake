{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.plasma-manager.homeModules.plasma-manager];

  home.packages = with pkgs; [
    kdePackages.krohnkite
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    configFile = {
      # "kdeglobals"."General"."taskbarFont" = "Iosevka Nerd Font,11,-1,5,50,0,0,0,0,0";
      kdeglobals.General.fixed = "Iosevka Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.font = "Iosevka Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.menuFont = "Iosevka Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.smallestReadableFont = "Iosevka Nerd Font,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.taskbarFont = "Iosevka Nerd Font,11,-1,5,50,0,0,0,0,0";
      kdeglobals.General.toolBarFont = "Iosevka Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.WM.activeFont = "Iosevka Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";

      "breezerc"."Common" = {
        ShadowSize = "ShadowNone";
        ShadowStrength = 0;
      };

      "kwinrc" = {
        "Windows"."FocusPolicy" = "FocusFollowsMouse";

        "Plugins" = {
          "krohnkiteEnabled" = true;
        };

        "Script-krohnkite" = {
          "floatingClass" = "mpv";
        };
      };
    };

    window-rules = [
      {
        description = "Remove Titlebar";
        match = {
          window-class = {
            value = ".*";
            type = "regex";
          };
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];

    workspace = {
      clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
      wallpaper = ../walls/black-city.jpg;
    };

    kwin.virtualDesktops = {
      number = 6;
      rows = 2;
    };

    hotkeys.commands."terminal" = {
      name = "Launch Terminal";
      key = "Meta+Return";
      command = "ghostty";
    };

    fonts = {
      general = {
        family = "Iosevka Nerd Font";
        pointSize = 12;
      };
      fixedWidth = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      menu = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      small = {
        family = "Iosevka Nerd Font";
        pointSize = 8;
      };
      toolbar = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      windowTitle = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
    };

    input.touchpads = [
      {
        enable = true;
        middleButtonEmulation = true;
        tapToClick = false;
        naturalScroll = false;
        vendorId = "05ac";
        productId = "0351";
        name = "Apple MTP multi-touch";
      }
    ];

    shortcuts = {
      kwin = {
        "Window Close" = "Meta+Q";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";

        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "Window to Desktop 6" = "Meta+^";

        "KrohnkiteFocusLeft" = "Meta+H";
        "KrohnkiteFocusDown" = "Meta+J";
        "KrohnkiteFocusUp" = "Meta+K";
        "KrohnkiteFocusRight" = "Meta+L";
      };

      plasmashell = {
        "Show Activity Switcher" = "none";
      };

      ksmserver = {
        "Lock Session" = "Meta+Ctrl+Q";
      };
    };

    krunner = {
      position = "center";
      shortcuts.launch = "Meta+Space";
    };

    panels = [
      {
        location = "top";
        widgets = [
          {
            name = "org.kde.plasma.panelspacer";
            config.General = {
              expanding = false;
              length = 12;
            };
          }

          "org.kde.plasma.pager"

          "org.kde.plasma.panelspacer"

          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.volume"
              ];
              hidden = [
                "org.kde.plasma.networkmanagement"
              ];
            };
          }

          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
              font = {
                family = "Iosevka Nerd Font";
                weight = 400;
                size = 9;
              };
            };
          }

          {
            name = "org.kde.plasma.panelspacer";
            config.General = {
              expanding = false;
              length = 12;
            };
          }
        ];
      }
    ];
  };
}
