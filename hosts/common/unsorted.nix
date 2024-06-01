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
    unstable.feishin # electron
    spotify
    tauon
    spotify-player
    vlc
    unstable.spotube

    # documents
    kdePackages.okular
    libreoffice
    standardnotes # broken
    unstable.obsidian # electron
    notesnook

    # libsForQt5.index # broken on gnome, and cant find qt6 version

    trackma-gtk # anime tracking

    p7zip

    gnome.zenity

    unstable.spacedrive
    fd
    yazi
    syncthing
    ueberzugpp
    rio

    ferium
    warp-terminal

    transgui

    unstable.zed-editor
    lact
    httm
    unstable.xiu
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

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["nk"];

  # usb devices
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # can't remember what wanted this...
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [8000];
    allowedUDPPorts = [8000];
  };
}
