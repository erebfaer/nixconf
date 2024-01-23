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

    ../common/nix-tools.nix
  ];

  networking = {
    hostName = "samedi";
    networkmanager.enable = true;
  };

  services.printing.enable = true;

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
