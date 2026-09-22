{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
        font-size = 12;
        theme = "catppuccin-mocha";
        background-opacity = 0.9;
        cursor-style = "block";
    };
  };
}
