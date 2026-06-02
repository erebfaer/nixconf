{
  pkgs,
  lib,
  config,
  ...
}: {
  # nix packages, native library dependencies
  # packages = [ pkgs.cairo pkgs.zlib ];

  languages.python = {
    enable = true;
    venv.enable = true;
    # version = "3.11";
    # nix python packages
    # package = pkgs.python3.withPackages (ps: [
    #   ps.numpy
    #   ps.tkinter
    # ]);

    # python packages requiring native libraries
    # venv.requirements = ''
    #   pillow
    #   grpcio-tools
    # '';

    lsp.package = pkgs.pyrefly;

    uv = {
      enable = true;
      sync = {
        enable = true;
        allGroups = true; # Install all dependency groups
        # groups = [ "dev" "test" ];  # Or pick specific ones
        # extras = [ "plotting" ];    # Specific extras
        # allExtras = true;           # All extras
      };
    };
  };
}
