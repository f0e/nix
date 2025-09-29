{...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    ../../../user/default
    ../../../user/admin
  ];
}
