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
    vlc
    unstable.spacedrive
  ];

  services.mediamtx = {
    enable = true;
    settings = {
      webrtc = false;
      webrtcLocalUDPAddress = "";
      webrtcLocalTCPAddress = ":8189";
      webrtcAddress = "";
      webrtcAdditionalHosts = [""];
      paths = {
        stream = {};
      };
    };
  };
  networking.firewall = {
    allowedTCPPorts = [8889 8189 8890];
    allowedUDPPorts = [8889 8189 8890];
  };
}
