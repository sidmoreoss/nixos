{ ... }: 
{
  # Pipewire config for no resampling
  xdg.configFile."pipewire/pipewire.conf.d/pipewire.conf".text = 
    ''  
    {
      context.properties = {
        # default.clock.rate = 48000;
        default.clock.allowed-rates = [ 44100 48000 88200 96000 192000 384000 ]
        # default.clock.min-quantum = 1024
      };
    }
    '';

  xdg.configFile."pipewire/pipewire-pulse.conf.d/pipewire-pulse.conf".text = 
    ''
    {  
      stream.properties = {
          resample.quality = 15
      }
    }
    '';

  xdg.configFile."pipewire/client.conf.d/client.conf".text = 
    ''
    {  
      stream.properties = {
          resample.quality = 15
      }
    }
    '';
}