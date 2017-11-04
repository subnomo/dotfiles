function pulseviz
	pacmd load-module module-pipe-sink file=/tmp/pulse.fifo
pacmd load-module module-combine-sink slaves=alsa_output.pci-0000_00_1b.0.analog-stereo,fifo_output
pacmd set-default-sink combined
end
