{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      # skipOrPlayLikedSongs
      fullAlbumDate
      skipStats
      songStats
      showQueueDuration
      history
      lastfm
      copyLyrics
      sectionMarker
      starRatings
      allOfArtist
      oldCoverClick
    ];
  };
}
