if ((Get-InstalledModule `
    -Name "AudioDeviceCmdlets" `
    -ErrorAction SilentlyContinue) -eq $null) {
    Install-Module -Name AudioDeviceCmdlets 
}

function Get-Device-Id {
    param (
        [ValidateNotNullOrEmpty()]
        [string]$Type,
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    return Get-AudioDevice -list |
        where Type -eq $Type |
        Where-Object Name -eq $Name | 
        ForEach-Object Index

}
 
function Toggle-Device{
 param (
        [Parameter(Mandatory=$true)]
        [bool]$SwitchToVr,
        [Parameter(Mandatory=$true)]
        [int]$Desktop,
        [Parameter(Mandatory=$true)]
        [int]$Vr
    )

    if($Desktop -And $Vr){
        if ($SwitchToVr) 
        {set-audiodevice -index $Vr} 
        else 
        {set-audiodevice -index $Desktop} 
    }
}

# Playback Device
$Desktop =  Get-Device-Id 'Playback' 'Headphones (HyperX Cloud Flight S Game)'
$Vr = Get-Device-Id 'Playback' 'Index HMD (NVIDIA High Definition Audio)'

$SwitchToVr = (Get-audiodevice -playback).Index -eq $Desktop

Toggle-Device $SwitchToVr $Desktop $Vr

#Recording Device
$Desktop = Get-Device-Id 'Recording' 'Microphone (HyperX QuadCast S)'
$Vr = Get-Device-Id 'Recording' 'Digital Audio Interface (Valve VR Radio & HMD Mic)'

Toggle-Device $SwitchToVr $Desktop $Vr
