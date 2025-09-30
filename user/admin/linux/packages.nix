{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
    helvum
  ];

  programs.obs-studio.enable = true;

  programs.chromium = {
    enable = true;

    package = pkgs.brave;

    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      "jinjaccalgkegednnccohejagnlnfdag" # violentmonkey
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      "imiakeaigofbcfdjajmgjfnohjlekndg" # Display Reddit images natively in browser
    ];
  };
}
