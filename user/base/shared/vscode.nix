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
        editor.formatOnSave = true;

        editor.fontFamily = "BerkeleyMono Nerd Font, monospace";

        workbench.colorTheme = "Darker Modern";

        chat.disableAIFeatures = true;

        nix.serverPath = "nixd";
        nix.enableLanguageServer = true;
        nix.hiddenLanguageServerErrors = [
          "textDocument/definition"
          "textDocument/formatting"
        ];
        nix.serverSettings = {
          nixd = {
            formatting = {
              command = ["alejandra"];
            };
          };
        };

        C_Cpp.intelliSenseEngine = "disabled";

        # disable annoying stuff
        biome.suggestInstallingGlobally = false;
        cmake.showConfigureWithDebuggerNotification = false;
        editor.inlayHints.enabled = "offUnlessPressed";
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
        # cmd+number to switch tabs
        {
          key = "cmd+1";
          command = "workbench.action.openEditorAtIndex1";
        }
        {
          key = "cmd+2";
          command = "workbench.action.openEditorAtIndex2";
        }
        {
          key = "cmd+3";
          command = "workbench.action.openEditorAtIndex3";
        }
        {
          key = "cmd+4";
          command = "workbench.action.openEditorAtIndex4";
        }
        {
          key = "cmd+5";
          command = "workbench.action.openEditorAtIndex5";
        }
        {
          key = "cmd+6";
          command = "workbench.action.openEditorAtIndex6";
        }
        {
          key = "cmd+7";
          command = "workbench.action.openEditorAtIndex7";
        }
        {
          key = "cmd+8";
          command = "workbench.action.openEditorAtIndex8";
        }
        {
          key = "cmd+9";
          command = "workbench.action.openEditorAtIndex9";
        }
      ];
    };
  };
}
