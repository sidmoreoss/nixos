{ pkgs, ... }:{
  # Learn how to filter files from source: https://www.youtube.com/watch?v=mOQI9Iiu4Uc
  # Breeze with materia icons theme
  xdg.dataFile."plasma/desktoptheme/breezeWithMateriaIcons/icons" = {
    source = pkgs.fetchFromGitHub {
      owner = "PapirusDevelopmentTeam";
      repo = "materia-kde";
      rev = "20220823";
      sha256 = "sha256-/O+/L6C9WjxhfWZ8RzIeimNU+8sjKvbDvQwNlvVOjU4=";
    } + "/plasma/desktoptheme/Materia/icons";
    recursive = true;
  };

  xdg.dataFile."plasma/desktoptheme/breezeWithMateriaIcons/metadata.json" = {
    text = ''
      {
          "KPlugin": {
              "Authors": [
                  {
                      "Email": "sidmoreoss@gmail.com",
                      "Name": "Siddharth More"
                  }
              ],
              "Category": "",
              "Description": "Breeze with materia icons for better antialiasing",
              "EnabledByDefault": true,
              "Id": "breezeWithMateriaIcons",
              "License": "LGPL",
              "Name": "Breeze with Materia icons",
              "Version": "5.106.0",
              "Website": "https://plasma.kde.org"
          },
          "X-Plasma-API": "5.0"
      }
    '';
  };

  xdg.dataFile."plasma/desktoptheme/breezeWithMateriaIcons/plasmarc" = {
    text = ''
      [ContrastEffect]
      enabled=true
      contrast=0.2
      intensity=1.4
      saturation=10

      [AdaptiveTransparency]
      enabled=true
    '';
  };
}