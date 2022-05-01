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

# Playback Device
$Vr = Get-Device-Id 'Playback' 'Index HMD (NVIDIA High Definition Audio)'
if($Vr){
	set-audiodevice -index $Vr
}

#Recording Device
$Vr = Get-Device-Id 'Recording' 'Digital Audio Interface (Valve VR Radio & HMD Mic)'
if($Vr){
	set-audiodevice -index $Vr
}
