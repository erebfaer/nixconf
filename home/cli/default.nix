{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./fish.nix # shell
    ./btop.nix # cli system monitor
    ./xplr.nix # cli file explorer
    ./zoxide.nix # cd alternative
  ];
}
