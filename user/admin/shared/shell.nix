{...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # enable uv completions if using
      if type -q uv
          uv generate-shell-completion fish | source
      end
    '';
  };

  programs.zsh = {
    initContent = ''
      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
      then
          exec fish -l
      fi
    '';
  };
}
