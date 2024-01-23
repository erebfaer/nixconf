{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.steamCompat
  ];

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
      "gamemode"
    ];
  };

  # TODO: move to games
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
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
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
            SDL_gfx # added for OXCE
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

  # TODO: put these in appropriate places
  environment.systemPackages = with pkgs; [
    protonup-qt

    cinnamon.nemo-with-extensions
  ];
}
