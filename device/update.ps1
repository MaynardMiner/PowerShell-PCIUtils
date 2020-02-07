<#
PCIUtils FOR POWERSHELL
This is open-source software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
SWARM is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

If you use my code, please include my github: https://github.com/maynardminer

If you find it useful - Consider a BTC donation: 1FpuMha1QPaWS4PTPZpU1zGRzKMevnDpwg
#>

## If you ever need to update pci.ids
## Simply place latest pci.ids in this folder
## and run this script. It will generate a
## a class used for lspci.ps1

$code = @()
$code += "Class PCI_ID {"
$code += "`t[Hashtable]`$Info= @{"
$pci_ids = Get-Content ".\build\apps\device\pci.ids" | Where { $_[0] -ne '#' -and $_ -ne "" }

## Build from first line of pci_ids
## First line will never change
$first = $pci_ids | Select -First 1
$name = $first.substring(4 + 2)
$vendor_id = $first.substring(0, 4)
$vendor = "`"$vendor_id   $name`""
$code += "`t`t$vendor = @{"

$tab1 = $true
$tab2 = $false
$tab3 = $false

$pci_ids = $pci_ids | Select -Skip 1

## Do first line
$pci_ids | % {
    if ($_[0] -ne "`t") {
        $name = $_.substring(4 + 2)
        $vendor_id = $_.substring(0, 4)
        $vendor = "$vendor_id   $name".replace("`"","```"")
        $vendor = "`"$vendor`""
        $count = $code.count
        if ($tab1) {
            $code[$count - 1 ] += "}" 
        }
        elseif ($tab2) {
            $code[$code.count- 1 ] += "}"
            $code += "`t`t}"
        }
        elseif ($tab3) {
            $code += "`t`t`t}"
            $code += "`t`t}"
        }
        $tab1 = $true
        $tab2 = $false
        $tab3 = $false
        $code += "`t`t$vendor = @{"
    }
    elseif ($_[0] -eq "`t" -and $_[1] -ne "`t") {
        $flag = $false
        $device_id = $_.Substring(1, 4)
        if ($device_id -like "* *") {
            $Device_id = $device_Id.Substring(0, 2)
            $flag = $true
        }
        if ($flag -eq $true) {
            $name = $_.substring(3 + 2)
        }
        else {
            $name = $_.substring(5 + 2)
        }
        $device = "$device_id   $name".replace("`"","```"")
        $device = "`"$device`""
        $count = $code.count
        if ($tab1) {
            $code += "`t`t`t$device = @{"
        }
        if ($tab2) {
            $code[$count - 1 ] += "}"
            $code += "`t`t`t$device = @{"
        }
        if ($tab3) {
            $code += "`t`t`t}"
            $code += "`t`t`t$device = @{"
        }
        $tab1 = $false
        $tab2 = $true
        $tab3 = $false
    }
    else {
        $split = $_.split("  ").Replace("`t", "")
        $subsys = $split[1].replace("`"","```"")
        $SubsysId = $split[0].replace("`"","```"")
        $code += "`t`t`t`t`"$SubsysId`" = `"$subsys`""
        $tab1 = $false
        $tab2 = $false
        $tab3 = $true
    }
}

$count = $code.count
$code[$count - 1] += "}"
$code += "`t}"
$code += "}"

$code | Set-Content ".\build\apps\device\pci_ids.ps1"
