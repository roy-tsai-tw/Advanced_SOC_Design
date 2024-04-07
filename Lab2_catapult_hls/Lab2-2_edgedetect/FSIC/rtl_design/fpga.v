`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: TonyHo
//
// Create Date: 07/17/2023 04:35:34 PM
// Design Name:
// Module Name: fpga
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module fpga #(
		parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
		parameter pSERIALIO_WIDTH   = 13,
		parameter pADDR_WIDTH   = 15,
		parameter pDATA_WIDTH   = 32,
		parameter pRxFIFO_DEPTH = 5,
		parameter pCLK_RATIO =4
	) (
		input wire 	ioclk,

		input wire 	axi_reset_n,
		input wire 	axi_clk,

		input wire 	axis_rst_n,
		input wire 	axis_clk,

		//write addr channel
		input wire 	axi_awvalid_s_awvalid,
		input wire 	[pADDR_WIDTH-1:0] axi_awaddr_s_awaddr,		//axi_awaddr is DW address
		output wire	axi_awready_axi_awready3,

		//write data channel
		input wire 	axi_wvalid_s_wvalid,
		input wire 	[pDATA_WIDTH-1:0] axi_wdata_s_wdata,
		input wire 	[(pDATA_WIDTH/8)-1:0] axi_wstrb_s_wstrb,
		output wire	axi_wready_axi_wready3,

		//read addr channel
		input wire 	axi_arvalid_s_arvalid,
		input wire 	[pADDR_WIDTH-1:0] axi_araddr_s_araddr,
		output wire 	axi_arready_axi_arready3,

		//read data channel
		output wire 	axi_rvalid_axi_rvalid3,
		output wire 	[pDATA_WIDTH-1:0] axi_rdata_axi_rdata3,
		input wire 	axi_rready_s_rready,

		input wire 	cc_is_enable,		//axi_lite enable



		//TX path
		input wire 	[pDATA_WIDTH-1:0] as_is_tdata,
		`ifdef USER_PROJECT_SIDEBAND_SUPPORT
			input wire 	[pUSER_PROJECT_SIDEBAND_WIDTH-1:0] as_is_tupsb,
		`endif
		input wire 	[(pDATA_WIDTH/8)-1:0] as_is_tstrb,
		input wire 	[(pDATA_WIDTH/8)-1:0] as_is_tkeep,
		input wire 	as_is_tlast,
		input wire 	[1:0] as_is_tid,
		input wire 	as_is_tvalid,
		input wire 	[1:0] as_is_tuser,
		input wire 	as_is_tready,		//when local side axis switch Rxfifo size <= threshold then as_is_tready=0, this flow control mechanism is for notify remote side do not provide data with is_as_tvalid=1

		output wire		  serial_tclk,
		output wire  [pSERIALIO_WIDTH-1: 0] serial_txd,

		//Rx path
		input  wire		  serial_rclk,
		input  wire  [pSERIALIO_WIDTH-1: 0] serial_rxd,

		output wire 	[pDATA_WIDTH-1:0] is_as_tdata,
		`ifdef USER_PROJECT_SIDEBAND_SUPPORT
			output wire 	[pUSER_PROJECT_SIDEBAND_WIDTH-1:0] is_as_tupsb,
		`endif
		output wire 	[(pDATA_WIDTH/8)-1:0] is_as_tstrb,
		output wire 	[(pDATA_WIDTH/8)-1:0] is_as_tkeep,
		output wire 	is_as_tlast,
		output wire 	[1:0] is_as_tid,
		output wire 	is_as_tvalid,
		output wire 	[1:0] is_as_tuser,
		output wire 	is_as_tready		//when remote side axis switch Rxfifo size <= threshold then is_as_tready=0, this flow control mechanism is for notify local side do not provide data with as_is_tvalid=1

    );

	
// This code snippet was auto generated by xls2vlog.py from source file: /home/patrick/Downloads/Interface-Definition.xlsx
// User: patrick
// Date: Jul-14-23



IO_SERDES #(.pUSER_PROJECT_SIDEBAND_WIDTH( pUSER_PROJECT_SIDEBAND_WIDTH ),
			.pSERIALIO_WIDTH( pSERIALIO_WIDTH ),
            .pADDR_WIDTH( pADDR_WIDTH ),
            .pDATA_WIDTH( 32 ),
            .pRxFIFO_DEPTH( 5 ),
            .pCLK_RATIO      ( 4 )) U_IO_SERDES0 (
                                                  .axi_awready  (axi_awready_axi_awready3),// O  
                                                  .axi_wready   (axi_wready_axi_wready3),  // O  
                                                  .axi_arready  (axi_arready_axi_arready3),// O  
                                                  .axi_rdata    (axi_rdata_axi_rdata3),    // O  32
                                                  .axi_rvalid   (axi_rvalid_axi_rvalid3),  // O  
                                                  .is_as_tdata  (is_as_tdata),             // O  32
												  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
													 .is_as_tupsb  (is_as_tupsb),             // O  5
												  `endif
                                                  .is_as_tstrb  (is_as_tstrb),             // O  4
                                                  .is_as_tkeep  (is_as_tkeep),             // O  4
                                                  .is_as_tlast  (is_as_tlast),             // O  
                                                  .is_as_tid    (is_as_tid),               // O  2
                                                  .is_as_tvalid (is_as_tvalid),            // O  
                                                  .is_as_tuser  (is_as_tuser),             // O  2
                                                  .is_as_tready (is_as_tready),            // O  
                                                  .axi_awvalid  (axi_awvalid_s_awvalid),   // I  
                                                  .axi_awaddr   (axi_awaddr_s_awaddr),     // I  12
                                                  .axi_wvalid   (axi_wvalid_s_wvalid),     // I  
                                                  .axi_wdata    (axi_wdata_s_wdata),       // I  32
                                                  .axi_wstrb    (axi_wstrb_s_wstrb),       // I  4
                                                  .axi_arvalid  (axi_arvalid_s_arvalid),   // I  
                                                  .axi_araddr   (axi_araddr_s_araddr),     // I  12
                                                  .axi_rready   (axi_rready_s_rready),     // I  
                                                  .cc_is_enable (cc_is_enable),            // I  
                                                  .as_is_tdata  (as_is_tdata),             // I  32
												  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
													 .as_is_tupsb  (as_is_tupsb),             // I  5
												  `endif
                                                  .as_is_tstrb  (as_is_tstrb),             // I  4
                                                  .as_is_tkeep  (as_is_tkeep),             // I  4
                                                  .as_is_tlast  (as_is_tlast),             // I  
                                                  .as_is_tid    (as_is_tid),               // I  2
                                                  .as_is_tvalid (as_is_tvalid),            // I  
                                                  .as_is_tuser  (as_is_tuser),             // I  2
                                                  .as_is_tready (as_is_tready),            // I  
                                                  .ioclk        (ioclk),                   // I  
                                                  .serial_rxd   (serial_rxd),              // I  12
                                                  .serial_rclk  (serial_rclk),             // I  
                                                  .serial_txd   (serial_txd),              // O  12
                                                  .serial_tclk  (serial_tclk),             // O  
                                                  .axi_clk      (axi_clk),                 // I  
                                                  .axi_reset_n  (axi_reset_n),             // I  
                                                  .axis_clk     (axis_clk),                // I  
                                                  .axis_rst_n   (axis_rst_n)               // I  
                                                 );

	
endmodule

