{lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      font_size = 12;
      font_family = "Iosevka Nerd Font";
      cursor_trail = 10;
      cursor_shape = "underline";
      background_opacity = lib.mkForce "0.9";
      window_padding_width = 5;
    };
  };
}
