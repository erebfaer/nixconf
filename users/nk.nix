{
  inputs,
  pkgs,
  config,
  ...
}: {
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
      "docker"
    ];
  };
}
