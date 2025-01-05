{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./firefox
    ./mpv.nix
    ./vscodium.nix
    ./zed.nix
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

  nixpkgs.overlays = with inputs; [nur.overlays.default];

  programs = {
    home-manager.enable = true;
    git.enable = true;
    wezterm.enable = true;
    kitty.enable = true;
    nushell.enable = true;
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
    obs-studio = {
      enable = true;
      package = pkgs.unstable.obs-studio;
      plugins = with pkgs.unstable.obs-studio-plugins; [
        wlrobs
        # obs-backgroundremoval # possible breaking build
        obs-pipewire-audio-capture
      ];
    };
  };
}
