{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.arkenfox.hmModules.arkenfox
  ];

  programs.firefox = {
    enable = true;
    #package = (pkgs.firefox.override { nativeMessagingHosts = [
    #    inputs.pipewire-screenaudio.packages.${pkgs.system}.default ]; });

    #nativeMessagingHosts = [
    #  inputs.pipewire-screenaudio.packages.${pkgs.system}.default
    #];

    arkenfox = {
      enable = true;
      version = "119.0";
    };

    profiles = {
      media = import ./media-profile.nix {inherit pkgs;} // {id = 1;};
      default = {
        isDefault = true;

        search = {
          default = "DuckDuckGo";
          force = true;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          # important
          bitwarden
          ublock-origin
          skip-redirect
          multi-account-containers
          sidebery

          # optional
          violentmonkey
          bypass-paywalls-clean
          reddit-enhancement-suite
          auto-tab-discard

          # steam stuff
          augmented-steam
          protondb-for-steam

          # youtube stuff
          sponsorblock
          dearrow
          improved-tube
        ];

        arkenfox = {
          enable = true;

          "0100".enable = true;
          "0200".enable = true;
          "0300".enable = true;
          "0400".enable = true;

          "0600".enable = true;
          "0700".enable = true;
          "0800".enable = true;
          "0900".enable = true;
          "1000".enable = true;

          "1200".enable = true;

          "1600".enable = true;
          "1700".enable = true;

          "2000".enable = true;

          "2400".enable = true;

          "2600".enable = true;
          "2700".enable = true;
          "2800" = {
            enable = true;
            # if i want to keep history on close
            "2811" = {
              "privacy.clearOnShutdown.history".value = false;
            };
          };

          # resist fingerprinting block
          "4500" = {
            enable = true;
            "4501"."privacy.resistFingerprinting".value = false;
            "4504"."privacy.resistFingerprinting.letterboxing".value = false;
            "4520"."webgl.disabled".value = false;
          };

          # optional hardening and opsec
          # "5000".enable = true;
          # "5500".enable = true;

          "6000".enable = true;
          "7000".enable = true;
          "8000".enable = true;
          "9000".enable = true;
        };

        # trying to fix min/max/close buttons not appearing
        /*
         userChrome =
        ''
          #toolbar-menubar {
            display: none !important;
          }
          #toolbar-menubar[autohide="true"]:not([inactive]) + #TabsToolbar > .titlebar-buttonbox-container {
            visibility: visible !important;
          }
        '';
        */

        settings = {
          "general.autoScroll" = true;
          "extensions.pocket.enabled" = false;
          "signon.rememberSignons" = false;
          #"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
      };
    };
  };
}
