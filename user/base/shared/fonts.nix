{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.symbols-only
  ];
}
