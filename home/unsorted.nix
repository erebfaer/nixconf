{pkgs, ...}: {
  home.packages = with pkgs; [
    bottles
    czkawka
  ];

  programs = {
    navi.enable = true;
    bottom.enable = true;
    mcfly.enable = true;
    gitui.enable = true;
    git.delta.enable = true;
  };
}
