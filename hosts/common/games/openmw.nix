{inputs, pkgs, openmw-nix,...}: {
  # don;t know why I had to do inputs, and the manual system at the end is an annoyance
  environment.systemPackages = with inputs.openmw-nix.packages."x86_64-linux"; [
    delta-plugin
    openmw-dev
    openmw-validator
    #plox
    umo
  ];
}
