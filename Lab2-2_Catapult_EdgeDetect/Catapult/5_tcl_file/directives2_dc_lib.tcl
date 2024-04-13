//  Catapult Ultra Synthesis 2022.1/981271 (Production Release) Thu Feb 10 22:05:20 PST 2022
//  
//          Copyright (c) Siemens EDA, 1996-2022, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                   PROPERTY OF SIEMENS EDA OR ITS LICENSORS.
//  
//  Running on Linux mentor@RHEL74 3.10.0-693.el7.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v25.1_0.0, HLS_PKGS v25.1_0.0, 
//                       SIF_TOOLKITS v25.1_0.0, SIF_XILINX v25.1_0.0, 
//                       SIF_ALTERA v25.1_0.0, CCS_LIBS v25.1_0.0, 
//                       CDS_PPRO v10.6, CDS_DesigChecker v2022.1, 
//                       CDS_OASYS v21.1_2.5, CDS_PSR v21.1_0.4, 
//                       DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /Input/CppStandard c++11
solution options set /Input/TargetPlatform x86_64
solution options set /Input/SearchPath {../hls_c/inc ../cmodel/inc ../bmpUtil/inc} 
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/SCVerify/INVOKE_ARGS {./image/people640x360_rgb.bmp 1 out_algorithm.bmp out_hw.bmp}
solution options set /Flows/SCVerify/INCL_DIRS {../hls_c/inc ../cmodel/inc ../bmpUtil/inc}
#solution options set /Flows/VSCode/INSTALL /bin
#flow package require /VSCode
solution file add ../hls_c/inc/EdgeDetect.h -type CHEADER
solution file add ../hls_c/src/EdgeDetect_tb.cpp -type C++ -exclude true
solution file add {../bmpUtil/src/bmp_io.cpp} -type C++ -exclude true
options set Output/OutputVHDL false

#EdgeDetect_VerDer
go new
solution design set EdgeDetect_IP::EdgeDetect_VerDer -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
#solution library add mgc_Xilinx-ZYNQ-1_beh -- -rtlsyntool Vivado -manufacturer Xilinx -family ZYNQ -speed -1 -part xc7z010clg400-1
#solution library add Xilinx_RAMS
#solution library add Xilinx_FIFO
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_VerDer/dat_in:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait_coupled
directive set /EdgeDetect_IP::EdgeDetect_VerDer/widthIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_VerDer/heightIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -MAP_TO_MODULE {Xilinx_RAMS.BLOCK_1R1W_RBW suppress_sim_read_addr_range_errs=1}
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -MAP_TO_MODULE {Xilinx_RAMS.BLOCK_1R1W_RBW suppress_sim_read_addr_range_errs=1}
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -EXTERNAL_MEMORY true
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -GEN_EXTERNAL_ENABLE true
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -EXTERNAL_MEMORY true
#directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -GEN_EXTERNAL_ENABLE true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -EXTERNAL_MEMORY true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -GEN_EXTERNAL_ENABLE true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -EXTERNAL_MEMORY true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -GEN_EXTERNAL_ENABLE true
directive set /EdgeDetect_IP::EdgeDetect_VerDer -RESET_CLEARS_ALL_REGS no
go architect
go extract

#EdgeDetect_HorDer
go new
solution design set EdgeDetect_IP::EdgeDetect_HorDer -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
#solution library add mgc_Xilinx-ZYNQ-1_beh -- -rtlsyntool Vivado -manufacturer Xilinx -family ZYNQ -speed -1 -part xc7z010clg400-1
#solution library add Xilinx_RAMS
#solution library add Xilinx_FIFO
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_HorDer/dat_in:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait_coupled
directive set /EdgeDetect_IP::EdgeDetect_HorDer/widthIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_HorDer/heightIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_HorDer -RESET_CLEARS_ALL_REGS no
go architect
go extract

#EdgeDetect_MagAng
go new
solution design set EdgeDetect_IP::EdgeDetect_MagAng -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
#solution library add mgc_Xilinx-ZYNQ-1_beh -- -rtlsyntool Vivado -manufacturer Xilinx -family ZYNQ -speed -1 -part xc7z010clg400-1
#solution library add Xilinx_RAMS
#solution library add Xilinx_FIFO
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_MagAng/sw_in:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_MagAng/widthIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_MagAng/heightIn:rsc -MAP_TO_MODULE {[DirectInput]}
#directive set /EdgeDetect_IP::EdgeDetect_MagAng/run/ac_math::ac_atan2_cordic<9,9,AC_TRN,AC_WRAP,9,9,AC_TRN,AC_WRAP,8,3,AC_TRN,AC_WRAP>:for -UNROLL yes
directive set /EdgeDetect_IP::EdgeDetect_MagAng -RESET_CLEARS_ALL_REGS no
go architect
go extract

#EdgeDetect
go new
solution design set EdgeDetect_IP::EdgeDetect_VerDer -block
solution design set EdgeDetect_IP::EdgeDetect_HorDer -block
solution design set EdgeDetect_IP::EdgeDetect_MagAng -block
solution design set EdgeDetect_IP::EdgeDetect_Top -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
#solution library add mgc_Xilinx-ZYNQ-1_beh -- -rtlsyntool Vivado -manufacturer Xilinx -family ZYNQ -speed -1 -part xc7z010clg400-1
#solution library add Xilinx_RAMS
#solution library add Xilinx_FIFO
solution library add {[Block] EdgeDetect_IP::EdgeDetect_HorDer.v1}
solution library add {[Block] EdgeDetect_IP::EdgeDetect_MagAng.v1}
solution library add {[Block] EdgeDetect_IP::EdgeDetect_VerDer.v1}
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
directive set /EdgeDetect_IP::EdgeDetect_Top/EdgeDetect_IP::EdgeDetect_MagAng -MAP_TO_MODULE {[Block] EdgeDetect_IP::EdgeDetect_MagAng.v1}
directive set /EdgeDetect_IP::EdgeDetect_Top/EdgeDetect_IP::EdgeDetect_HorDer -MAP_TO_MODULE {[Block] EdgeDetect_IP::EdgeDetect_HorDer.v1}
directive set /EdgeDetect_IP::EdgeDetect_Top/EdgeDetect_IP::EdgeDetect_VerDer -MAP_TO_MODULE {[Block] EdgeDetect_IP::EdgeDetect_VerDer.v1}
go assembly

directive set /EdgeDetect_IP::EdgeDetect_Top/dat_in:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait_coupled
directive set /EdgeDetect_IP::EdgeDetect_Top/sw_in:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_Top/widthIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_Top/heightIn:rsc -MAP_TO_MODULE {[DirectInput]}

directive set /EdgeDetect_IP::EdgeDetect_Top/pix_chan1:cns -FIFO_DEPTH 0
directive set /EdgeDetect_IP::EdgeDetect_Top/pix_chan2:cns -FIFO_DEPTH 0
directive set /EdgeDetect_IP::EdgeDetect_Top/dy_chan:cns -FIFO_DEPTH 2
directive set /EdgeDetect_IP::EdgeDetect_Top/dx_chan:cns -FIFO_DEPTH 0
directive set /EdgeDetect_IP::EdgeDetect_Top -RESET_CLEARS_ALL_REGS no
go architect
go extract


