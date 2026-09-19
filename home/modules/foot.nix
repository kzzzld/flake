{...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        term = "xterm-256color";
      };
    };
  };
}
