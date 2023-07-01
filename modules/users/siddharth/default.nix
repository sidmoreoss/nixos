{ ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.siddharth = {
    isNormalUser = true;
    description = "siddharth";
    extraGroups = [ "networkmanager" "wheel" "storage" ];
  };
}