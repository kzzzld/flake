{
  pkgs,
  inputs,
  stylix,
  ...
}: let
  profileName = "default-release";
in {
  stylix.targets.firefox = {
    colorTheme.enable = true;
    colors.enable = true;
    profileNames = ["${profileName}"];
  };

  programs.firefox = {
    enable = true;
    profiles.${profileName} = {
      isDefault = true;

      search = {
        default = "DuckDuckGo";
        force = true;
      };

      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          bitwarden
          darkreader
          sponsorblock
          return-youtube-dislikes
          clearurls
          stylus
        ];
      };

      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
        "browser.theme.content-theme" = 0;
        "browser.theme.toolbar-theme" = 0;
        "extensions.startupScanScopes" = 15;
        "media.peerconnection.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.firstparty.isolate" = true;
        "dom.security.https_only_mode" = true;
        "toolkit.telemetry.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.cache.disk.capacity" = 2097152;
        "network.http.http3.enabled" = true;
        "media.autoplay.default" = 5;
        "extensions.pocket.enabled" = false;
        "browser.tabs.inTitlebar" = 0;
        "browser.newtabpage.enabled" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.toolbars.bookmarks.showInPrivateBrowsing" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
      };
    };
  };
}
