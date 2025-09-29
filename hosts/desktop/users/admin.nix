{
  pkgs,
  inputs,
  config,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    ../../../user/default
    ../../../user/admin
  ];
}
