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

namespace EdgeDetect_IP 
{
  class EdgeDetect_HorDer
  {
  public:
    EdgeDetect_HorDer() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<pixelType4x> &dat_in,
                        maxWType              &widthIn,
                        maxHType              &heightIn,
						ac_channel<pixelType4x> &dat_out,
                        ac_channel<gradType4x>  &dx)
    {
      // pixel buffers store pixel history
      pixelType4x pix_buf;
      pixelType4x pix_buf1;
	  pixelType4x pix_out;
  
      pixelType pix0 = 0;
      pixelType pix1 = 0;
      pixelType pix2 = 0;
	  pixelType pix3 = 0;
	  pixelType pix4 = 0;
	  pixelType pix5 = 0;
	  //pixelType pix6 = 0;
	  //pixelType pix7 = 0;
      gradType pix_dx[4];
      gradType4x  pix;
		
      HROW: for (maxHType y = 0; ; y++) {
        #pragma hls_pipeline_init_interval 1
        HCOL: for (maxWType x = 0; ; x=x+4) { // HCOL has one extra iteration to ramp-up window
          
		  
          if (x <= widthIn-4) {
            //pix0 = dat_in.read(); // Read streaming interface
			pix_buf = dat_in.read();
				
          }
		  
		  //pix7 = pix_buf.slc<8>(24);
		  //pix6 = pix_buf.slc<8>(16);
		  pix5 = pix_buf.slc<8>(8);
		  pix4 = pix_buf.slc<8>(0);
		  pix3 = pix_buf1.slc<8>(24);
		  pix2 = pix_buf1.slc<8>(16);
          pix1 = pix_buf1.slc<8>(8);
		  pix0 = pix_buf1.slc<8>(0);
		  
		  
          if (x == 1) {  
			pix5 = pix4;
			pix4 = pix3;
			pix3 = pix2;
			pix2 = pix1; // left boundary (replicate pix1 left to pix2)
          }
          if (x == widthIn) {
            pix0 = pix1; // right boundary (replicate pix1 right to pix0)
			pix1 = pix2;
			pix2 = pix3;
			pix3 = pix4;
          }
		  
		  // tmp pix_buf1 for output
		  pix_out = pix_buf1;
		  pix_buf1 = pix_buf;
		  
          // Calculate derivative
		  pix_dx[0] = pix2 * kernel[0] + pix1 * kernel[1] + pix0 * kernel[2];
		  pix_dx[1] = pix3 * kernel[0] + pix2 * kernel[1] + pix1 * kernel[2];
		  pix_dx[2] = pix4 * kernel[0] + pix3 * kernel[1] + pix2 * kernel[2];
		  pix_dx[3] = pix5 * kernel[0] + pix4 * kernel[1] + pix3 * kernel[2];
		  
		  pix.set_slc(0, pix_dx[0]);
		  pix.set_slc(9, pix_dx[1]);
		  pix.set_slc(18, pix_dx[2]);
          pix.set_slc(27, pix_dx[3]);
		  
		  if ((x != 0)) { // Write streaming interface   && ((x/4 &1) == 1) && 		
				dx.write(pix); // derivative out
				dat_out.write(pix_out);
		  }
		 
          // programmable width exit condition
          if ( x == widthIn) {
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn-1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
    }
  };

}


