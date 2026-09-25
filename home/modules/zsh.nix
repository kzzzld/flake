{ ... }: {
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      "ls" = "eza -l --icons=always --color=always";
    };

    sessionVariables = {
      EDITOR = "nvim";
      PATH = "$PATH:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$HOME/Git/signal-cli/bin:$HOME/.cargo/bin:$HOME/.local/bin";
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
