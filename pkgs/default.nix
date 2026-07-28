{pkgs, ...}: {
  # uosc = pkgs.callPackage ./uosc.nix { };
  openxcom-extended = pkgs.callPackage ./oxce {};
  oxce-brutal = pkgs.callPackage ./oxce-brutal {};
}
