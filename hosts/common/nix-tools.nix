{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.nix-alien.overlays.default];

  environment.systemPackages = with pkgs; [
    # LSPs
    nil
    nixd

    alejandra # formatter

    nix-alien # run non-nix stuff
  ];

  programs.nix-ld.enable = true; # more running non-nix stuff
}
