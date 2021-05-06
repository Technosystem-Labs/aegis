# AEgIS Firmware

## Variants

In all variants RTIO clock is 100 MHz and is based on 10 MHz external reference. 
IP address is set to `192.168.1.70`.

1. `aegis-1tc1`: 
   * 2x DIO MCX (32 channels total)
   * Fastino
   * 4x HVAMP_8CH
2. `aegis-5tc1`
   * 1x DIO MCX (16 channels total)
   * Fastino
   * 4x HVAMP_8CH
3. `aegis-5tc2`
   * 1x DIO MCX (16 channels total)
   * Fastino
   * 4x HVAMP_8CH

## Building firmware

1. Install Xilinx Vivado
2. Install DARTIQ: `python3 -m pip install dartiq`
3. Execute `./build_firmware <variant>`

## Flashing device

1. Connect Kasli microUSB
2. Execute `./flash <variant>`