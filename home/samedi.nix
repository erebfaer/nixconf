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

    # ./easyeffects.nix # auto applies incomplete filter chain breaking input, maybe later
    ./unsorted.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
      inputs.nix-vscode-extensions.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  xdg.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      name = "erebfaer";
      email = "erebfaer@hotmail.com";
    };
    lfs.enable = true;
  };

  # reload services on switch
  systemd.user.startServices = "sd-switch";

  # Match NixOs? Will need system specific home files.
  home.stateVersion = "23.11";
}
