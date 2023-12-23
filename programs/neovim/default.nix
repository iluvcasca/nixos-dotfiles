{ config, pkgs, inputs, ... }:
{
  nixpkgs = {
    overlays = [

      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          cellular-automaton-nvim = prev.vimUtils.buildVimPlugin {
            name = "cellular-automaton";
            src = inputs.plugin-cellular-automaton;
          };
        };
      })

      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          betterTerm-nvim = prev.vimUtils.buildVimPlugin {
            name = "betterTerm.nvim";
            src = inputs.plugin-betterTerm-nvim;
          };
        };
      })

      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          header_42-vim = prev.vimUtils.buildVimPlugin {
            name = "header_42-vim";
            src = inputs.plugin-header_42-vim;
          };
        };
      })

    ];
  };

programs.neovim = 
let
	toLua = str: "lua << EOF\n${str}\nEOF\n";
	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      ccls
      nodePackages.bash-language-server      
      nodePackages.pyright
      vscode-extensions.vadimcn.vscode-lldb
      nixfmt
      clang-tools
    ];

	plugins = with pkgs.vimPlugins; [
        {
            plugin = betterTerm-nvim;
            config = toLua "require('betterTerm').setup()";
        }

		{
			plugin = nvim-lspconfig;
			config = toLuaFile ./lua/plugins/lsp.lua;
		}
        {
          plugin = nvim-dap-ui;
          config = toLuaFile ./lua/plugins/dap-ui.lua;
        }
        header_42-vim
        harpoon        
        nvim-dap
        undotree
		neodev-nvim
		cmp_luasnip
		cmp-nvim-lsp
		luasnip
		friendly-snippets
		vim-nix
        vim-fugitive
        cellular-automaton-nvim
        {
          plugin = nvim-colorizer-lua;
          config = toLua "require('colorizer').setup()";
        }
		{
			plugin = nvim-cmp;
			config = toLuaFile ./lua/plugins/cmp.lua;
		}
        {
          plugin = null-ls-nvim;
          config = toLuaFile ./lua/plugins/null-ls.lua;
        }
        {
          plugin = kanagawa-nvim;
          config = toLuaFile ./lua/plugins/kanagawa.lua;
        }
		{
          plugin = nvim-treesitter.withAllGrammars;
			config = toLuaFile ./lua/plugins/treesitter.lua;
		}
		{
			plugin = telescope-nvim;
			config = toLuaFile ./lua/plugins/telescope.lua;
		}
		telescope-fzf-native-nvim
		nvim-web-devicons
		{
			plugin = comment-nvim;
			config = toLua "require('Comment').setup()";
		}
		{
			plugin = lualine-nvim;
			config = toLuaFile ./lua/plugins/lualine.lua;
		}
		];
    extraLuaConfig = ''
    ${builtins.readFile ./lua/options.lua}
    ${builtins.readFile ./lua/remap.lua}
    '';
      };
  }
