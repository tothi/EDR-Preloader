# EDR-Preloader
 An EDR bypass that prevent EDRs from hooking or loading DLLs into our process by hijacking the AppVerifier layer

 For details, see: [malwaretech.com/2024/02/bypassing-edrs-with-edr-preload.html](https://malwaretech.com/2024/02/bypassing-edrs-with-edr-preload.html)

Original build environment is Windows using the provided .vcxproj file.

Support for MinGW-w64 (cross-compiling to Windows on Linux) is provided in the added (./Makefile). Also there are some minor tweaks for making this work compared to the original repo.

