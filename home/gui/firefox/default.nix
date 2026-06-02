{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.betterfox.modules.homeManager.betterfox
  ];

  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox"; # changed from 26.05, keep it the same for now

    # wrapperConfig.speechSynthesisSupport = false; # speechd might be causeing audio issues
    package = pkgs.firefox.override {
      cfg = {speechSynthe9sisSupport = false;};
    };

    betterfox = {
      enable = true;
      profiles.default = {
        enableAllSections = true;
      };
    };

    profiles = {
      default = {
        isDefault = true;

        search = {
          default = "ddg";
          force = true;
        };

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          # important
          bitwarden
          ublock-origin
          skip-redirect
          multi-account-containers
          sidebery

          # optional
          violentmonkey
          # bypass-paywalls-clean
          reddit-enhancement-suite
          auto-tab-discard
          raindropio

          # steam stuff
          augmented-steam
          protondb-for-steam

          # youtube stuff
          sponsorblock
          dearrow
          improved-tube
          # faststream # apparently gone?
        ];

        settings = {
          "general.autoScroll" = true;
          "extensions.pocket.enabled" = false;
          "signon.rememberSignons" = false;
          #"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.sessionstore.restore_pinned_tabs_on_demand" = true; # prevent pinned tabs being restored on startup
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "network.trr.uri" = "https://base.dns.mullvad.net/dns-query";

          # clear on close
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.clearOnShutdown_v2.cache" = true;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = true; # ctrl-i permissions should still work
          "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false; # want history
          "privacy.clearOnShutdown_v2.formdata" = true;
          "browser.sessionstore.privacy_level" = 2; # breaks session restore
        };
      };
    };
  };
}
