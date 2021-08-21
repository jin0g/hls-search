# PARAMETERS
TARGET = ZCU102
HLS_PERIOD = 5.0
VIVADO_PERIOD = 5.0
SYNTH_STRATEGY = default
IMPL_STRATEGY = default

# DIRECTORIES
DIR = ${TARGET}-${HLS_PERIOD}-${VIVADO_PERIOD}-${SYNTH_STRATEGY}-${IMPL_STRATEGY}
VIVADO_HLS = /tools/Xilinx/Vitis_HLS/2021.1/bin/vitis_hls

# Device Part
ZCU102_PART  = "xczu9eg-ffvb1156-2-e"
PART = ${${TARGET}_PART}


impl: build/${DIR}/vitis_hls.log

log:
	find -name vitis_hls.log | xargs grep "CP achieved post-implementation"

clean:
	rm -r build/

build/${DIR}/vitis_hls.log: main.cc
	mkdir -p build/${DIR}/
	cd build/${DIR}/ && PART=${PART} HLS_PERIOD=${HLS_PERIOD} VIVADO_PERIOD=${VIVADO_PERIOD} SYNTH_STRATEGY=${SYNTH_STRATEGY} IMPL_STRATEGY=${IMPL_STRATEGY} ${VIVADO_HLS} -f ../../script.tcl

