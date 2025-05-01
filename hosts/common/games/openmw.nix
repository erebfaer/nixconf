{openmw-nix,...}: {
  environment.systemPackages = with openmw-nix.packages; [
    delta-plugin
    openmw-dev
    openmw-validator
    plox
  ];
}
