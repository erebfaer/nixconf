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
    spotify
    tauon

    # documents
    libsForQt5.okular
    libreoffice
    standardnotes # broken

    webcord
    libsForQt5.index # currently broken

    trackma-gtk # anime tracking

    nodejs
    gnumake
    gcc
    python311Packages.torchWithRocm

    unstable.oterm
    unstable.lmstudio

    p7zip
    # unstable.obsidian # outdated electron
    gnome.zenity
    vlc
    unstable.spacedrive
    fd
    yazi
    syncthing
    ueberzugpp
    rio
    spotify-player
    ferium
    warp-terminal

    transgui
    flood

    calibre

    unstable.zed-editor
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

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  services.ollama = {
    enable = false;
    package = pkgs.unstable.ollama;
    acceleration = "rocm";
  };

  # usb devices
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [8000];
    allowedUDPPorts = [8000];
  };
}
