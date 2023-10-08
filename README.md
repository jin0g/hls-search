# Timing Strategy Search for Vitis HLS

Explore frequencies and strategies in Vitis HLS and Vivado from only C++ code.

The kernel function in main.cc is synthesized by Vitis HLS and implemented by Vivado HLS.

## Recommended Environments

- Ubuntu 22.04
- Vivado 2023.1 and Vitis HLS 2023.1
- Installed in `/tools/Xilinx/`

## Usage

### Synthesys and Implementation (example)
```
$ make HLS_PERIOD=2.0 VIVADO_PERIOD=2.0 SYNTH_STRATEGY=Flow_AreaOptimized_high IMPL_STRATEGY=Performance_NetDelay_low
```
- HLS_PERIOD: float, Target clock period of HLS synthesis
- VIVADO_PERIOD: float, Target clock period of Vivado implementation
- SYNTH_STRATEGY
- IMPL_STRATEGY

### Watch timing logs
```
$ make log
```

### Clean
```
$ make clean
```
