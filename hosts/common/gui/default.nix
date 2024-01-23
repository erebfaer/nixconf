{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wine
    winetricks

    webcord

    jellyfin-media-player
    jellyfin-mpv-shim

    # feishin

    libsForQt5.index

    libsForQt5.okular
    libreoffice
    standardnotes
  ];

  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };
}
