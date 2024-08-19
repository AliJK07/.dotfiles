{
  description = "ali flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    nix-inspect.url = "github:bluskript/nix-inspect";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nil_ls.url = "github:oxalica/nil";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    tmux-sessionx = {
      url = "github:omerxx/tmux-sessionx/main";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    vim-processing.url = "github:sophacles/vim-processing";
    vim-processing.flake = false;
    glslView-nvim = {
      url = "github:timtro/glslView-nvim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      pc = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit pkgs-stable;
        };
        modules = [
          # inputs.home-manager.nixosModules.default
          ./hosts/pc/configuration.nix
        ];
      };
      lap = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit pkgs-stable;
        };
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/lap/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      ali = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit pkgs-stable;
        };
        modules = [./hosts/pc/home.nix];
      };
    };
  };
}
