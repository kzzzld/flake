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
  ];

  programs.plasma = {
    enable = true;

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
      };
      plasmashell = {
        "Show Activity Switcher" = "none";
      };
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "top";
        widgets = [
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
          # Adding configuration to the widgets can also for example be used to
          # pin apps to the task-manager, which this example illustrates by
          # pinning dolphin and konsole to the task-manager by default with widget-specific options.
          {
            iconTasks = {
              launchers = [
                "applications:librewolf.desktop"
                "applications:kitty.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:org.gajim.Gajim.desktop"
                "applications:org.squidowl.halloy.desktop"
                "applications:vesktop.desktop"
              ];
            };
          }

          "org.kde.plasma.marginsseparator"

          "org.kde.plasma.pager"

          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.volume"
              ];
              # And explicitly hide networkmanagement and volume
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
        ];
      }
    ];
  };
}
