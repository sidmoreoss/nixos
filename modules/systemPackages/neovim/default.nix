{ pkgs, ... }: {

    nixpkgs = {
        overlays = [ (self: super:
            let
                myNvimPlugin = super.vimUtils.buildVimPluginFrom2Nix {
                    name = "myNvimPlugin";
                    src  = pkgs.fetchFromGitHub {
                        owner  = "sidmoreoss";
                        repo   = "nvim";
                        rev    = "master";
                        sha256 = "sha256-apt4wnHwlZgwdAYQeCgkQDxBDPQ2/Oxo5PTzYNtF1Fg=";
                    };
                };
            in {
                vimPlugins = super.vimPlugins // { inherit myNvimPlugin; };
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
                    require("main")
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
                    myNvimPlugin
                ];
            };
        };
    };
}
