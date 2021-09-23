# AEgIS Firmware

## Variants

In all variants RTIO clock is 100 MHz and is based on 10 MHz external reference. 
IP address is set to `192.168.1.70`.

1. `1tc1`: 
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

## Building firmware

1. Install Xilinx Vivado
2. Install DARTIQ: `python3 -m pip install dartiq`
3. Execute `make <variant>.gw`

## Flashing device

1. Connect Kasli microUSB
2. Execute `make <variant>.flash`

## Device DB

* For 1TC1 use `experiments/device_db_1tc1.py`.
* For 5T as a two crate system use `experiments/device_db_5t.py`. 
* For 5TC1 as standalone use `experiments/device_db_5tc1.py`.
* For 5TC2 as standalone use `experiments/device_db_5tc2-standalone.py`.

Remeber that 5TC2 must be reflashed when switching from satellite / standalone.