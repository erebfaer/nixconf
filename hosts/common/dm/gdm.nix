{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [];

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
