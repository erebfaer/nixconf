{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [];

  services.desktopManager.plasma6.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # having both gnome and plasma causes conflict, so be explicit until thats sorted out
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
}
