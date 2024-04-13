# Catapult-EdgeDetect Project
* Team: Team 7
  * 110063553 張傑閔
  * 1122029s  蔡宗頴
* Directories
  * Catapult
    * 1_hls_c
    * 2_c_sim_log
    * 3_synthesis_report
    * 4_questasim_sim_result
    * 5_tcl_file
  * FSIC
* Note: Since we didn't have 1R1W ram IP from Xilinx, the FSIC simulation will always be wrong. Hence, we synthesized the hls design with dsign compiler library as 01_edge_detect and ran FSIC simulation for test. The files corresponding to design compiler are added on "_dc_lib," while the vivado one are added on "_vivado_lib" in Catapult directory. The screeshots of report in Catapult/3_synthesis_report are based on Vivado library.  
