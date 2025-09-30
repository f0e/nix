{
  inputs,
  lib,
  config,
  ...
}: {
  programs.git = {
    ignores = [
      ".DS_Store"
    ];
  };
}
