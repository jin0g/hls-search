#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>


int kernel(int a, int b, int c) {
#pragma HLS pipeline II=1
#pragma HLS interface ap_ctrl_none port=return

    ap_int<32> tmp = a + b * c;

#ifdef TEST_A
    tmp = a + ap_uint<8>(b) * ap_uint<8>(c);
#endif

#ifdef TEST_B
    tmp = a + ap_int<8>(b) * ap_int<8>(c);
#endif

    return tmp;
}
