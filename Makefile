# PARAMETERS
TARGET = ZCU102
PHLS = 2.0
PIMPL = 1.4

# DIRECTORIES
DIR = ${TARGET}-${PHLS}-${PIMPL}
VIVADO_HLS = /tools/Xilinx/Vitis_HLS/2021.1/bin/vitis_hls

# Device Part
ZCU102_PART  = "xczu9eg-ffvb1156-2-e"
PART = ${${TARGET}_PART}


all: build/${DIR}/vitis_hls.log

clean:
	rm -r build/

watch:
	find -name vitis_hls.log | xargs grep "CP achieved post-implementation"

build/${DIR}/vitis_hls.log: main.cc
	mkdir -p build/${DIR}/
	cd build/${DIR}/ && PART=${PART} PHLS=${PHLS} PIMPL=${PIMPL} ${VIVADO_HLS} -f ../../script.tcl

