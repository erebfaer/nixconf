{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      kamadorueda.alejandra
      esbenp.prettier-vscode
    ];
  };
}
