{
  pkgs,
  lib,
  config,
  ...
}: {
  # nix packages, native library dependencies
  # packages = [ pkgs.cairo pkgs.zlib ];

  languages.rust = {
    enable = true;
    channel = "nixpkgs";
    components = ["rustc" "cargo" "clippy" "rustfmt"];

    lsp.enable = true;
    wild.enable = true; # linker
  };
}
