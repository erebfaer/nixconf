{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./gui
    ./games
  ];

  

  # Match NixOs? Will need system specific home files.
  home.stateVersion = "23.05";
}
