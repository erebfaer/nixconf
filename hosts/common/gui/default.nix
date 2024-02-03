{
  pkgs,
  inputs,
  ...
}: let
  unstable = import inputs.unstable {config = {allowUnfree = true;};}; # import unstable configure unfree for easy way to install unstable packages
in {
  environment.systemPackages = with pkgs; [
    # tools
    wine
    winetricks
    unstable.resources

    # multimedia
    jellyfin-media-player
    jellyfin-mpv-shim

    # feishin # electron broken, needs update

    # documents
    libsForQt5.okular
    libreoffice
    standardnotes # broken

    webcord
    libsForQt5.index # currently broken

    # anime tracking
    trackma
    trackma-gtk
  ];

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings.general.renice = 10;
  };
}
