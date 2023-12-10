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
    systemPackages = (with pkgs; [
      wl-clipboard
    ]) ++ (with pkgs.gnome; [
      gnome-tweaks      
    ]) ++ (with pkgs.gnomeExtensions; [
      appindicator
      tray-icons-reloaded
      dash-to-dock
      dash-to-dock-toggle
      dash-to-panel
      just-perfection
      search-light
      advanced-alttab-window-switcher
      custom-hot-corners-extended
    ]);
    sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
