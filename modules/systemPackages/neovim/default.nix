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
                    # Git
                    gitsigns-nvim
                    vim-fugitive 

                    # Terminal
                    vim-floaterm

                    # Languages
                    cmp-buffer
                    cmp-path
                    cmp-nvim-lua
                    cmp-nvim-lsp
                    cmp_luasnip
                    lualine-nvim
                    lsp-zero-nvim
                    nerdcommenter
                    nvim-cmp
                    nvim-lspconfig
                    nvim-treesitter.withAllGrammars
                    nvim-treesitter-context
                    vim-nix

                    # Utils
                    harpoon
                    noice-nvim
                    refactoring-nvim
                    telescope-nvim
                    trouble-nvim
                    undotree
                    zen-mode-nvim

                    #File browser
                    nvim-tree-lua
                    
                    #My config
                    lazynvim 
                ];
            };
        };
    };
}
