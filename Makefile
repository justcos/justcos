all:
	linuxkit build justcos.yml
run:
	linuxkit run justcos
clean:
	rm -rv justcos-cmdline justcos-initrd.img justcos-kernel justcos-state/
