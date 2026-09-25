{ pkgs, lib, ... }: let
  cursorShader = pkgs.fetchFromGitHub {
    owner = "sahaj-b";
    repo = "ghostty-cursor-shaders";
    rev = "0a274beac8b93ee6ce6b94402b7313a0417b8e38";
    hash = "sha256-B7B6K7Ee4uJlW8zzLP3ILgddnbcIQyNimY+rVllzbR0=";
  };
in {
  programs.ghostty = {
    enable = true;
    settings = {
        font-size = 12;
        background-opacity = 0.9;
        cursor-style = "block";
        shell-integration-features = "no-cursor";
        font-family = lib.mkForce "Iosevka Nerd Font";

        # custom-shader = "${cursorShader}/cursor_sweep.glsl";
        # custom-shader = "${cursorShader}/cursor_tail.glsl"; # kitty like
        custom-shader = "${cursorShader}/cursor_warp.glsl"; # neovide like
        # custom-shader = "${cursorShader}/ripple_cursor.glsl";
    };
  };
}
