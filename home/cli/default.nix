{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./btop.nix # cli system monitor
    ./xplr.nix # cli file explorer
    ./zoxide.nix # cd alternative
  ];
}
