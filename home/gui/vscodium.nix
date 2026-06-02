{pkgs, ...}: {
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhs;
    #profiles.default.extensions = with pkgs.vscode-extensions;
    profiles.default.extensions =
      (with pkgs.open-vsx; [
        # utility
        oderwat.indent-rainbow
        esbenp.prettier-vscode
        pucelle.run-on-save

        # nix
        jnoortheen.nix-ide
        kamadorueda.alejandra

        # rust
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb

        # python
        charliermarsh.ruff
        meta.pyrefly

        thenuprojectcontributors.vscode-nushell-lang
        ocamllabs.ocaml-platform
      ])
      ++ (with pkgs.vscode-marketplace; [
        thmsn.poe2-filter
      ]);
    #++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #  {
    #    name = "poe2-filter";
    #    publisher = "thmsn";
    #    version = "0.0.19";
    #    sha256 = "sha256:NGlOzNiQEy7hmd3AGIMk6fCJdWR1mQFaqs3KsYLHI/s=";
    #  }
    #  {
    #    name = "pyrefly";
    #    publisher = "meta";
    #    version = "1.0.0";
    #    sha256 = "sha256:zKlzaTXUO3dNs8NCpmenc/tb4EBq9UDKCHv6qoiXixI=";
    #  }
    #];
  };
}
