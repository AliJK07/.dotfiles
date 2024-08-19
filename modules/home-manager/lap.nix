{ ... }:
{
  programs.fish.shellAliases = {
    nixb = "sudo nixos-rebuild switch --flake ~/.dotfiles/#lap";
  };
}
