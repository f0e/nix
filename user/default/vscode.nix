{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions;
        [
          jnoortheen.nix-ide
          charliermarsh.ruff
          biomejs.biome
          esbenp.prettier-vscode
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "tek-darker-modern";
            publisher = "tek";
            version = "0.1.3";
            sha256 = "sha256-gmeJVB7FzmZfeWrCuDnzcOCnLVrsxtcIUD6OtdJJvfE=";
          }
        ];

      userSettings = {
        editor.fontFamily = "\"CaskaydiaMono NF\", monospace";
        editor.formatOnSave = true;
        workbench.colorTheme = "Darker Modern";
        nix.serverPath = "nixd";
        nix.enableLanguageServer = true;
        nix.serverSettings = {
          nixd = {
            formatting = {
              command = ["alejandra"];
            };
          };
        };
        chat.disableAIFeatures = true;
      };

      keybindings = [
        # ctrl+tab to cycle through editor tabs like how normal people would expect it to work
        {
          key = "ctrl+tab";
          command = "workbench.action.nextEditor";
        }
        {
          key = "ctrl+shift+tab";
          command = "workbench.action.previousEditor";
        }
      ];
    };
  };
}
