{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # inputs.arkenfox.hmModules.arkenfox
    # inputs.zen-browser.homeModules.beta
    inputs.zen-browser.homeModules.default
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    #package = (pkgs.firefox.override { nativeMessagingHosts = [
    #    inputs.pipewire-screenaudio.packages.${pkgs.system}.default ]; });
    #

    # wrapperConfig.speechSynthesisSupport = false; # speechd might be causeing audio issues
    # package = pkgs.firefox.override {
    #   cfg = {speechSynthesisSupport = false;};
    # };

    #nativeMessagingHosts = [
    #  inputs.pipewire-screenaudio.packages.${pkgs.system}.default
    #];

    # arkenfox = {
    #   enable = true;
    #   version = "122.0";
    # };

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
        };
      };
    };
  };
}
