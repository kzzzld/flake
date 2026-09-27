{ inputs, config, ... }: {
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    lsp.servers = {
      clangd.enable = true;
      nixd.enable = true;
    };

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      lspconfig.enable = true;
      which-key.enable = true;
      nvim-autopairs.enable = true;
      todo-comments.enable = true;

      blink-cmp = {
	enable = true;
	settings = {
	  appearance = {
	    nerd_font_variant = "normal";
	  };
	  completion = {
	    accept = {
	      auto_brackets = {
		enabled = true;
		semantic_token_resolution = {
		  enabled = false;
		};
	      };
	    };
	    documentation = {
	      auto_show = true;
	    };
	  };
	  keymap = {
	    preset = "super-tab";
	  };
	  signature = {
	    enabled = true;
	  };
	  sources = {
	    default = [
	      "lsp"
	      "path"
	      "buffer"
	    ];
	    cmdline = [ ];
	    providers = {
	      buffer = {
		score_offset = -7;
	      };
	      lsp = {
		fallbacks = [ ];
	      };
	    };
	  };
	};
      };

      friendly-snippets.enable = true;

      snacks = {
        enable = true;
        settings = {
          terminal.enable = true;
          lazygit.enable = true;
          bigfile.enable = true;
          picker.enable = true;
        };
      };

    treesitter = {
      enable = true;

      grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };

  };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      clipboard = "unnamedplus";
    };

    globals.mapleader = " ";
    keymaps = [
      {
	action.__raw = "function() Snacks.picker.files() end";
	key = "<leader>ff";
      }

      {
	action.__raw = "function() Snacks.picker.explorer() end";
	key = "<leader>e";
      }

      {
      mode = "v";
      key = "<";
      action = "<gv";
      }

      {
	mode = "v";
	key = ">";
	action = ">gv";
      }

      {
      key = "H";
      action = "<cmd>bp<cr>";
      }

      {
      key = "L";
      action = "<cmd>bn<cr>";
      }
    ];
  };
}
