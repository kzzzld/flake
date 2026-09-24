{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
        font-size = 12;
        background-opacity = 0.9;
        cursor-style = "block";
        font-family = "JetBrainsMono Nerd Font";
    };
  };
}
