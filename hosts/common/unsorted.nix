# for quickly adding packages
{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    p7zip
    # unstable.obsidian # outdated electron
    syncthing
    gnome.zenity
  ];
}
