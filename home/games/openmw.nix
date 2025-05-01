{openmw-nix,...}: {
  home.packages = with openmw-nix.packages; [
    delta-plugin
    openmw-dev
    openmw-validator
    plox
  ];
}
