{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    duti

    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
