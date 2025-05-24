{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      kamadorueda.alejandra
      esbenp.prettier-vscode
    ];
  };
}
