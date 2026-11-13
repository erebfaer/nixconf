{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    unstable.protonplus
    unstable.protontricks

    heroic
    lutris

    unstable.ludusavi

    # unstable.rimsort # broken?
  ];
}
