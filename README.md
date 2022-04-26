# protune-transforms
GoPro Protune Transforms

The following are a series of GoPro Protune Input Transforms (IDT) for DaVinci Resolve.

Depending on the chosen Color Science, they can be used either in ACES or in DaVinci YRGB.

The Protune gamma curve is based off the Technicolor CineStyle gamma.



## Naming Convetion

All files with the exception of the ACES IDTs use the following naming convention:

`GoPro_Protune_<CAMERA-COLOR-SPACE>_<DESTINATION-COLOR-SPACE>_<DESTINATION-GAMMA>.dctl`


## Legacy vs V2

The Legacy Transforms are based off the derived color primaries identified from the colour dataset:
https://colour.readthedocs.io/en/v0.3.10/colour.models.rgb.dataset.gopro.html

These older transforms have now been moved into a Legacy directory for backwards compatibility.


The v2 transforms are based off the Native to sRGB color transform matrix revealed in an old instance of GoPro Studio (v2.3.0).

All subsequent transforms have been developed using the Native to XYZ matrix values derived from this source.
A slight margin of error must be factored in due to the 3 decimal place rounding on the source Native to sRGB matrix data.



## Installation

The DCTL files contain ACES IDTs and various Gamma/Gamut transforms.

Older instances of the transforms with the colour matrices are contained in the Legacy folder.


### LUT Folder
Save the non-ACES DCTL files in the LUT folder to the relevant location based on the host Operating System as noted below:

#### Windows
C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\LUT\

#### Mac
/Library/Application Support/Blackmagic Design/DaVinci Resolve/LUT

#### Linux
/home/resolve/LUT



### ACES IDT Folder

Note: If using Resolve 16 or below, copy the ACES DCTL files in the IDT folder to the designated LUT folder mentioned above.

If using Resolve 17 or above, The ACES DCTL files in the IDT folder must be copied to the appropriate IDT directory based on the host Operating System:


#### Windows
%APPDATA%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\IDT\

#### Mac
~/Library/Application Support/Blackmagic Design/DaVinci Resolve/ACES Transforms/IDT/

#### Linux
~/.local/share/DaVinciResolve/ACES Transforms/IDT/


## Usage

### ACES IDT

As of Resolve 17, the IDT can be loaded as an Input Transform via the Project settings.

As of Resolve 17.2, the IDT files can be selected as ACES Input Transforms for individual clips.


### DaVinci CTL or LUT Menu
Select the relevant dctl file via the DaVinci CTL or LUT Menu. Ensure Input Color Space is set to Bypass (or Same as Timeline) for the relevant clip. Ensure the selected DCTL matches with the project's Timeline Color Space and Gamma. Input DRT should be set to None.


To use in ACES via the LUT menu (or DaVinci CTL if using Resolve 16 or below), copy the IDT folder contents to the LUT folder and comment out the first few lines as follows:

```
//#if (__RESOLVE_VER_MAJOR__ >= 17)
//DEFINE_ACES_PARAM(IS_PARAMETRIC_ACES_TRANSFORM: 0)
//#endif
```




## ACEScc / ACEScct Transforms

#### GoPro_Protune_Native_ACES_v2.dctl
IDT for ACES using Protune (FLAT) Gamma with Native Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve

#### GoPro_Protune_Rec709_ACES.dctl
IDT for ACES using Protune (FLAT) Gamma with Rec.709 (non-Native) Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve

#### GoPro_Protune_Native_Bradford-CA_ACES.dctl (Legacy)
Legacy IDT for ACES using Protune (FLAT) Gamma with Native Color Space - with Bradford Chromatic Adaptation (For test purposes only)

#### GoPro_Protune_Rec709_Bradford-CA_ACES.dctl (Legacy)
Legacy IDT for ACES using Protune (FLAT) Gamma with Rec.709 (non-Native) Color Space - with Bradford Chromatic Adaptation (For test purposes only)



## DaVinci Intermediate Transforms

#### GoPro_Protune_Native_DWG_DaVinci-Intermediate_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to DaVinci Wide Gamut and DaVinci Intermediate

#### GoPro_Protune_Native_Rec2020_DaVinci-Intermediate_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.2020 and DaVinci Intermediate

#### GoPro_Protune_Rec709_DWG_DaVinci-Intermediate.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to DaVinci Wide Gamut and DaVinci Intermediate

#### GoPro_Protune_Rec709_Rec2020_DaVinci-Intermediate.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.2020 and DaVinci Intermediate



## Other DaVinci YRGB Transforms

#### GoPro_Protune_Native_Rec709_Scene_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Scene

#### GoPro_Protune_Rec709_Rec709_Scene.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Scene

#### GoPro_Protune_Native_Rec709_Gamma-2.2_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Gamma 2.2

#### GoPro_Protune_Rec709_Rec709_Gamma-2.2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.2

#### GoPro_Protune_Native_Rec709_Gamma-2.4_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Gamma 2.4

#### GoPro_Protune_Native_Rec709_Gamma-2.6_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Gamma 2.6

#### GoPro_Protune_Rec709_Rec709_Gamma-2.4.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.4

#### GoPro_Protune_Rec709_Rec709_Gamma-2.6.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.6

#### GoPro_Protune_Native_P3-D65_Scene_v2_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to P3-D65 Scene

#### GoPro_Protune_Native_P3-D65_Gamma-2.2_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to P3-D65 Gamma 2.2

#### GoPro_Protune_Native_P3-D65_Gamma-2.4_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to P3-D65 Gamma 2.4

#### GoPro_Protune_Native_P3-D65_Gamma-2.6_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to P3-D65 Gamma 2.6

#### GoPro_Protune_Native_DCI-P3_Gamma-2.6_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to DCI-P3 Gamma 2.6

