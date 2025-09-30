{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ../shared

    ./git.nix
  ];
}
