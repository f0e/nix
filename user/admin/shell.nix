{...}: {
  programs.fish.enable = true;

  programs.zsh = {
    initExtra = ''
      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
      then
          exec fish -l
      fi
    '';
  };
}
