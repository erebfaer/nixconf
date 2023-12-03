{ pkgs, inputs, outputs, ...}: {

  imports = [
    ./firefox.nix
    ./mpv.nix
  ];
  
  home = {
    username = "nk";
    homeDirectory = "/home/nk";
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
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };

  systemPackages = with pkgs; [
    libsForQt5.okular
  ];
}
