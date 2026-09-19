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
      colorScheme = "Catppuccin-Mocha-Blue";
      windowDecorations = {
        library = "org.kde.breeze";
        theme = "Breeze";
      };
      iconTheme = "Papirus-Dark";
      wallpaper = ./config/walls/jellyfish.jpg;
    };

    hotkeys.commands."terminal" = {
      name = "Launch Foot";
      key = "Meta+Return";
      command = "foot";
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
                "applications:foot.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:org.gajim.Gajim.desktop"
                "applications:org.squidowl.halloy.desktop"
                "applications:vesktop.desktop"
              ];
            };
          }

          "org.kde.plasma.marginsseparator"

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
