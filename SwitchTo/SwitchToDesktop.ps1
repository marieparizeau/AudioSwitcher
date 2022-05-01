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
$Desktop =  Get-Device-Id 'Playback' 'Headphones (HyperX Cloud Flight S Game)'
if($Desktop){
	{set-audiodevice -index $Desktop} 
}

#Recording Device
$Desktop = Get-Device-Id 'Recording' 'Microphone (HyperX QuadCast S)'
if($Desktop){
	{set-audiodevice -index $Desktop} 
}
