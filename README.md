# PowerShell-pciutils
pciutils - Built With Powershell

Current commands available:

```
lspci (basic command)
lspci -vmms [busid] 
```

Gathers PCI information based on registry entries. If you would like more commands available- post an issue.

If you ever need to update pci.ids
Simply place latest pci.ids in device folders
and run update script. It will generate a
a class used for lspci.ps1- It will build
the code for you!

Repository for pci-ids:

https://pci-ids.ucw.cz/

## INSTRUCTIONS

To run basic lspci, simply run the .bat file.

If you wish to run with argument -vmms, open cmd and navigate
to directory. You can then run lspci -vmms [busnumber]

You can also just set PATH to include this directory, and you can run straight from CMD.exe

### Example output (no argument):

```
C:> lspci 
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 630 (rev 04)
00:14.0 USB controller: Intel Corporation 200 Series/Z370 Chipset Family USB 3.0 xHCI Controller (rev 00)
00:16.0 Communication controller: Intel Corporation 200 Series PCH CSME HECI #1 (rev 00)
00:17.0 SATA controller: Intel Corporation 200 Series PCH SATA controller [AHCI mode] (rev 00)
00:1b.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #19 (rev f0)
00:1b.4 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #21 (rev f0)
00:1c.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #3 (rev f0)
00:1c.4 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #5 (rev f0)
00:1c.5 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #6 (rev f0)
00:1c.6 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #7 (rev f0)
00:1c.7 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #8 (rev f0)
00:1d.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root Port #9 (rev f0)
00:1f.3 Audio device: Intel Corporation 200 Series PCH HD Audio (rev 00)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219-V (rev 00)
05:00.0 Network controller: Intel Corporation Dual Band Wireless-AC 8265 (rev 78)
```

### Example output ``-vmms``

```
C:>lspci -vmms 00:02.0
Slot:   00:02.0
Class:  VGA compatible controller
Vendor: Intel Corporation
Device: HD Graphics 630
SVendor:        Gigabyte Technology Co., Ltd
SDevice:        Device 5912
Rev:    04
```

Note- For ``-vmms`` all spaces between ``Item: Value`` are tabs for easier parsing.
