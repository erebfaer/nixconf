{ pkgs, inputs, outputs, ...}: {

  imports = [
    ./firefox.nix
    ./mpv.nix
  ];
  
  home = {
    username = "nk";
    homeDirectory = "/home/nk";
    pointerCursor = {
      package = pkgs.volantes-cursors;
      name = "Volantes";
      gtk.enable = true;
      x11.enable = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  nixpkgs.overlays = with inputs; [nur.overlay];

  programs = {
    home-manager.enable = true;
    git.enable = true;
    wezterm.enable = true;
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        # obs-backgroundremoval # possible breaking build
        obs-pipewire-audio-capture
      ];
    };
  };
}
