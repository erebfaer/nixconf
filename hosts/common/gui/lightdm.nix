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
      wayland = true;
      greeters.slick.enable = true;
      background = "#000000";
    };
  };
}
