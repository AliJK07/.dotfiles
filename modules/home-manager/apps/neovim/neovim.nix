{
  pkgs,
  inputs,
  ...
}: {
  xdg.configFile.nvim.source = ./nvim;
  # home.file.".config/nvim" = {
  #   source = ./config;
  #   recursive = true;
  # };
  # home.file.".config/nvim/ftplugin/java.lua".text = ''
  #   local config = {
  #    cmd = { "${pkgs.jdt-language-server}/bin/jdtls" },
  #    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  #   }
  #   require("jdtls").start_or_attach(config)
  # '';
  nixpkgs.overlays = [
    (final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          vim-processing = prev.vimUtils.buildVimPlugin {
            name = "vim-processing";
            src = inputs.vim-processing;
          };
          glslView-nvim = prev.vimUtils.buildVimPlugin {
            name = "glslView-nvim";
            src = inputs.glslView-nvim;
          };
        };
    })
  ];
  programs.neovim = {
    enable = true;
    withPython3 = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    # extraLuaConfig = ''require("alivim")'';

    extraPackages = with pkgs; [
      shaderc
      neofetch
      glslls
      gcc
      fd
      ripgrep
      statix
      alejandra
      deadnix
      stylua
      lua-language-server
      jdt-language-server
      google-java-format
      astyle
      fzf
      inputs.nil_ls.packages.${pkgs.system}.nil
    ];
    plugins = let
      nvim-treesitter-with-plugins = pkgs.vimPlugins.nvim-treesitter.withPlugins (treesitter-plugins:
        with treesitter-plugins; [
          bash
          c
          cpp
          lua
          nix
          python
          zig
        ]);
    in
      with pkgs.vimPlugins; [
        tokyonight-nvim
        obsidian-nvim
        vim-obsession
        glslView-nvim
        vim-processing
        hardtime-nvim
        # fidget-nvim
        vim-glsl
        firenvim
        nvim-jdtls
        vim-tmux-navigator
        gruvbox-nvim
        nvim-lspconfig
        comment-nvim
        none-ls-nvim
        neodev-nvim
        nvim-cmp
        telescope-nvim
        mini-nvim
        which-key-nvim
        nvim-autopairs
        telescope-fzf-native-nvim
        cmp_luasnip
        cmp-nvim-lsp
        cmp-path
        luasnip
        friendly-snippets
        lualine-nvim
        nvim-web-devicons
        nvim-treesitter-with-plugins
        vim-nix
      ];
  };
}
