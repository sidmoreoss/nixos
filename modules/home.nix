{ ... }:

{ 
  imports =
    (import ./boot/home.nix) ++
    (import ./desktop/home.nix) ++
    (import ./fonts/home.nix) ++
    (import ./hardware/home.nix) ++
    (import ./locale/home.nix) ++
    (import ./services/home.nix) ++
    (import ./shell/home.nix) ++
    (import ./systemPackages/home.nix) ++
    (import ./users/home.nix) ++
    (import ./xdg/home.nix);
}
