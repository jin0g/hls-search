# Timing Strategy Search for Vitis HLS

The HLS Search toolset aids in generating and optimizing hardware descriptions using Vitis HLS.
This tool primarily operates on a Makefile basis, simplifying the execution of Vitis HLS by altering various parameters and settings.
It's designed to efficiently conduct FPGA hardware descriptions and optimizations.
By setting the appropriate parameters and specifying the necessary test cases and target devices, Vitis HLS can be easily executed.

## Recommended Environments

- Ubuntu 22.04
- Vivado 2023.1 and Vitis HLS 2023.1
- Installed in `/tools/Xilinx/`

## Configuration Parameters

Through the following parameters, you can specify the behavior of HLS, the target device, test cases, and more:

- `SOURCE`: C/C++ source file (Default: `main.cpp`)
- `TARGET`: Target device (Default: `KV260`)
- `TEST`: Test case to be executed (Default: `A`)
- `HLS_PERIOD`: Clock cycle for HLS (Default: `5.0`)
- `VIVADO_PERIOD`: Clock cycle for Vivado (Default: `5.0`)
- `SYNTH_STRATEGY`: Synthesis strategy (Default: `default`)
- `IMPL_STRATEGY`: Implementation strategy (Default: `default`)

## Makefile Commands

- `all`: Executes Vitis HLS using the specified parameters.
- `results`: Searches for the log file of the all execution and displays.
- `clean`: Deletes the `build/` directory, clearing outputs and logs.

## Usage

### Specifying Operating Frequency
```
$ make HLS_PERIOD=3.0 VIVADO_PERIOD=2.5
```

### Running A/B Tests
```
$ make TEST=A
$ make TEST=B
```

### Modifying Strategies
```
$ make SYNTH_STRATEGY=Flow_AreaOptimized_high IMPL_STRATEGY=Performance_NetDelay_low
```

### Show Results
```
$ make results
>                          Directory,    CP, LUT,  FF, BRAM, URAM, CLB
> KV260-NONE-3.0-2.5-default-default, 1.298,  47, 113,    0,    0,  14
>    KV260-A-2.0-2.0-default-default, 2.028,  57,  96,    0,    0,  16
>    KV260-B-5.0-5.0-default-default, 1.195,   0,  32,    0,    0,   4
```
