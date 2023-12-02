{ pkgs, config, ...}:

{
  # users.mutableUsers = false;
  # overwrites in system user setup/passwords
  # once I get secrets working
  
  users.users.nk = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      # wheel to be able to sudo, not sure what else I actually need, keep minimum for now
      "wheel"
      # "networkmanager"
      "video"
      "audio"
    ];
  };

  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        extraEnv = {};
        extraLibraries = pkgs: with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
      };
      gamescopeSession = {
        enable = true;
        args = [];
      };
    };
    gamescope = {
      enable = true;
      args = [];
    };
  };
}
