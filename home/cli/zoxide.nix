{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    # options = [];
  };
}
