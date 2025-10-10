{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    profiles.default.extensions = with pkgs.vscode-extensions;
      [
        jnoortheen.nix-ide
        kamadorueda.alejandra
        esbenp.prettier-vscode
        thenuprojectcontributors.vscode-nushell-lang
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "poe2-filter";
          publisher = "thmsn";
          version = "0.0.19";
          sha256 = "sha256:NGlOzNiQEy7hmd3AGIMk6fCJdWR1mQFaqs3KsYLHI/s=";
        }
      ];
  };
}
