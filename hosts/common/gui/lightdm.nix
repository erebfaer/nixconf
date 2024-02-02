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
    };
  };
}
