{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./gui
    ./games
    ./cli
  ];

  programs.git = {
    enable = true;
    userName = "erebfaer";
    userEmail = "erebfaer@hotmail.com";
    lfs.enable = true;
  };

  # Match NixOs? Will need system specific home files.
  home.stateVersion = "23.11";
}
