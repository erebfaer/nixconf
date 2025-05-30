{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs = {
    gamescope = {
      enable = true;
      # capSysNice = true; # seems this breaks things with "failed to inherit capabilities"
      args = [
        # don't know if these actually get used, had -e -f and --rt
      ];
    };
    steam = {
      enable = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
      package = pkgs.steam.override {
        extraEnv = {};
        extraLibraries = pkgs:
          with pkgs; [
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
            glib

            xorg.libxkbfile # added for RimSort
            # added for oxce
            SDL
            SDL_gfx
            SDL_image
            SDL_mixer
          ];
        extraPkgs = pkgs:
          with pkgs; [
            mangohud
            gamescope
            gamemode
          ];
      };
      gamescopeSession.enable = true;
    };
  };
}
