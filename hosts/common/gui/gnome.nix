{ config, lib, pkgs, ... }:
{
  imports = [];

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.sound-output-device-chooser
      
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
