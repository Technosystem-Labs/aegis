# AEgIS Firmware

## Variants

In all variants RTIO clock is 125 MHz and is based on 10 MHz external reference. 
IP address is set to `192.168.1.70`.

1. `1tc1` - master for demonstration systems: 
   * 2x DIO MCX (32 channels total)
   * Fastino
   * 4x HVAMP_8CH
2. `5tc1` - master for 5T subsystem, can also operate in standalone mode
   * 1x DIO MCX (16 channels total)
   * Fastino
   * 4x HVAMP_8CH
3. `5tc2-satellite` - satellite for 5T subsystem
   * 1x DIO MCX (16 channels total)
   * Fastino
   * 4x HVAMP_8CH
4. `5tc2-standalone` - standalone operation of 5TC2
   * 1x DIO MCX (16 channels total)
   * Fastino
   * 4x HVAMP_8CH
5. `demokit-satellite` - satellite for 1T subsystem
   * 1x DIO BNC (8 channels total)
## Building firmware

1. Run ARTIQ development shell with (see [Developing ARTIQ](https://m-labs.hk/artiq/manual-beta/developing.html))
2. Execute `make <variant>.gw`

## Flashing device

1. Run ARTIQ development shell with (see [Developing ARTIQ](https://m-labs.hk/artiq/manual-beta/developing.html))
1. Connect Kasli microUSB
2. Execute `make <variant>.flash`

## Device DB

* For 1T use `experiments/device_db_1tc1.py`.
* For 5T as a two crate system use `experiments/device_db_5t.py`. 
* For 5TC1 as standalone use `experiments/device_db_5tc1.py`.
* For 5TC2 as standalone use `experiments/device_db_5tc2-standalone.py`.

Remeber that 5TC2 must be reflashed when switching from satellite / standalone.