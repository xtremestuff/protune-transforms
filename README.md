# protune-transforms
GoPro Protune Transforms

The following are a series of GoPro Protune Input Transforms (IDT) for DaVinci Resolve.

Depending on the Color Science, they can be used either in ACES or in DaVinci YRGB

## Installation

Save the DCTL files to the following Locations:

Windows: C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\LUT\

Mac: /Library/Application Support/Blackmagic Design/DaVinci Resolve/LUT

Linux: /home/resolve/LUT


### Resolve 17 ACES IDT

As of Resolve 17, the DCTL files should be loaded as an Input Transform via the Project settings

Only the ACES DCTL files must be copied to the appropriate IDT folder:


Windows: %APPDATA%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\IDT\

Mac: ~/Library/Application Support/Blackmagic Design/DaVinci Resolve/ACES Transforms/IDT/

Linux: ~/.local/share/DaVinciResolve/ACES Transforms/IDT/



## ACEScc / ACEScct Transforms

* GoPro_Protune_Native_ACES.dctl - IDT for ACES using Protune (FLAT) Gamma with Native Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve
* GoPro_Protune_Native_Bradford-CA_ACES.dctl - IDT for ACES using Protune (FLAT) Gamma with Native Color Space - with Bradford Chromatic Adaptation
* GoPro_Protune_Rec709_ACES.dctl - IDT for ACES using Protune (FLAT) Gamma with Rec.709 (non-Native) Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve
* GoPro_Protune_Rec709_Bradford-CA_ACES.dctl - IDT for ACES using Protune (FLAT) Gamma with Rec.709 (non-Native) Color Space - with Bradford Chromatic Adaptation


## DaVinci YRGB Transforms

* GoPro_Protune_Native_Rec709_Scene.dctl - Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Scene
* GoPro_Protune_Rec709_Rec709_Scene.dctl - Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Scene

