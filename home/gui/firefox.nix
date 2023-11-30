{ inputs, outputs, config, lib, pkgs, ...}:

{
  imports = [
    inputs.arkenfox.hmModules.arkenfox
  ];
  
  programs.firefox = {
    enable = true;
    package = (pkgs.firefox.override { nativeMessagingHosts = [
        inputs.pipewire-screenaudio.packages.${pkgs.system}.default ]; });
    

    #nativeMessagingHosts = [
    #  inputs.pipewire-screenaudio.packages.${pkgs.system}.default
    #];
    
    arkenfox = {
      enable = true;
      version = "119.0"; 
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
          
          "2000" = {
            enable = true;
            # if i want to keep history on close
            #"2811" = {
            #  "privacy.clearOnShutdown.history".value = false;
            #};
          };
          
          "2400".enable = true;
          
          "2600".enable = true;
          "2700".enable = true;
          "2800".enable = true;

          # resist fingerprinting block         
          "4500" = { 
            enable = true;
            "4501"."privacy.resistFingerprinting".value = false;
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
      };
    };
  };
}
