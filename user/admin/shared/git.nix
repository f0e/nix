{
  inputs,
  lib,
  config,
  ...
}: {
  programs.git = {
    delta.enable = true;

    lfs.enable = true;

    # difftastic {
    #   enable = true;

    #   background = "dark";
    # };

    extraConfig = {
      core.editor = "nvim";

      commit.verbose = true;

      log.date = "iso";
      column.ui = "auto";

      branch.sort = "-committerdate";
      tag.sort = "version:refname";

      diff.algorithm = "histogram";
      # diff.colorMoved = "default";

      pull.rebase = true;
      # push.autoSetupRemote = true;

      merge.conflictStyle = "zdiff3";

      rebase.autoSquash = true;
      rebase.autoStash = true;
      rebase.updateRefs = true;
      # rerere.enabled = true;

      # fetch.fsckObjects = true;
      # receive.fsckObjects = true;
      # transfer.fsckobjects = true;

      # https://bernsteinbear.com/git
      alias.recent = "! git branch --sort=-committerdate --format=\"%(committerdate:relative)%09%(refname:short)\" | head -10";

      # nicer log
      alias.lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative";

      # `git log` with patches shown with difftastic
      alias.dl = "-c diff.external=difft log -p --ext-diff";

      # Show the most recent commit with difftastic
      alias.ds = "-c diff.external=difft show --ext-diff";

      # `git diff` with difftastic
      alias.dft = "-c diff.external=difft diff";

      # todo: commit signing
    };
  };
}
