{
  inputs,
  lib,
  config,
  ...
}: {
  programs.git.delta = {
    enable = true;
  };
}
