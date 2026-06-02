# for some reason it wants system over stdenv.hostPlatform.system unlike the rust flake
# guess rust overlay brings stdenv in, but this doesnt complain about it being deprecated...
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            ocaml
            ocamlPackages.ocaml-lsp
            ocamlPackages.ocamlformat
            # add any other packages you want to include here
          ];
        };
      }
    );
}
