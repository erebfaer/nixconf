{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./steam.nix
    inputs.pob.nixosModules.rusty-path-of-building
  ];

  environment.systemPackages = with pkgs; [
    protonup-qt
    protonplus #replace above
    unstable.protontricks

    heroic
    lutris

    unstable.ludusavi
  ];

  #TODO: After 25.11
  #rusty-path-of-building.enable = true;
}
