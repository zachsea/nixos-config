{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
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
        clangd = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        # qml is not in extras, entries added in treesitterParsers, extraPackages, plugins
      };
    };

    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      qmljs
      qmldir # optional: for qmldir module-manifest files
    ];

    extraPackages = with pkgs; [
      nil # Nix LSP
      alejandra # Nix formatter
      statix

      # qml
      kdePackages.qtdeclarative
      # cpp
      clang-tools
    ];

    config = {
      keymaps = ''
        vim.keymap.set("i", "jj", "<Esc>")
      '';
    };

    plugins = {
      ccc = inputs.lazyvim.lib.lazyConfig {
        plugin = "uga-rosa/ccc.nvim";
        event = [
          "BufReadPre"
          "BufNewFile"
        ];
        cmd = [
          "CccPick"
          "CccConvert"
          "CccHighlighterToggle"
        ];
        keys = lib.generators.mkLuaInline ''
          {
            { "<leader>cc", "<cmd>CccPick<cr>", desc = "Color Picker" },
            { "<leader>ch", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Color Highlighter" },
          }
        '';
        opts = {
          highlighter = {
            auto_enable = true;
            lsp = true;
          };
        };
      };
      colorscheme = inputs.lazyvim.lib.lazyConfig {
        plugin = "folke/tokyonight.nvim";
        opts = {
          transparent = true;
          style = "night";
          styles = {
            sidebars = "transparent";
            floats = "transparent";
          };
          on_colors = lib.generators.mkLuaInline (
            let
              c = config.lib.stylix.colors.withHashtag;
            in
            ''
              function(colors)
                colors.bg = "${c.base00}"
                colors.bg_dark = "${c.base01}"
                colors.bg_highlight = "${c.base02}"
                colors.fg = "${c.base05}"
                colors.fg_dark = "${c.base04}"
                colors.comment = "${c.base03}"
                colors.red = "${c.base08}"
                colors.orange = "${c.base09}"
                colors.yellow = "${c.base0A}"
                colors.green = "${c.base0B}"
                colors.cyan = "${c.base0C}"
                colors.blue = "${c.base0D}"
                colors.magenta = "${c.base0E}"
                colors.purple = "${c.base0E}"
              end
            ''
          );
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
      qml = inputs.lazyvim.lib.lazyConfig {
        plugin = "neovim/nvim-lspconfig";
        opts.servers.qmlls = {
          cmd = [
            "qmlls"
            "-E"
          ]; # -E: read import paths from QML_IMPORT_PATH/QML2_IMPORT_PATH
          mason = false;
        };
      };
      conform = inputs.lazyvim.lib.lazyConfig {
        plugin = "stevearc/conform.nvim";
        opts = {
          formatters_by_ft = {
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
          };
        };
      };
    };
  };
  # clang stuff
  home.file.".clang-format".text = ''
    BasedOnStyle: LLVM
    PointerAlignment: Left
  '';
}
