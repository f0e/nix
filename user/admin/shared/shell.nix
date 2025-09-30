{...}: {
  programs.fish.enable = true;

  programs.zsh = {
    initContent = ''
      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
      then
          exec fish -l
      fi
    '';
  };
}
