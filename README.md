# PowerShell-PCIUtils
PCIUtils - Built With Powershell

Current commands available:

```
lspci (basic command)
lspci -vmms [busid] 
```

Gathers PCI information based on registry entries. If you would like more commands available- post an issue.

If you ever need to update pci.ids
Simply place latest pci.ids in device folders
and run update script. It will generate a
a class used for lspci.ps1

INSTRUCTIONS

To run basic lspci, simply run the .bat file.

If you wish to run with argument -vmms, open cmd and navigate
to directory. You can then run lspci -vmms [busnumber]

You can also just set PATH to include this directory, and you can run strait from CMD.exe
