/**************************************************************************
 *                                                                        *
 *  Edge Detect Design Walkthrough for HLS                                *
 *                                                                        *
 *  Software Version: 1.0                                                 *
 *                                                                        *
 *  Release Date    : Tue Jan 14 15:40:43 PST 2020                        *
 *  Release Type    : Production Release                                  *
 *  Release Build   : 1.0.0                                               *
 *                                                                        *
 *  Copyright 2020, Siemens                                               *
 *                                                                        *
 **************************************************************************
 *  Licensed under the Apache License, Version 2.0 (the "License");       *
 *  you may not use this file except in compliance with the License.      *
 *  You may obtain a copy of the License at                               *
 *                                                                        *
 *      http://www.apache.org/licenses/LICENSE-2.0                        *
 *                                                                        *
 *  Unless required by applicable law or agreed to in writing, software   *
 *  distributed under the License is distributed on an "AS IS" BASIS,     *
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or       *
 *  implied.                                                              *
 *  See the License for the specific language governing permissions and   *
 *  limitations under the License.                                        *
 **************************************************************************
 *                                                                        *
 *  The most recent version of this package is available at github.       *
 *                                                                        *
 *************************************************************************/
#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>


namespace EdgeDetect_IP {

  class EdgeDetect_VerDer
  {
  private:
  
  public:
    EdgeDetect_VerDer() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Stream_t> &dat_in,
                        maxWType              &widthIn,
                        maxHType              &heightIn,
                        ac_channel<pixelType4x> &dat_out,
                        ac_channel<gradType4x>  &dy)
    {
      // Line buffers store pixel line history - Mapped to RAM
      pixelType8x line_buf0[maxImageWidth/8];
      pixelType8x line_buf1[maxImageWidth/8];
      pixelType8x rdbuf0_pix, rdbuf1_pix;
      pixelType8x wrbuf0_pix, wrbuf1_pix;
	  pixelType4x pix1_chan;
	  pixelType pix0[4];
	  pixelType pix1[4];
	  pixelType pix2[4];
	  gradType pix_dy[4];
	  gradType4x pix;
	  Stream_t tmp;
      // Remove loop upperbounds for RTL code coverage
      // Use bit accurate data types on loop iterator
      VROW: for (maxHType y = 0; ; y++) { // VROW has one extra iteration to ramp-up window
        #pragma hls_pipeline_init_interval 1
        VCOL: for (maxWType x = 0; ; x=x+4) {
          if ((x <= widthIn-4) && (y <= heightIn-1)) {
            
			tmp = dat_in.read();
			
			
			pix0[0] = tmp.pix.slc<8>(0);
			pix0[1] = tmp.pix.slc<8>(8);
			pix0[2] = tmp.pix.slc<8>(16);
			pix0[3] = tmp.pix.slc<8>(24);
			//pix0 = dat_in.data[0].read(); // Read streaming interface
          }
          // Write data cache, write lower 8 on even iterations of COL loop, upper 8 on odd
          if ( (x/4 &1) == 0 ) {
            //wrbuf0_pix.set_slc(0,pix0);
			wrbuf0_pix.set_slc(0, pix0[0]);
			wrbuf0_pix.set_slc(8, pix0[1]);
			wrbuf0_pix.set_slc(16, pix0[2]);
			wrbuf0_pix.set_slc(24, pix0[3]);
          } else {
            //wrbuf0_pix.set_slc(32,pix0);
			wrbuf0_pix.set_slc(32, pix0[0]);
			wrbuf0_pix.set_slc(40, pix0[1]);
			wrbuf0_pix.set_slc(48, pix0[2]);
			wrbuf0_pix.set_slc(56, pix0[3]);
          }
		  
		  
          // Read line buffers into read buffer caches on even iterations of COL loop
          if ( (x/4 &1) == 0 ) {
            // vertical window of pixels
            rdbuf1_pix = line_buf1[x/8];
            rdbuf0_pix = line_buf0[x/8];
          } else { // Write line buffer caches on odd iterations of COL loop
            line_buf1[x/8] = rdbuf0_pix; // copy previous line
            line_buf0[x/8] = wrbuf0_pix; // store current line
          }
          // Get 8-bit data from read buffer caches, lower 8 on even iterations of COL loop
          //pix2_tmp = ((x&1)==0) ? rdbuf1_pix.slc<32>(0) : rdbuf1_pix.slc<32>(32);
          pix2[0] = ((x/4&1)==0) ? rdbuf1_pix.slc<8>(0) : rdbuf1_pix.slc<8>(32);
		  pix2[1] = ((x/4&1)==0) ? rdbuf1_pix.slc<8>(8) : rdbuf1_pix.slc<8>(40);
		  pix2[2] = ((x/4&1)==0) ? rdbuf1_pix.slc<8>(16) : rdbuf1_pix.slc<8>(48);
		  pix2[3] = ((x/4&1)==0) ? rdbuf1_pix.slc<8>(24) : rdbuf1_pix.slc<8>(56);
		  
		  
		  //pix1_tmp = ((x&1)==0) ? rdbuf0_pix.slc<32>(0) : rdbuf0_pix.slc<32>(32);
		  pix1[0] = ((x/4&1)==0) ? rdbuf0_pix.slc<8>(0) : rdbuf0_pix.slc<8>(32);
		  pix1[1] = ((x/4&1)==0) ? rdbuf0_pix.slc<8>(8) : rdbuf0_pix.slc<8>(40);
		  pix1[2] = ((x/4&1)==0) ? rdbuf0_pix.slc<8>(16) : rdbuf0_pix.slc<8>(48);
		  pix1[3] = ((x/4&1)==0) ? rdbuf0_pix.slc<8>(24) : rdbuf0_pix.slc<8>(56);
		  
		  pix1_chan.set_slc(0, pix1[0]);
		  pix1_chan.set_slc(8, pix1[1]);
		  pix1_chan.set_slc(16, pix1[2]);
		  pix1_chan.set_slc(24, pix1[3]);
		  
          // Boundary condition processing
          if (y == 1) {
            pix2[3] = pix1[3]; // top boundary (replicate pix1 up to pix2)
			pix2[2] = pix1[2];
			pix2[1] = pix1[1];
			pix2[0] = pix1[0];
          }
          if (y == heightIn) {
            pix0[0] = pix1[0]; // bottom boundary (replicate pix1 down to pix0)
			pix0[1] = pix1[1];
			pix0[2] = pix1[2];
			pix0[3] = pix1[3];
          }
  
          // Calculate derivative

		  #pragma hls_unroll yes
		  MULADD: for(int i = 0; i < 4; i++){
			pix_dy[i] = pix2[i] * kernel[0] + pix1[i] * kernel[1] + pix0[i] * kernel[2];
		  }
		  pix.set_slc(0, pix_dy[0]);
		  pix.set_slc(9, pix_dy[1]);
		  pix.set_slc(18, pix_dy[2]);
		  pix.set_slc(27, pix_dy[3]);
		  
          if (y != 0) { // Write streaming interfaces
			dat_out.write(pix1_chan); // Pass thru original data
			dy.write(pix); // derivative output
          }
		  
          // programmable width exit condition
          if (x == maxWType(widthIn-4)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        // programmable height exit condition
        if (y == heightIn) {
          break;
        }
      }
    }
  };

}


