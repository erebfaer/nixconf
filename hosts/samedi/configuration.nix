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

    ../common/gui
    ../common/gui/gnome.nix
  ];

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

    heroic
    lutris

    SDL_gfx
  ];

  environment.variables.EDITOR = "hx";

  # Services.
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  system.stateVersion = "23.11"; # DO NOT CHANGE

  # mount options
  fileSystems = {
    "/".options = ["compress=zstd" "noatime"];
    "/home".options = ["compress=zstd" "noatime"];
    "/nix".options = ["compress=zstd" "noatime"];
    "/swap".options = ["noatime"];
  };

  swapDevices = [{device = "/swap/swapfile";}];

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
