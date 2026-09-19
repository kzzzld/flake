{ ... }: {
  programs.kitty = {
      enable = true;
      settings = {
        cursor_trail = 5;
        font_family = "JetBrainsMono Nerd Font";
        font_size = 12.0;
        scrollback_lines = 5000;
        mouse_hide_wait = 5.0;
        remember_window_size = "yes";
        wayland-titlebar-color = "background";
        tab_bar_style = "powerline";
        confirm_os_window_close = 0;
        background_opacity = 0.9;
        hide_window_decorations = "titlebar-only";
    };
  };
}
