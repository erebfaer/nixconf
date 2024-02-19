{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gui
    ./games
    ./cli

    ./unsorted.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "erebfaer";
    userEmail = "erebfaer@hotmail.com";
    lfs.enable = true;
  };

  # reload services on switch
  systemd.user.startServices = "sd-switch";

  # Match NixOs? Will need system specific home files.
  home.stateVersion = "23.11";
}
