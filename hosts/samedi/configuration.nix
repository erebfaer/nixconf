{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../users/nk.nix

    ../common

    ../common/amd.nix
    ../common/pipewire.nix

    ../common/dm/sddm.nix
    #../common/gui/plasma6.nix
    ../common/gui/gnome.nix

    ../common/games
    ../common/games/sunshine.nix
    # ../common/games/awakened-poe.nix
    # TODO: things are broken ../common/games/openmw.nix

    # breaks current dns
    # ../common/unbound.nix
    ../common/containers
    # ../common/containers/pihole.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  # TODO remove and fix

    nixpkgs.config.permittedInsecurePackages = [
        "electron-33.4.11"
    ];


  networking = {
    hostName = "samedi";
    networkmanager.enable = true;
  };

  services.printing.enable = true;

  # Kernel stuff
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [nct6687d]; # for CPU sensors
    kernelModules = ["nct6687d"];
    kernelParams = [ "preempt=full" ]; # preempt for realtime or bonus fps?
  };


  environment.systemPackages = with pkgs; [
    # TODO: clean this out
    vim
    wget
    git
    curl

    # helix and nix lsp
    helix

    kdePackages.sddm
    gtk3
    alacritty

    # nix helpers
    manix
    statix

    nfs-utils
  ];

  environment.variables.EDITOR = "hx";

  # Services.
  services = {
    openssh = {
      enable = true;
      openFirewall = true;
    };

    rpcbind.enable = true;
  };

  system.stateVersion = "23.11"; # DO NOT CHANGE

  boot.supportedFilesystems = ["nfs"];

  # mount options
  fileSystems = {
    "/".options = ["compress=zstd" "noatime"];
    "/home".options = ["compress=zstd" "noatime"];
    "/nix".options = ["compress=zstd" "noatime"];
    "/swap".options = ["noatime"];
    "/mnt/ayizan" = {
      device = "192.168.1.24:/Multimedia";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ]; # lazy mount
    };
    "/mnt/legba" = {
      device = "192.168.1.26:/home/erebfaer/Downloads";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ]; # lazy mount
    };
  };

  swapDevices = [{device = "/swap/swapfile";}];

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
