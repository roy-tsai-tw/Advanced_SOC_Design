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
  class EdgeDetect_MagAng
  {
  public:
    EdgeDetect_MagAng() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<gradType4x> &dx_in,
                        ac_channel<gradType4x> &dy_in,
						ac_channel<pixelType4x> &dat_in,
                        maxWType             &widthIn,
                        maxHType             &heightIn,
						bool                 &sw_in,
						uint32               &crc32_pix_in,
						uint32               &crc32_dat_out,
                        ac_channel<Stream_t>  &dat_out)
                        //ac_channel<angType>  &angle)
    {
      gradType4x dx, dy;
      pixelType4x pix_buf;
	  //sqType dx_sq;
      //sqType dy_sq;
      //sumType sum; // fixed point integer for sqrt
	  pixelType4x mag_cal;
	  pixelType mag[4];
	  //angType at;
      //ac_fixed<16,9,false> sq_rt; // square-root return type
	  Stream_t magn;
	  
	  pixelType pix0 = 0;
      pixelType pix1 = 0;
      pixelType pix2 = 0;
	  pixelType pix3 = 0;
	  gradType dx0 = 0;
	  gradType dx1 = 0;
	  gradType dx2 = 0;
	  gradType dx3 = 0;
	  gradType dy0 = 0;
	  gradType dy1 = 0;
	  gradType dy2 = 0;
	  gradType dy3 = 0;
	  //ac_int<32, false> crc32_in;
      uint32 crc32_in;
      gradType4x  pix;
	  
	  
	  
	  uint32 crc32_pix_in_default = 0XFFFFFFFF;
	  uint32 crc32_dat_out_default = 0XFFFFFFFF;
	  
      MROW: for (maxHType y = 0; ; y++) {
        #pragma hls_pipeline_init_interval 1
        MCOL: for (maxWType x = 0; ; x = x + 4) {
          if ((x <= widthIn-4)) {
				pix_buf = dat_in.read();
				dx = dx_in.read();
				dy = dy_in.read();
				
		  }
		  
		  // crc32 for image input
		  crc32_in = pix_buf;
		  crc32_pix_in_default = calc_crc32<32>(crc32_pix_in_default, pix_buf);
		
		
		  dx0 = dx.slc<9>(0);
		  dx1 = dx.slc<9>(9);
		  dx2 = dx.slc<9>(18);
		  dx3 = dx.slc<9>(27);
		  dy0 = dy.slc<9>(0);
		  dy1 = dy.slc<9>(9);
		  dy2 = dy.slc<9>(18);
		  dy3 = dy.slc<9>(27);
		  
		  // magn calculation
		  #pragma hls_unroll yes
		  ABSADD: for(int i = 0; i < 4; i++){
			  if((abs(dx.slc<9>(i * 9)) + abs(dy.slc<9>(i * 9)) ) > 255){
				  mag[i] = 255;
			  }
			  else{
				  mag[i] = abs(dx.slc<9>(i * 9)) + abs(dy.slc<9>(i * 9));
			  }
		  }
		  
		  // switch
		  if (sw_in==0){
			mag_cal.set_slc(0, pix0);
		    mag_cal.set_slc(8, pix1);
		    mag_cal.set_slc(16, pix2);
		    mag_cal.set_slc(24, pix3);  
		  }
		  else{
			mag_cal.set_slc(0, mag[0]);
		    mag_cal.set_slc(8, mag[1]);
		    mag_cal.set_slc(16, mag[2]);
		    mag_cal.set_slc(24, mag[3]);
		  }
          
		  magn.pix = mag_cal;
		  
 		  // crc32 for image output
		  crc32_in = mag_cal;
		  crc32_dat_out_default = calc_crc32<32>(crc32_dat_out_default, mag_cal);
		  
		  //ac_math::ac_atan2_cordic((ac_fixed<9,9>)dy, (ac_fixed<9,9>) dx, at);
          //angle.write(at);
          
		  // programmable width exit condition
		  if((x == 0) && (y == 0)){
			  magn.sof = 1;
		  }else{
			  magn.sof = 0;
		  }
		  
		  if(y == maxHType(heightIn-1)){
			  magn.eol = 1;
		  }else{
			  magn.eol = 0;
		  }
		  
		  if(x <= maxWType(widthIn-4)){
			dat_out.write(magn);
		  }
		  
          if (x == maxWType(widthIn-4)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn-1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
	  crc32_pix_in_default = ~crc32_pix_in_default;
	  crc32_pix_in = crc32_pix_in_default;
	  crc32_dat_out_default = ~crc32_dat_out_default;
	  crc32_dat_out = crc32_dat_out_default;
	  

    }
  private:
    template <int len>
    uint32 calc_crc32(uint32 crc_in, ac_int<len, false> dat_in) //ac_int<len, false> dat_in
    {
      const uint32 CRC_POLY = 0xEDB88320;
      uint32 crc_tmp = crc_in;

      #pragma hls_unroll yes
      for(int i=0; i<len; i++)
      {
        uint1 tmp_bit = crc_tmp[0] ^ dat_in[i];

        uint31 mask;

        #pragma hls_unroll yes
        for(int i=0; i<31; i++)
          mask[i] = tmp_bit & CRC_POLY[i];

        uint31 crc_tmp_h31 = crc_tmp.slc<31>(1);
   
        crc_tmp_h31 ^= mask;
        
        crc_tmp.set_slc(31,tmp_bit);
        crc_tmp.set_slc(0,crc_tmp_h31);
      }
      return crc_tmp;
    }
	
	gradType abs(gradType din)
    {
	  gradType dout;
      if(din <= 0) 
		  dout = (-1)*din;
      else 
		  dout = din;
	  return dout;
    }
  };
}


