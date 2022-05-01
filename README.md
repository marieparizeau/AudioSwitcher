# AudioSwitcher
Allows One-click toggle between desktop and VR audio setup.

Which configuration to switch to is decided based on the current **Playback Device**.

### Specifying Device Names
Device names can be found by running `Get-AudioDevice -list` command([AudioDeviceCmdlets](https://github.com/frgnca/AudioDeviceCmdlets) Module must be installed)
 or in the Windows Sound Panel


Change the names being pased to `Get-Device-Id` to specify which devices to use

### Audio Device Types:
- playback: Headphones, speakers, or VR HEadset speakers
- recording: Microphone, or VR HMD Mic

