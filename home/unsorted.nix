{pkgs, ...}: {
  home.packages = with pkgs; [
    bottles
    czkawka
    gping
    fd
    ripgrep-all
    verco
    du-dust
    duf
    nerdfonts
  ];

  programs = {
    navi.enable = true;
    bottom.enable = true;
    mcfly.enable = true;
    gitui.enable = true;
    git.delta.enable = true;
    eza.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    # beets.enable = true; # seems to be causing issues # TODO: should be fixed as of 16/03 but still passing
    fzf.enable = true;
    wofi.enable = true;
    zathura.enable = true;
    zellij.enable = true;
    nnn.enable = true;
  };

  services = {
    espanso = {
      enable = true;
      package = pkgs.espanso-wayland;
    };
  };
}
