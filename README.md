# DELL-Inspiron-7557-Fan
This is a hotpatch for Hackintosh installed on DELL 7557 to read the speed of two fans in the laptops.
# Usage
This hotpatch is based on FakeSMC (RehabMan builds) and Clover, you can download them here.

FakeSMC (RehabMan builds): https://bitbucket.org/RehabMan/os-x-fakesmc-kozlek/downloads/

Clover: https://sourceforge.net/projects/cloverefiboot/
## Prepare
Firstly, make Clover as your EFI boot and put the FakeSMC.kext, FakeSMC_ACPISensors.kext into the kext directory under CLOVER.
Secondly, install FakeSMC.kext, FakeSMC_ACPISensors.kext using Kext Utility into the S/L/E Directory on your volumn of OS X.
## Install
compile the .dsl file with MaciASL on Hackintosh into .aml File, and put the compiled .aml file into the ACPI/patched directory under CLOVER.
