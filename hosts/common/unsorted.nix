# for quickly adding packages
{
  pkgs,
  inputs,
  ...
}: {
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

    trackma-gtk # anime tracking

    p7zip
    # unstable.obsidian # outdated electron
    gnome.zenity
    vlc
    unstable.spacedrive
    fd
    yazi
    syncthing
    ueberzugpp
  ];

  programs = {
    weylus = {
      enable = true;
      openFirewall = true;
    };
    gamemode = {
      enable = true;
      enableRenice = true;
      settings.general.renice = 10;
    };

    trippy.enable = true;
  };

  services.mediamtx = {
    enable = true;
    settings = {
      webrtc = false;
      webrtcLocalUDPAddress = "";
      webrtcLocalTCPAddress = ":8189";
      webrtcAddress = "";
      webrtcAdditionalHosts = [""];
      paths = {
        stream = {};
      };
    };
  };
  networking.firewall = {
    allowedTCPPorts = [8889 8189 8890];
    allowedUDPPorts = [8889 8189 8890];
  };
}
