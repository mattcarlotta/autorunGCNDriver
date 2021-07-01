## Autorun GCN Adapter Driver

<img src="https://raw.githubusercontent.com/mattcarlotta/autorunGCNDriver/main/autorunGCNDriverIcon.png" width="250px">

A tool to automate running [GCN USB Adapter](https://bitbucket.org/elmassivo/gcn-usb-adapter/src/master/).

### What's the motivation?

Laziness! This program replaces manually opening the GCN USB Adapter, pressing the "Start" button and then searching through the vJoy devices to find which vJoy device is active.

### Demo

Click [here](https://youtu.be/nA50Wlv3K_M) for a video demo.

### Prerequisites

- Own and have plugged in a WUP-28 [Wii U GameCube Controller Adapter](https://i.imgur.com/ybzhXjD.jpg)
- Plugged in a single GameCube Controller into the adapter
- Installed [GCN USB Adapter](https://bitbucket.org/elmassivo/gcn-usb-adapter/downloads) to `C:\Program Files (x86)\GCNadapter\GCNUSBFeeder.exe`
- Installed [Zadig](https://zadig.akeo.ie/) and altered the driver for the WUP-28 adapter

⚠️ Please note that this program currently only supports finding a single active controller. While you can use more than 1 controller, this program will only find the first active vJoy device and then exit.

### How to run

⚠️ Please note that Windows Security may flag the `autorunGCNDriver.exe` file as a trojan: [Trojan:Script/Phonzy.B!ml](https://i.imgur.com/dVCpy9n.png). This is a false-positive. The reason for the false-positive is because the program automatically opens the GCN USB Adapter program and left-mouse clicks some of the buttons within the program. **This program does not store/modify/alter/download any files nor folders**. Please see [source code](https://github.com/mattcarlotta/autorunGCNDriver/blob/main/autorunGCNDriver.au3) for a complete breakdown of what this program does.

If you wish to run it, you must temporarily [turn off Real-time protection](https://www.cyber.gov.au/acsc/view-all-content/guidance/turn-real-time-protection-windows-10), download the exe, and then add the file to the [exclusion list](https://support.microsoft.com/en-us/windows/add-an-exclusion-to-windows-security-811816c0-4dfd-af4a-47e4-c301afe13b26).

- Download the compiled [autorunGCNDriver.exe](https://raw.githubusercontent.com/mattcarlotta/autorunGCNDriver/main/autorunGCNDriver-v1.exe)
- Run the exe and wait for it to automatically close any open windows

⚠️ Before the GCN Adapter Driver window closes you should see a dialog box pop open that displays which vJoy device is active.

### Build from source

- Download and install `AutoIt Full Installation` and `AutoIt Script Editor` from [here](https://www.autoitscript.com/site/autoit/downloads/)
- Download [autorunGCNDriver.au3](https://raw.githubusercontent.com/mattcarlotta/autorunGCNDriver/main/autorunGCNDriver.au3) and [autorunGCNDriver.ico](https://raw.githubusercontent.com/mattcarlotta/autorunGCNDriver/main/autorunGCNDriver.ico) files
- Right click on the `autorunGCNDriver.au3` and click [Edit Script](https://i.imgur.com/SiaHhRf.png)
- Temporarily [turn off Real-time protection](https://www.cyber.gov.au/acsc/view-all-content/guidance/turn-real-time-protection-windows-10)
- When the AutoIt Script Editor loads, press `F7` (or `Tools` > `Build`) to [build](https://i.imgur.com/ChWpq54.png) the .exe
- The exe file will be created at the [parent root directory](https://i.imgur.com/bGXQlGc.png)
- Add the built exe file to the [exclusion list](https://support.microsoft.com/en-us/windows/add-an-exclusion-to-windows-security-811816c0-4dfd-af4a-47e4-c301afe13b26)
- Turn on Real-time protection
