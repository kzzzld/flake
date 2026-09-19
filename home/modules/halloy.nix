{pkgs, ...}: {
  programs.halloy = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      servers.libera = {
        nickname = "kzzzl/libera";
        server = "znc.kzzzl.xyz";
        password_command = "rbw get znc_libera";
        port = 5001;
        use_tls = true;
      };
    };
  };
}
