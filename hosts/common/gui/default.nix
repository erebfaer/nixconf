{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # tools
    wine
    winetricks
    resources

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
  ];

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings.general.renice = 10;
  };
}
