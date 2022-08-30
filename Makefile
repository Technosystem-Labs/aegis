define ddbpatch

device_db["dio_mcx_dir_switch"] = {
    "type": "local",
    "module": "artiq.coredevice.pcf8574a",
    "class": "PCF8574A"
}
endef
export ddbpatch

help:
	echo "Please specify target!"

all: 5t.ddb 1t.ddb 1tc1.ddb 5tc1.ddb 5tc2-standalone.ddb 1tc1.gw 5tc1.gw 5tc2-satellite.gw 5tc2-standalone.gw demokit-satellite.gw

5t.ddb:
	mkdir -p experiments
	artiq_ddb_template -s 1 gw/aegis-5tc2-satellite.json gw/aegis-5tc1.json > experiments/device_db_5t.py
	echo "$$ddbpatch" >> experiments/device_db_5t.py

1t.ddb:
	mkdir -p experiments
	artiq_ddb_template -s 1 gw/aegis-demokit-satellite.json -s 2 gw/aegis-demokit-satellite.json gw/aegis-1tc1.json > experiments/device_db_1t.py
	echo "$$ddbpatch" >> experiments/device_db_1t.py

1tc1.ddb 5tc1.ddb 5tc2-standalone.ddb:
	mkdir -p experiments
	artiq_ddb_template gw/aegis-$(basename $@).json > experiments/device_db_$(basename $@).py
	echo "$$ddbpatch" >> experiments/device_db_$(basename $@).py

1tc1.gw 5tc1.gw 5tc2-standalone.gw:
	python -m artiq.gateware.targets.kasli_generic gw/aegis-$(basename $@).json
	cp artiq_kasli/kasli-aegis-$(basename $@)/gateware/top.bit artiq_kasli/kasli-aegis-$(basename $@)/top.bit
	cp artiq_kasli/kasli-aegis-$(basename $@)/software/bootloader/bootloader.bin artiq_kasli/kasli-aegis-$(basename $@)/bootloader.bin
	cp artiq_kasli/kasli-aegis-$(basename $@)/software/runtime/runtime.fbi artiq_kasli/kasli-aegis-$(basename $@)/runtime.fbi

5tc2-satellite.gw demokit-satellite.gw:
	python -m artiq.gateware.targets.kasli_generic gw/aegis-$(basename $@).json
	cp artiq_kasli/kasli-aegis-$(basename $@)/gateware/top.bit artiq_kasli/kasli-aegis-$(basename $@)/top.bit
	cp artiq_kasli/kasli-aegis-$(basename $@)/software/bootloader/bootloader.bin artiq_kasli/kasli-aegis-$(basename $@)/bootloader.bin
	cp artiq_kasli/kasli-aegis-$(basename $@)/software/satman/satman.fbi artiq_kasli/kasli-aegis-$(basename $@)/satman.fbi

1tc1.flash 5tc1.flash 5tc2-satellite.flash 5tc2-standalone.flash demokit-satellite.flash:
	artiq_flash -t kasli -V aegis-$(basename $@) -d ./artiq_kasli erase gateware bootloader firmware start

cleanup_gw:
	find artiq_kasli/ -type d -name gateware -exec rm -rf {} +
	find artiq_kasli/ -type d -name software -exec rm -rf {} +

release_tarball:
	tar -cvzf aegis-release-vX.X.X.tar.gz ./*

clean:
	rm -rf artiq_kasli
	rm -rf experiments/device_db*
