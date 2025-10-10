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
    protonup-qt
    protonplus #replace above
    unstable.protontricks

    heroic
    lutris

    unstable.ludusavi
  ];
}
