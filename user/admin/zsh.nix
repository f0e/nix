{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    initContent = lib.mkBefore ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    # use system powerlevel10k package
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    antidote = {
      enable = true;
      plugins = [
        # zsh
        "romkatv/zsh-bench kind:path"
        "romkatv/zsh-defer"
        "mattmc3/ez-compinit"
        "zsh-users/zsh-completions kind:fpath path:src"
        "Aloxaf/fzf-tab"

        # oh my zsh
        # "getantidote/use-omz"
        # "ohmyzsh/ohmyzsh path:plugins/magic-enter"
        "ohmyzsh/ohmyzsh path:plugins/extract"

        # fish-like features
        "zdharma-continuum/fast-syntax-highlighting"
        # "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-history-substring-search"

        # misc
        "blimmer/zsh-aws-vault"
        "mroth/evalcache"
        "wfxr/forgit"
        "https://gitlab.com/jonas-l/p10k-aws-vault-segment"
        "kilianpaquier/zsh-plugins path:mise-completion"
      ];
    };
  };
}
