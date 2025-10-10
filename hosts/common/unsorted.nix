# for quickly adding packages
{
  pkgs,
  inputs,
  outputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # tools
    wine
    winetricks
    unstable.resources
    ffmpeg
    dua
    bandwhich

    # multimedia
    jellyfin-media-player
    jellyfin-mpv-shim
    # unstable.feishin # electron
    spotify
    tauon
    spotify-player
    vlc
    unstable.spotube
    grayjay

    # documents
    kdePackages.okular
    libreoffice
    standardnotes # broken
    unstable.obsidian # electron
    notesnook
    onlyoffice-bin

    # libsForQt5.index # broken on gnome, and cant find qt6 version

    trackma-gtk # anime tracking

    p7zip
    libarchive # use bsdtar

    zenity

    unstable.spacedrive
    fd
    syncthing

    transgui

    httm
    unstable.xiu

    via

    ungoogled-chromium

    oxce-brutal

    # minecraft
    unstable.gdlauncher-carbon
    unstable.packwiz
    prismlauncher # form of multimc? so should work with packwiz

    amf

    qcad

    distrobox
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

    appimage.binfmt = true; # run appimages seamlessly

    ydotool.enable = true;
  };

  # virtualisation.virtualbox.host.enable = true; # broken?
  users.extraGroups.vboxusers.members = ["nk"];

  # usb devices
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # can't remember what wanted this...
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [8000];
    allowedUDPPorts = [8000];
  };
}
