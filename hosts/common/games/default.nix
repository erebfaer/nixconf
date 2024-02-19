# for all hosts
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
    unstable.protontricks

    heroic
    lutris

    unstable.ludusavi
  ];
}
