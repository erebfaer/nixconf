{ inputs, pkgs, config, ...}:

{

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
    ];
  };

  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
      ];
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
        args = [
          "--rt"
          "-f"
          "-e"
        ];
      };
    };
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "-f"
        "-e"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
    
    cinnamon.nemo-with-extensions
    
  ];
}
