# for all hosts
{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./systemd-boot.nix
    ./locale.nix
    ./nix.nix
    ./fish.nix
    ./hardware-tools.nix
    ./nix-tools.nix
    ./unsorted.nix
  ];

  nixpkgs.config.allowUnfree = true;
  hardware.enableRedistributableFirmware = true;

  zramSwap.enable = true;

  environment.systemPackages = [
    inputs.home-manager.packages.${pkgs.system}.default
    pkgs.man-pages
  ];

  services = {
    flatpak.enable = true;
    envfs.enable = true; # populate /bin so shebangs work
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };
}
