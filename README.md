# Opencore Config for Matebook X Pro 2019
OC Version: 0.8.4

Supports Latest Versions of MacOS

This Config is preconfigured with refind, and supports dual boot with windows

Add /BootOC/bootx64.efi into your boot entry and select that to boot.

## What works?
- Turbo boost and CPU frequency stage
- Integrated Graphics
- Brightness control
- 40gbps thunderbolt (requires bios tweaking)
- Audio
- Wi-Fi, Bluetooth, Handoff, iMessage...
- Camera
- Touchpad (all gestures working)
- Battery status
- Shutdown / Reboot
- Fn shortcut keys
- S3 Sleep / Wake (Only drops 2-3% overnight)

## What doesn't work?
- Fingerprint Sensor
- Nvidia DGPU

## What to do before using?
- Generate SMBIOS (MacBookPro16,3) values and add them info config.plist
- [Disable CFG Lock](#disabling-cfg-lock)
- [Change DVMT to 64mb](#change-dvmt-to-64mb)
- Disable Secure Boot
- Disable Thunderbolt safety features in BIOS

## Disabling CFG Lock
If you got unnormal cpu boost issue or overheating issue, i recommand to do this.

1. Upgrade your bios to 1.28, could be downloaded in PC Manager on Windows.
2. Format a usb stick to FAT32.
3. Create a new folder named "EFI" in root.
4. Create a new folder named "BOOT" in /EFI/.
5. Download cfgunlock.zip
6. Copy BOOTx64.efi from cfgunlock.zip to EFI/BOOT in your USB.
7. Restart and boot with this usb.
8. After you boot. Press F12.
9. Use ↑ and ↓ in your keyboard to find "CpuSetup".
10. Press enter in keyboard to enter "CpuSetup".

You will see this.

![](https://github.com/yusufklncc/Huawei-Matebook-13-Hackintosh/blob/main/Images/CpuSetup.jpg)

11. If 0030-0E value is 01 in your computer continue. If it is 00. You don't need this.
12. Use ← → ↑ ↓ key to pick it and change to 00.
13. Press ctrl and w in same time to save setting.
14. Press alt + q to quit.

## Change DVMT to 64mb
You will be able to output hdml/dp 4k60p if you change DVMT

Use the same USB that you set up previously in Disabling CFG Lock section, and boot using your USB

1. When you're in, press ‘alt’ + ’=‘ to switch to ACPI Variable
2. Use pageup/pagedown/arrow keys to find SaSetup
3. In SaSetup，use crtl + pagedown to flip to the next page unti the left address displays '0100' as shown below. Note that the first address is 0100

![image](https://user-images.githubusercontent.com/89210318/229143618-1ef03155-b11d-4b45-9c94-945b398b0ee4.png)

4. Change the value at horizontal axis 0100, vertical axis 07 to 02 ，and horizontal axis 0100, vertical axis 08 to 03
5. Save with ctrl and w
