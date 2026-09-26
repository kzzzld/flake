{pkgs, ...}: let
  modernz = pkgs.fetchFromGitHub {
    owner = "Samillion";
    repo = "ModernZ";
    rev = "v0.3.3";
    sha256 = "sha256-cz6yb0jQiqmzRPo1YSsnPWLshGPzBeq39DhBv7tGJqs=";
  };
in {
  programs.mpv = {
    enable = true;
    config = {
      osc = "no";
    };
  };

  xdg.configFile = {
    "mpv/scripts/modernz.lua".source = "${modernz}/modernz.lua";
    "mpv/fonts/modernz-icons.ttf".source = "${modernz}/modernz-icons.ttf";

    "mpv/script-opts/modernz.conf".text = ''
      # Catppuccin Mocha theme

      # accent color of the OSC and title bar (Base)
      osc_color=#1e1e2e
      # color of the title in borderless/fullscreen mode (Text)
      window_title_color=#cdd6f4
      # color of the window controls (Text)
      window_controls_color=#cdd6f4
      # color of the title (Text)
      title_color=#cdd6f4
      # color of the cache information (Subtext0)
      cache_info_color=#a6adc8
      # color of the cache ranges on the seekbar (Surface2)
      seekbar_cache_color=#585b70
      # color of the seekbar progress (Blue - accent)
      seekbarfg_color=#89b4fa
      # color of the remaining seekbar (Surface1)
      seekbarbg_color=#45475a
      # color of the seekbar handle (Blue - accent)
      seek_handle_color=#89b4fa
      # inner border color of the seekbar handle (Sapphire)
      seek_handle_border_color=#74c7ec
      # color of the timestamps (Text)
      time_color=#cdd6f4
      # color of the chapter title (Text)
      chapter_title_color=#cdd6f4
      # color of the side buttons (Text)
      side_buttons_color=#cdd6f4
      # color of the middle buttons (Text)
      middle_buttons_color=#cdd6f4
      # color of the play/pause button (Text)
      playpause_color=#cdd6f4
      # color of the element when held down (Surface2)
      held_element_color=#585b70
      # color of a hovered button (Blue - accent)
      hover_effect_color=#89b4fa
      # color of the thumbnail box background (Mantle)
      thumbnail_box_color=#181825
      # color of chapter nibbles (Mauve)
      nibble_color=#cba6f7
      # color of the current chapter nibble (Text)
      nibble_current_color=#cdd6f4
      # color of the A/B loop range (Peach)
      ab_loop_color=#fab387
    '';
  };
}
