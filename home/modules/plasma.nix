{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.plasma-manager.homeModules.plasma-manager];

  home.packages = with pkgs; [
    (catppuccin-kde.override {
      flavour = ["mocha"];
    })
    (pkgs.catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "blue";
    })

    kdePackages.krohnkite

  ];

  programs.plasma = {
    enable = true;

    configFile = {
      "breezerc"."Common" = {
        ShadowSize = "ShadowNone";
        ShadowStrength = 0;
      };
      "kwinrc" = {
        "Windows"."FocusPolicy" = "FocusFollowsMouse";

        "Plugins" = {
          "krohnkiteEnabled" = true;
        };
      };

      # "kwinrulesrc" = {
      #   "1" = {
      #     Description = "Remove all titlebars";
      #     noborder = true;
      #     noborderrule = 2;
      #     types = 4294967295;
      #     wmclass = "";
      #     wmclasscomplete = false;
      #     wmclassmatch = 0;
      #   };
      #
      #   General = {
      #     count = 1;
      #     rules = "1";
      #   };
      # };

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
      colorScheme = "CatppuccinMochaBlue";
      windowDecorations = {
        library = "org.kde.breeze";
        theme = "Breeze";
      };
      iconTheme = "Papirus-Dark";
      wallpaper = ../walls/jellyfish.jpg;
    };

    kwin.virtualDesktops = {
      number = 6;
      rows = 2;
    };

    hotkeys.commands."terminal" = {
      name = "Launch Terminal";
      key = "Meta+Return";
      command = "kitty";
    };

    fonts = {
      general = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 12;
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
              time.format = "12h";
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
