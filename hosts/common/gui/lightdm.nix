{
  config,
  lib,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.lightdm = {
      enable = true;
      background = "#000000";
      greeters.slick = {
        enable = true;
        extraConfig = ''
          only-on-monitor=-1
        '';
      };
    };
  };
}
