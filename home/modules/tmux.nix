{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      tmux-floax
      yank
      prefix-highlight
      tmux-fzf
    ];

    tmuxinator = {
      enable = true;
      projects = {

        flake = {
          name = "flake";
          root = "~/flake";

          windows = [
            { editor = "nvim"; }
            { shell = ""; }
            { git = "lazygit"; }
          ];

        };

      };
    };

    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi V send-keys -X select-line
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind -T copy-mode-vi Escape send-keys -X cancel
    '';

    terminal = "tmux-256color";

  };
}
