{ ... }:

{ 
  imports =
    (import ./boot) ++
    (import ./desktop) ++
    (import ./fonts) ++
    (import ./hardware) ++
    (import ./locale) ++
    (import ./services) ++
    (import ./shell) ++
    (import ./systemPackages) ++
    (import ./users) ++
    (import ./xdg);
}
