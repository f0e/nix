{config, ...}: {
  sops = {
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt"; # todo: dont like defining path like this but its in system so have to?

    defaultSopsFile = ../../../secrets/secrets.yaml; # todo: ssh key from 1password???

    # todo: nesting?? does nix-sops just not support it??? i keep getting errors bro
    secrets.spotify_client_id = {};
    secrets.spotify_client_secret = {};
    secrets.plex_server_url = {};
    secrets.plex_token = {};
    secrets.plex_libraries = {}; # note: needs to be a string not an array. another thing nix-sops doesnt support?

    templates = {
      "discord-music-rpc/config.yaml" = {
        path = "${config.xdg.configHome}/discord-music-rpc/config.yaml";
        # @todo: id like to have this be a template file in dotfiles/
        mode = "600"; # for some reason needs write perms for the service-ran discord-music-rpc to work even tho i added safe saving
        content = ''
          discord:
            show_progress: true
            show_source_logo: true
            show_urls: true
            show_ad: true
          spotify:
            enabled: true
            client_id: ${config.sops.placeholder.spotify_client_id}
            client_secret: ${config.sops.placeholder.spotify_client_secret}
            redirect_uri: http://localhost:8888/callback
          lastfm:
            enabled: false
            username: null
            api_key: null
          plex:
            enabled: true
            server_url: ${config.sops.placeholder.plex_server_url}
            token: ${config.sops.placeholder.plex_token}
            libraries: ${config.sops.placeholder.plex_libraries}
          soundcloud:
            enabled: true
          youtube:
            enabled: false
        '';
      };
    };
  };
}
