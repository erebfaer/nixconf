# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # dont think these will work together atm, seperate displayManager stuff?
      #../../kde-wayland.nix
      ../common/gui/gnome.nix

      ../../users/nk.nix

      ../common

      ../common/amd.nix
      ../common/pipewire.nix

      ../common/gui/kate.nix
    ];

  networking = {
    hostName = "samedi";
    networkmanager.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    
    # helix and nix lsp
    helix
    nil

    sddm
    gtk3
    alacritty
    
    # nix helpers
    manix
    statix

    nfs-utils
  ];

  environment.variables.EDITOR = "hx";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # mount options
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    # "/swap".options = [ "noatime" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

