{...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        term = "xterm-256color";
        pad = "5x5x5x5";
      };

      colors-dark = {
          alpha = 0.9;
      };
    };
  };
}
