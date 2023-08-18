{ pkgs, ... }: {

    nixpkgs = {
        overlays = [ (self: super:
            let
                lazynvim = super.vimUtils.buildVimPluginFrom2Nix {
                    name = "lazynvim";
                    src  = pkgs.fetchFromGitHub {
                        owner  = "sidmoreoss";
                        repo   = "nvim";
                        rev    = "1.0.0";
                        sha256 = "sha256-EwUCOdI7g3XNHGoP9xjyLbpMWOSS/iEJxyuhIsrLs6A=";
                    };
                };
            in {
                vimPlugins = super.vimPlugins // { inherit lazynvim; };
            }
        ) ];
    };

    programs.neovim = {
        defaultEditor = true;
        enable = true;
        vimAlias = true;
        viAlias = true;
        withNodeJs = true;
        configure = {
            # This is required https://nixos.wiki/wiki/Neovim
            customRC = ''
                lua << EOF
                   require("lazynvim")
                EOF
            '';
            packages.vimPlugins = with pkgs.vimPlugins; {
                # loaded on launch
                start = [ 
                    vim-nix 
                    vim-fugitive 
                    vim-floaterm
                    gitsigns-nvim
                    harpoon
                    lsp-zero-nvim
                    refactoring-nvim
                    telescope-nvim
                    nerdcommenter
                    noice-nvim
                    nvim-treesitter.withAllGrammars
                    nvim-treesitter-context
                    trouble-nvim
                    undotree
                    zen-mode-nvim
                    lazynvim 
                ];
            };
        };
    };
}
