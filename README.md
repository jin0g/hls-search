# vitis-hls-search
Explore frequencies and strategies in Vitis HLS

The kernel function in main.cc is synthesized by Vitis HLS and implemented by Vivado HLS.

## TODO
- Support strategy exploration

## Usage

### Synthesys and Implementation
```
$ make PHLS=2.0 PIMPL=2.0
```
- PHLS: Target clock period of HLS synthesis
- PIMPL: Target clock period of implementation

### Watch logs
```
$ make watch
```


### Clean
```
$ make clean
```
