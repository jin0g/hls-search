# vivado-vitis-hls-search
Explore frequencies and strategies in Vitis HLS and Vivado

The kernel function in main.cc is synthesized by Vitis HLS and implemented by Vivado HLS.

## Environments

- Ubuntu
- Vivado 2021.1 and Vitis HLS 2021.1
- Installed in `/tools/Xilinx`

## Usage

### Synthesys and Implementation (example)
```
$ make impl HLS_PERIOD=2.0 VIVADO_PERIOD=2.0 SYNTH_STRATEGY=Flow_AreaOptimized_high IMPL_STRATEGY=Performance_NetDelay_low
```
- HLS_PERIOD: float, Target clock period of HLS synthesis
- VIVADO_PERIOD: float, Target clock period of implementation
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
