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

    #../common/gui/lightdm.nix
    ../common/gui/gnome.nix
    ../common/gui/hyprland.nix

    ../common/games
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  networking = {
    hostName = "samedi";
    networkmanager.enable = true;
  };

  services.printing.enable = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [nct6687d]; # for CPU sensors
  boot.kernelModules = ["nct6687d"];

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl

    # helix and nix lsp
    helix

    sddm
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
    };
    "/mnt/legba" = {
      device = "192.168.1.26:/home/erebfaer/Downloads";
      fsType = "nfs";
    };
  };

  swapDevices = [{device = "/swap/swapfile";}];

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
