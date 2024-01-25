{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    # options = [];
  };
}
