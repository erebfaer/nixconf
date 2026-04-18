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
  ];

  programs = {
    navi.enable = true;
    bottom.enable = true;
    mcfly.enable = true;
    gitui.enable = true;

    eza.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    # beets.enable = true; # seems to be causing issues # TODO: should be fixed as of 16/03 but still passing
    fzf.enable = true;
    wofi.enable = true;
    zathura.enable = true;
    zellij.enable = true;
    nnn.enable = true;

    rio.enable = true;

    carapace = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };

  services = {
    espanso = {
      enable = false; # TODO: not working atm?
      package = pkgs.espanso-wayland;
    };
  };
}
