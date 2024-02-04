# for quickly adding packages
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    p7zip
    obsidian
    syncthing
    gnome.zenity
  ];
}
