{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
  ];

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      # wayland.enable = true;
    };
    desktopManager = {
      plasma5.enable = true;
      # defaultSession = "plasmawayland";
      # ^ does not exist atm
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wl-clipboard
      kmix
      plasma-pa
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
