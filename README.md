# protune-transforms
GoPro Protune Transforms

The following are a series of GoPro Protune Input Transforms (IDT) and Output Transforms (ODT) for DaVinci Resolve.

Depending on the chosen Color Science, they can be used either in ACES or in DaVinci YRGB.

The Protune gamma curve is based off the Technicolor CineStyle gamma.



## Naming Convetion

All files with the exception of the ACES IDTs & ODTs use the following naming convention:

`GoPro_Protune_<CAMERA-COLOR-SPACE>_<DESTINATION-COLOR-SPACE>_<DESTINATION-GAMMA>.dctl`


## Legacy vs v2 Transforms

The Legacy Transforms are based off the color primaries identified from the colour dataset that has been reverse engineered:
https://colour.readthedocs.io/en/v0.3.10/colour.models.rgb.dataset.gopro.html

These older transforms have now been moved into a Legacy directory for backwards compatibility.

The v2 transforms are based off the Native to sRGB color transform matrix revealed in an old instance of GoPro Studio (v2.5.11).

All subsequent transforms have been developed using the Native to XYZ matrix values derived from this source.

**As confirmed by David Newman from GoPro, the Native to sRGB matrix was calculated with the IMX117 sensor which was used for earlier GoPro models up to Hero 5.**

**Recent GoPro camera releases have different sensors but they appear to use the same color matrix data. <sup>#<sup>**

> **<sup>#</sup> Important:**
> Whilst all GoPros appear to use the same Color Matrices, the raw gains applied for Native White Balance are different between the various imaging sensors and even within the models using the same sensors. The resulting XYZ Matrix will be different for each GoPro model.
> <br>There will be slight color variations when the "Native" color transforms (based off the IMX117 sensor) are used across the different GoPro iterations. The Rec.709 Gamut based transforms should work across all variations regardless.

The imaging sensors and their associated GoPro models are listed below:

| Sensor    | Camera           |
|-----------|------------------|
| IMX117    | Hero 3 Black<br>Hero 3+ Black<br>Hero 4 Black<br>Hero 5 Black  |
| IMX277    | Hero 6 Black<br>Hero 7 Black<br>Hero 8 Black  |
| IMX677(L) | Hero 9 Black<br>Hero 10 Black<br>Hero 11 Black<br>Hero 12 Black |


The Native to XYZ matrix (for IMX117 based GoPro HERO5) is derived as below *:

                 [ 0.501918     0.294524      0.154014 ]
                 [ 0.138173     0.913553     -0.051725 ]
                 [ 0.078774    -0.320766      1.331049 ]

> <sub>* A slight margin of error must be factored in due to the 3 decimal place rounding on the source Native to sRGB matrix data.</sub>

For camera specific profiles, including WIDE=1, custom LOGB parameters and Tungsten presets, refer to the commercially available GP-Tune Transform instead: https://xtremestuff.net/store/gp-tune-transform/


## Installation

The DCTL files contain ACES IDTs, ODTs and various Gamma/Gamut transforms.

Older instances of the transforms with the colour derived matrices are contained in the Legacy folder.

Installation can be done automatically by using the included Windows batch file and/or the *nix (Linux/Unix) shell script.

Manual installation details are listed in the sections below.


### LUT Folder
Save the non-ACES DCTL files in the LUT folder to the relevant location based on the host Operating System as noted below:

#### Windows
C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\LUT\

#### Mac
/Library/Application Support/Blackmagic Design/DaVinci Resolve/LUT

#### iPad
LUT folder located within DaVinci Resolve App

#### Linux
/home/resolve/LUT

or

/opt/resolve/LUT



### ACES IDT Folder

Note: If using Resolve 16 or below, copy the ACES DCTL files in the IDT folder to the designated LUT folder mentioned above.

If using Resolve 17 or above, The ACES DCTL files in the IDT folder must be copied to the appropriate IDT directory based on the host Operating System:


#### Windows
%APPDATA%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\IDT\

#### Mac
~/Library/Application Support/Blackmagic Design/DaVinci Resolve/ACES Transforms/IDT/

#### iPad
Not possible with current release. Follow instructions to use via [LUT Menu](#usage-in-davinci-ctl-or-via-lut-menu) instead

#### Linux
~/.local/share/DaVinciResolve/ACES Transforms/IDT/


### ACES ODT Folder

Note: If using Resolve 16 or below, copy the ACES DCTL files in the ODT folder to the designated LUT folder mentioned above.

If using Resolve 17 or above, The ACES DCTL files in the ODT folder must be copied to the appropriate IDT directory based on the host Operating System:


#### Windows
%APPDATA%\Blackmagic Design\DaVinci Resolve\Support\ACES Transforms\ODT\

#### Mac
~/Library/Application Support/Blackmagic Design/DaVinci Resolve/ACES Transforms/ODT/

#### iPad
Not possible with current release.

#### Linux
~/.local/share/DaVinciResolve/ACES Transforms/ODT/

## Usage

### Exposure Notes

The Protune Gamma curve is defined within the 0 - 1 range with the peak being equivalent to SDR Peak White. Despite this, the curve has a significantly higher Middle Gray value of 68% IRE. A significant portion of the curve is allocated to the lower code values under Middle Gray. This means that when footage is corrected using the transforms, anything under-exposed will be pushed further towards the shadows. To counteract this, the footage should either be exposed correctly, or under-exposed by 1-2 stops when recording and adjusted in accordingly after applying the transform.

### DaVinci YRGB Color Science

#### Usage in DaVinci CTL or via LUT Menu
Select the relevant dctl file via the LUT menu (or DaVinci CTL if using Resolve 16 or below). Ensure Input Color Space is set to Bypass (or Same as Timeline) for the relevant clip. Ensure the selected DCTL matches with the project's Timeline Color Space and Gamma. Input DRT should be set to None.


### ACES Color Science

#### Usage as ACES IDT or ODT

As of Resolve 17, the IDT can be loaded as an Input Transform via the Project settings and the ODT can also be loaded as an Output Transform via the Project settings.

As of Resolve 17.2, the IDT files can be selected as ACES Input Transforms for individual clips.


#### Usage via ACES Transforms

The IDT and ODT can be used through Resolve's ACES Transforms OFX plugin


#### Usage in ACES via LUT Menu
To use in ACES via the LUT menu (or DaVinci CTL if using Resolve 16 or below), copy the IDT folder contents to the LUT folder and comment out the first few lines as follows:

```
//#if (__RESOLVE_VER_MAJOR__ >= 17)
//DEFINE_ACES_PARAM(IS_PARAMETRIC_ACES_TRANSFORM: 0)
//#endif
```

Ensure Input Transform is set to None for each clip.



## Tutorials

### How to use Custom ACES IDTs & ODTs in DaVinci Resolve

[![Custom ACES IDT & ODT](https://img.youtube.com/vi/I6dpYL4knms/0.jpg)](https://www.youtube.com/watch?v=I6dpYL4knms "Custom ACES IDT & ODT")



## ACES Input Transforms

#### GoPro_Protune_Native_ACES_v2.dctl
IDT for ACES using Protune (FLAT) Gamma with Native Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve

#### GoPro_Protune_Rec709_ACES.dctl
IDT for ACES using Protune (FLAT) Gamma with Rec.709 (non-Native) Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve

#### GoPro_Protune-LogB400_Rec709_ACES.dctl
IDT for ACES using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 (non-Native) Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve

#### GoPro_Protune_Native_Bradford-CA_ACES.dctl (Legacy)
Legacy IDT for ACES using Protune (FLAT) Gamma with Native Color Space - with Bradford Chromatic Adaptation (For test purposes only)

#### GoPro_Protune_Rec709_Bradford-CA_ACES.dctl (Legacy)
Legacy IDT for ACES using Protune (FLAT) Gamma with Rec.709 (non-Native) Color Space - with Bradford Chromatic Adaptation (For test purposes only)



## ACES Output Transforms

#### Protune Native ODT - CSC.dctl
ODT for ACES with output to Protune (FLAT) Gamma with Native Color Space - with CAT02 Chromatic Adaptation for use in DaVinci Resolve



## DaVinci Intermediate Transforms

### Native Color Gamut

#### GoPro_Protune_Native_DWG_DaVinci-Intermediate_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to DaVinci Wide Gamut and DaVinci Intermediate

#### GoPro_Protune_Native_Rec2020_DaVinci-Intermediate_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.2020 and DaVinci Intermediate

### Rec.709 Color Gamut

#### GoPro_Protune_Rec709_DWG_DaVinci-Intermediate.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to DaVinci Wide Gamut and DaVinci Intermediate

#### GoPro_Protune_Rec709_Rec2020_DaVinci-Intermediate.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.2020 and DaVinci Intermediate

#### GoPro_Protune-LogB400_Rec709_DWG_DaVinci-Intermediate.dctl
Input Transform for YRGB using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 Color Space - output to DaVinci Wide Gamut and DaVinci Intermediate

#### GoPro_Protune-LogB400_Rec709_Rec2020_DaVinci-Intermediate.dctl
Input Transform for YRGB using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 Color Space - output to Rec.2020 and DaVinci Intermediate


## Other DaVinci YRGB Transforms

### Native Color Gamut

#### GoPro_Protune_Native_Rec709_Scene_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Scene

#### GoPro_Protune_Native_Rec709_Gamma-2.2_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Gamma 2.2

#### GoPro_Protune_Native_Rec709_Gamma-2.4_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Gamma 2.4

#### GoPro_Protune_Native_Rec709_Gamma-2.6_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to Rec.709 Gamma 2.6

#### GoPro_Protune_Native_P3-D65_Scene_v2_v2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Native Color Space - output to P3-D65 Scene


### Rec.709 Color Gamut

#### GoPro_Protune_Rec709_Rec709_Scene.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Scene

#### GoPro_Protune_Rec709_Rec709_Gamma-2.2.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.2

#### GoPro_Protune_Rec709_Rec709_Gamma-2.4.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.4

#### GoPro_Protune_Rec709_Rec709_Gamma-2.6.dctl
Input Transform for YRGB using Protune (FLAT) Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.6

#### GoPro_Protune-LogB400_Rec709_Rec709_Scene.dctl
Input Transform for YRGB using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 Color Space - output to Rec.709 Scene

#### GoPro_Protune-LogB400_Rec709_Rec709_Gamma-2.2.dctl
Input Transform for YRGB using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.2

#### GoPro_Protune-LogB400_Rec709_Rec709_Gamma-2.4.dctl
Input Transform for YRGB using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.4

#### GoPro_Protune-LogB400_Rec709_Rec709_Gamma-2.6.dctl
Input Transform for YRGB using Protune (FLAT) LogB=400 Custom Gamma with Rec.709 Color Space - output to Rec.709 Gamma 2.6

