# PARAMETERS
export SOURCE ?= main.cc
export TARGET ?= KV260
export TEST ?= NONE
export HLS_PERIOD ?= 5.0
export VIVADO_PERIOD ?= 5.0
export SYNTH_STRATEGY ?= default
export IMPL_STRATEGY ?= default

# DIRECTORIES
DIR = ${TARGET}-${TEST}-${HLS_PERIOD}-${VIVADO_PERIOD}-${SYNTH_STRATEGY}-${IMPL_STRATEGY}
VIVADO_HLS = /tools/Xilinx/Vitis_HLS/2023.1/bin/vitis_hls

# Device Part
PYNQ_PART = xc7z020clg400-1
Ultra96_PART = xczu3eg-sbva484-1-e
ZCU102_PART = xczu9eg-ffvb1156-2-i
ZCU104_PART = xczu7ev-ffvc1156-2-e
KV260_PART = xck26-sfvc784-2LV-c
export PART = ${${TARGET}_PART}


all: build/${DIR}/test/solution1/impl/verilog/vivado.log


build/${DIR}/test/solution1/impl/verilog/vivado.log: ${SOURCE}
	mkdir -p build/${DIR}/
	cd build/${DIR}/ && ${VIVADO_HLS} -f ../../script.tcl


results:
	python3 results.py


clean:
	rm -r build/
