#! /bin/sh
pactl load-module module-null-sink sink_name=video_recorder sink_properties=device.description="Video_Recorder"
pactl load-module module-loopback source=alsa_input.pci-0000_05_00.6.HiFi__Mic1__source sink=video_recorder
pactl load-module module-loopback source=alsa_output.pci-0000_05_00.6.HiFi__Speaker__sink.monitor sink=video_recorder
