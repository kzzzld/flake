{...}: {
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "ls" = "eza -l --icons=always --color=always";
      "mux" = "tmuxinator";
    };

    sessionVariables = {
      EDITOR = "nvim";
      PATH = "$PATH:$HOME/.local/bin";
    };

    initExtra = ''
      [ -f ~/.secrets ] && source ~/.secrets

      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
      set -o vi

      fastfetch -c neofetch
      echo
      tmux list-sessions 2>/dev/null
    '';
  };
}
