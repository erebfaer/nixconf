{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  programs.librewolf = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [
        inputs.pipewire-screenaudio.packages.${pkgs.system}.default
      ];
    };

    profiles = {
      default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          sidebery
          violentmonkey
          bypass-paywalls-clean
          reddit-enhancement-suite

          # steam stuff
          augmented-steam
          protondb-for-steam

          # youtube stuff
          sponsorblock
          dearrow
        ];
      };
    };
  };
}
