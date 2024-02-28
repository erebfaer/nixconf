{pkgs, ...}: {
  home.packages = with pkgs; [
    bottles
    czkawka
    gping
    fd
    ripgrep-all
    verco
    dust
    duf
    nerdfonts
  ];

  programs = {
    navi.enable = true;
    bottom.enable = true;
    mcfly.enable = true;
    gitui.enable = true;
    git.delta.enable = true;
    trippy.enable = true;
    eza.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    beets.enable = true;
    fzf.enable = true;
    wofi.enable = true;
    zathura.enable = true;
    zellij.enable = true;
    nnn.enable = true;
  };
}
