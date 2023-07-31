{ pkgs, ... }:{
  # Breeze with materia icons theme
  xdg.dataFile."plasma/desktoptheme/breezeWithMateriaIcons/icons" = {
    source = pkgs.fetchFromGitHub {
      owner = "PapirusDevelopmentTeam";
      repo = "materia-kde";
      rev = "master";
      sha256 = "tZWEVq2VYIvsQyFyMp7VVU1INbO7qikpQs4mYwghAVM=";
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