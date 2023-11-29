# for all hosts
{ pkgs, inputs, outputs, ...}: {
  imports = [
    ./systemd-boot.nix
    ./locale.nix
    ./nix.nix
    ./fish.nix 
  ];

  nixpkgs.config.allowUnfree = true;
  hardware.enableRedistributableFirmware = true;

  zramSwap.enable = true;

  environment.systemPackages = [
    inputs.home-manager.packages.${pkgs.system}.default
  ];

  services.flatpak.enable = true;
}
