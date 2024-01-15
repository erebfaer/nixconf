{ inputs, outputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.okular
    libreoffice
    wine
    winetricks

    webcord
  ];
}
