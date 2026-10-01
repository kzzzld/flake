{
  pkgs,
  lib,
  ...
}: {
  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        bbenoist.nix
        ms-python.python
      ];

      userSettings = {
        "[nix]" = {
          "editor.tabSize" = lib.mkForce 2;
        };

        "files.autoSave" = lib.mkForce "off";

        "editor.fontFamily" = lib.mkForce "Iosevka Nerd Font";
        "terminal.integrated.fontFamily" = lib.mkForce "Iosevka Nerd Font";
        "editor.inlayHints.fontFamily" = lib.mkForce "Iosevka Nerd Font";
        "workbench.fontFamily" = lib.mkForce "Iosevka Nerd Font";
        "window.titleBarStyle" = lib.mkForce "native";
        "window.menuBarVisibility" = lib.mkForce "toggle";

        "vim.leader" = "<space>";
        "vim.useSystemClipboard" = true;
        "vim.hlsearch" = true;

        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            "before" = ["<leader>" "w"];
            "commands" = [":w"];
          }

          {
            "before" = ["<leader>" "q"];
            "commands" = [":q"];
          }

          {
            "before" = ["<C-h>"];
            "commands" = ["workbench.action.focusLeftGroup"];
          }

          {
            "before" = ["<C-l>"];
            "commands" = ["workbench.action.focusRightGroup"];
          }

          {
            "before" = ["<C-j>"];
            "commands" = ["workbench.action.focusBelowGroup"];
          }

          {
            "before" = ["<C-k>"];
            "commands" = ["workbench.action.focusAboveGroup"];
          }

          {
            "before" = ["<leader>" "f" "f"];
            "commands" = ["workbench.action.quickOpen"];
          }

          {
            "before" = ["<leader>" "/"];
            "commands" = ["workbench.action.showCommands"];
          }

          {
            "before" = ["<S-l>"];
            "commands" = ["workbench.action.nextEditor"];
          }

          {
            "before" = ["<S-h>"];
            "commands" = ["workbench.action.previousEditor"];
          }

          {
            "before" = ["<leader>" "g" "g"];
            "commands" = ["workbench.view.scm"];
          }

          {
            "before" = ["<leader>" "e"];
            "commands" = ["workbench.files.action.focusFilesExplorer"];
          }

          {
            "before" = ["<C-t>"];
            "commands" = ["workbench.action.terminal.toggleTerminal"];
          }
        ];
      };
    };
  };
}
