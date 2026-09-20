{pkgs, ...}: {
  programs.halloy = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      servers.Libera = {
        nickname = "kzzzl/libera";
        server = "soju.kzzzl.xyz";
        password_command = "rbw get soju";
        port = 6003;
        use_tls = true;
      };

      servers.OFTC = {
        nickname = "kzzzl/OFTC";
        server = "soju.kzzzl.xyz";
        password_command = "rbw get soju";
        port = 6003;
        use_tls = true;
      };
    };
  };
}
