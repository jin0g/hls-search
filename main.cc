#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>


int kernel(int a, int b, int c) {
#pragma HLS pipeline II=1
#pragma HLS interface ap_ctrl_none port=return
  return a + b * c;
}
