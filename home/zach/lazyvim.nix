{ pkgs, inputs, lib, ... }:
{
  imports = [
    inputs.lazyvim.homeManagerModules.default
  ];

  programs.lazyvim = {
    enable = true;

    extras = {
      lang = {
        nix = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        python = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        go = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
      };
    };

    extraPackages = with pkgs; [
      nixd       # Nix LSP
      alejandra  # Nix formatter
      statix
    ];

    config = {
      keymaps = ''
        vim.keymap.set("i", "jj", "<Esc>")
      '';
    };

    plugins = {
      colorscheme = inputs.lazyvim.lib.lazyConfig {
        plugin = "folke/tokyonight.nvim";
        opts = {
          transparent = true;
          style = "night";
          styles = {
            sidebars = "transparent";
            floats = "transparent";
          };
        };
      };
      presence = inputs.lazyvim.lib.lazyConfig {
        plugin = "andweeb/presence.nvim";
      };
      toggleterm = inputs.lazyvim.lib.lazyConfig {
        plugin = "akinsho/toggleterm.nvim";
        keys = lib.generators.mkLuaInline ''
          {
            {
              "<leader>Tf",
              function()
                require("toggleterm").toggle(vim.v.count1, 0, LazyVim.root.get(), "float")
              end,
              desc = "Terminal (float)",
            },
            {
              "<leader>Th",
              function()
                require("toggleterm").toggle(vim.v.count1, 15, LazyVim.root.get(), "horizontal")
              end,
              desc = "Terminal (horizontal)",
            },
            {
              "<leader>Tv",
              function()
                require("toggleterm").toggle(vim.v.count1, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
              end,
              desc = "Terminal (vertical)",
            },
          }
        '';
        opts = {
          open_mapping = "<c-\\>";
          direction = "horizontal";
          start_in_insert = true;
          persist_size = true;
          close_on_exit = true;
          shade_terminals = true;
        };
      };
    };
  };
}
