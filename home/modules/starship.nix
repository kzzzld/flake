{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      character = {
	success_symbol = "[➜](bold green) ";
      };
    };
  };
}
