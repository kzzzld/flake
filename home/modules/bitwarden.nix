{ pkgs, ... }: {
programs.rbw = {
  enable = true;
  settings = {
    email = "kzzzl@kzzzl.xyz";
    sso_id = null;
    base_url = "https://vault.kzzzl.xyz";
    identity_url = null;
    ui_url = null;
    notifications_url = null;
    lock_timeout = 3600;
    sync_interval = 3600;
    pinentry = pkgs.pinentry-qt;
    client_cert_path = null;
  };
};
  }
