{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [];

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
