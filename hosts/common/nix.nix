{
  inputs,
  lib,
  pkgs,
  ...
}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["root" "@wheel"];
    };
  };

  # Switch to lix
  nix.package = pkgs.lixPackageSets.stable.lix;
}
