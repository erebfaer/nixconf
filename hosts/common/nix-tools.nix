{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];

  nixpkgs.overlays = [inputs.nix-alien.overlays.default];

  environment.systemPackages = with pkgs; [
    # dev
    nil # lsp
    nixd # lsp but with eval
    alejandra # formatter

    nix-alien # run non-nix stuff
    nix-init # generate packages from URLs
  ];

  programs = {
    nix-ld.enable = true; # more running non-nix stuff
    nix-index = {
      # locate package containing file
      enable = true;
      enableFishIntegration = true; # apparently need all three
      enableBashIntegration = false;
      enableZshIntegration = false;
    };

    nix-index-database.comma.enable = true;
  };
}
