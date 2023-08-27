{ pkgs, ... }: {

    nixpkgs = {
        overlays = [ (self: super:
            let
                lazynvim = super.vimUtils.buildVimPluginFrom2Nix {
                    name = "lazynvim";
                    src  = pkgs.fetchFromGitHub {
                        owner  = "sidmoreoss";
                        repo   = "nvim";
                        rev    = "daa4231bcb776f547fec51482c07998237b81f28";
                        sha256 = "sha256-nb//D/P6IfNOXBDywae56Zx+qmmxUHvQf+e0ivnud64=";
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
                    nvim-tree-lua
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
