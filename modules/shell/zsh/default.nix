{ pkgs, ... }:

{
  # Configure shell: https://nixos.wiki/wiki/Zsh
  programs = {
    zsh = {
      enable = true;  # Enable zsh

      shellAliases = {  # Add aliases here
        updateNixos = "cd ~/.setup/nixos && nix flake update";
        applyNixosConfiguration = "sudo nixos-rebuild switch --flake ~/.setup/nixos#dell7560";
      };

      autosuggestions.enable = true;  # Auto suggest options and highlights syntax, searches in history for options
      syntaxHighlighting.enable = true;  # Syntax highlighting

      histSize = 100000;
      histFile = "$HOME/.cache/zsh_history";

      ohMyZsh = {
        enable = true;  # Enable oh-my-zsh
        plugins = [ "git" ];  # Plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
        theme = "robbyrussell";  # Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
      };
    };
  };

  # Make zsh default shell for all users
  users.defaultUserShell = pkgs.zsh;  
  environment.shells = with pkgs; [ zsh ];
}
