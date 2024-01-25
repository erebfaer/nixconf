{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.xplr = {
    enable = true;
    extraConfig = "";
    plugins = [];
  };
}
