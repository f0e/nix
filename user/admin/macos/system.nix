{
  pkgs,
  lib,
  ...
}: {
  home.file.".config/duti/video.defaults".text = ''
    com.colliderli.iina mp4 all
    com.colliderli.iina mkv all
    com.colliderli.iina mov all
    com.colliderli.iina avi all
    com.colliderli.iina webm all
    com.colliderli.iina .mp4 all
    com.colliderli.iina .mkv all
    com.colliderli.iina .mov all
    com.colliderli.iina .avi all
    com.colliderli.iina .flv all
    com.colliderli.iina .wmv all
    com.colliderli.iina .webm all
    com.colliderli.iina .m4v all
    com.colliderli.iina .mpeg all
    com.colliderli.iina .mpg all
    com.colliderli.iina .vob all
    com.colliderli.iina .ts all
    com.colliderli.iina .m2ts all
    com.colliderli.iina .ogv all
    com.colliderli.iina .rm all
    com.colliderli.iina .rmvb all
    com.colliderli.iina .3gp all
    com.colliderli.iina .f4v all
    com.colliderli.iina .asf all
  '';

  home.activation = {
    # todo: is this the best place to be doing this?
    setFileAssociation = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Setting file associations with duti..."
      run ${pkgs.duti}/bin/duti ~/.config/duti/video.defaults
    '';
  };
}
