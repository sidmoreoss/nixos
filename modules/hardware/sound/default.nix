{ ... }:

{
  sound.enable = true;  # Enable ALSA sound
  # security.rtkit.enable = true;  # Realtime scheduling mode, causes clipping
  services.pipewire = {
    enable = true;  # Enable sound with pipewire.
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
