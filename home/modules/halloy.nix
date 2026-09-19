{pkgs, ...}: {
  programs.halloy = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      servers.libera = {
        nickname = "kzzzl/libera";
        server = "soju.kzzzl.xyz";
        password_command = "rbw get znc_libera";
        port = 6003;
        use_tls = true;
      };
    };
  };
}
