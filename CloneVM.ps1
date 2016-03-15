########################################################
# Create Clones of a Source VM
# CloneVM.ps1 -VM SourceVM -NumVMs NumberofClones
# 
# Hersey - http://www.vhersey.com/
#
########################################################
#Get Parameters
param(
 [Parameter(Mandatory=$true, HelpMessage=”Inventory Name of VM to Clone”)][string]$VM,
 [Parameter(Mandatory=$true, HelpMessage=”Number of Clones to Create”)][string]$NumVMs
)

#Get SourceVM Info
$vminfo = Get-VM $VM 
$vmhost = $vminfo.VMHost.name

$vmcount = $NumVMs

1..$vmcount | foreach {
   #Set New VM Name
   $y=”{0:D3}” -f $_
   $VM_name= $VM + $y

   #Clone the VM
   write-host " Creating $VM_name "
   New-VM -Name $VM_name -VM $VM -VMHost $vmhost -RunAsync
}