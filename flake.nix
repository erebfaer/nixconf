{
  description = "Test Flake";

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # inputs are dependencies
  inputs = {
    # Repos, management, other nix specific stuff
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-23.11";
    unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    # Other flakes
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    # add 'unstable' if using both channels
    self,
    nixpkgs,
    unstable,
    home-manager,
    nur,
    nix-index-database,
    arkenfox,
    nix-gaming,
    nix-alien,
    ...
  } @ inputs: let
    inherit (self) outputs;

    systems = [
      # supported systems
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      # deploy config from flake directory with:
      # sudo nixos-rebuild switch --flake .#hostname
      "samedi" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;}; # pass inputs to modules
        modules = [
          ./hosts/samedi/configuration.nix # system specifc config
          nix-index-database.nixosModules.nix-index
        ];
      };
    };

    homeConfigurations = {
      # deply home config with:
      # home-manager switch --flake .#username@hostname
      "nk@samedi" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/samedi.nix
        ];
      };
    };
  };
}
