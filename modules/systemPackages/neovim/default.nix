{ pkgs, ... }: {

    nixpkgs = {
        overlays = [ (self: super:
            let
                lazynvim = super.vimUtils.buildVimPluginFrom2Nix {
                    name = "lazynvim";
                    src  = pkgs.fetchFromGitHub {
                        owner  = "sidmoreoss";
                        repo   = "nvim";
                        rev    = "master";
                        sha256 = "sha256-WdzPnZcFmETdCQ3AT+wXq1/ukSHsr9Yg23zmb4a/58k=";
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
                    harpoon
                    lsp-zero-nvim
                    refactoring-nvim
                    telescope-nvim
                    nvim-treesitter
                    trouble-nvim
                    undotree
                    zen-mode-nvim
                    lazynvim 
                ];
            };
        };
    };
}
