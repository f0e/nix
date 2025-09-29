{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.ghostty = {
    enable = true;
  };
}
