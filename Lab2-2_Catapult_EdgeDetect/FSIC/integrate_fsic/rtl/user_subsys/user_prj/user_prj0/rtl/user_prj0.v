// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23

`define USE_EDGEDETECT_IP 1

`timescale 1ns / 10ps

`ifdef USE_EDGEDETECT_IP
module USER_PRJ0 #(parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
                   parameter pADDR_WIDTH   = 12,
                   parameter pDATA_WIDTH   = 32
                 )
(

// AW Channel (AXI-Lite)
  output wire                        awready,
  input  wire                        awvalid,
  input  wire                [11: 0] awaddr,
  
// W Channel (AXI-Lite)  
  output wire                        wready,
  input  wire                        wvalid,
  input  wire                 [3: 0] wstrb,
  input  wire  [(pDATA_WIDTH-1) : 0] wdata,
  
// AR Channel (AXI-Lite)  
  output wire                        arready,
  input  wire                        arvalid,
  input  wire                [11: 0] araddr,

// R Channel (AXI-Lite)    
  output wire                        rvalid,
  output wire  [(pDATA_WIDTH-1) : 0] rdata,
  input  wire                        rready,
  
// SS  (AXI-Stream)  
  output wire                        ss_tready,
  input  wire                        ss_tvalid,
  input  wire  [(pDATA_WIDTH-1) : 0] ss_tdata,
  input  wire                 [1: 0] ss_tuser,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
  input  wire  [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] ss_tupsb,
  `endif
  input  wire                 [3: 0] ss_tstrb,
  input  wire                 [3: 0] ss_tkeep,
  input  wire                        ss_tlast,
  
// SM  (AXI-Stream) 
  input  wire                        sm_tready,
  output wire                        sm_tvalid,
  output wire  [(pDATA_WIDTH-1) : 0] sm_tdata,
  output wire                 [2: 0] sm_tid,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
  output  wire [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb,
  `endif
  output wire                 [3: 0] sm_tstrb,
  output wire                 [3: 0] sm_tkeep,
  output wire                        sm_tlast,
  
//  
  output wire                        low__pri_irq,
  output wire                        High_pri_req,
  output wire                [23: 0] la_data_o,
  input  wire                        axi_clk,
  input  wire                        axis_clk,
  input  wire                        axi_reset_n,
  input  wire                        axis_rst_n,
  input  wire                        user_clock2,
  input  wire                        uck2_rst_n
);

localparam	RD_IDLE = 1'b0;
localparam	RD_ADDR_DONE = 1'b1;

//[TODO] does tlast from FPGA to SOC need send to UP? or use upsb as UP's tlast?
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
	localparam	FIFO_WIDTH = (pUSER_PROJECT_SIDEBAND_WIDTH + 4 + 4 + 1 + pDATA_WIDTH);		//upsb, tstrb, tkeep, tlast, tdata  
`else
	localparam	FIFO_WIDTH = (4 + 4 + 1 + pDATA_WIDTH);		//tstrb, tkeep, tlast, tdata
`endif

`ifdef USER_PROJECT_SIDEBAND_SUPPORT
wire [33:0] dat_in_rsc_dat = {ss_tupsb[1:0], ss_tdata[31:0]};
`else
wire [33:0] dat_in_rsc_dat = {2'b00,         ss_tdata[31:0]};
`endif

wire [33:0] dat_out_rsc_dat;


// ram0 
wire        ram0_en;
wire [63:0] ram0_q;
wire        ram0_we;
wire [63:0] ram0_d;
wire [6:0]  ram0_adr;

// ram1
wire        ram1_en;
wire [63:0] ram1_q;
wire        ram1_we;
wire [63:0] ram1_d;
wire [6:0]  ram1_adr;

//
reg  [9:0]  reg_widthIn;
reg  [8:0]  reg_heightIn;
reg         reg_sw_in;
reg         reg_rst;
wire [31:0] crc32_stream_in;
wire [31:0] crc32_stream_out;
wire        edgedetect_done;
reg  [31:0] reg_crc32_stream_in;
reg  [31:0] reg_crc32_stream_out;
reg         reg_edgedetect_done;

wire awvalid_in;
wire wvalid_in;

reg [31:0] RegisterData;

//write addr channel
assign 	awvalid_in	= awvalid; 
wire awready_out;
assign awready = awready_out;

//write data channel
assign 	wvalid_in	= wvalid;
wire wready_out;
assign wready = wready_out;

// if both awvalid_in=1 and wvalid_in=1 then output awready_out = 1 and wready_out = 1
assign awready_out = (awvalid_in && wvalid_in) ? 1 : 0;
assign wready_out = (awvalid_in && wvalid_in) ? 1 : 0;


//write register
always @(posedge axi_clk or negedge axi_reset_n)  begin
  if ( !axi_reset_n ) begin
    reg_widthIn         <= 640;
    reg_heightIn        <= 480;
    reg_sw_in           <= 1;
    reg_rst             <= 0;
  end else begin
    if ( awvalid_in && wvalid_in ) begin		//when awvalid_in=1 and wvalid_in=1 means awready_out=1 and wready_out=1
      if          (awaddr[11:2] == 10'h000 ) begin //offset 0
        if ( wstrb[0] == 1) reg_rst           <= wdata[0];
      end else if (awaddr[11:2] == 10'h001 ) begin //offset 1
        if ( wstrb[0] == 1) reg_widthIn[7:0]  <= wdata[7:0];
        if ( wstrb[1] == 1) reg_widthIn[9:8]  <= wdata[9:8];
      end else if (awaddr[11:2] == 10'h002 ) begin //offset 2
        if ( wstrb[0] == 1) reg_heightIn[7:0] <= wdata[7:0];
        if ( wstrb[1] == 1) reg_heightIn[8]   <= wdata[8];
      end else if (awaddr[11:2] == 10'h003 ) begin //offset 3
        if ( wstrb[0] == 1) reg_sw_in         <= wdata[0];
      end
    end
  end
end

always @(posedge axi_clk or negedge axi_reset_n)  begin
  if ( !axi_reset_n ) begin
      reg_edgedetect_done <= 0;
  end else begin
    if (edgedetect_done)
      reg_edgedetect_done <= 1;
    else if ( awvalid_in && wvalid_in ) begin        //when awvalid_in=1 and wvalid_in=1 means awready_out=1 and wready_out=1 
      if (awaddr[11:2] == 10'h006 ) begin //offset 6
        if ( wstrb[0] == 1) reg_edgedetect_done <= 0;
      end
    end
  end
end


//read register
reg [(pDATA_WIDTH-1) : 0] rdata_tmp;
assign arready = 1; //always assigned to 1, limitation: only support 1T in arvalid, if master issue 2T in arvalid then only 1st raddr is captured.
reg rvalid_out ;
assign rvalid = rvalid_out;
assign rdata =  rdata_tmp;
reg rd_state;
reg rd_next_state;
reg [pADDR_WIDTH-1:0] rd_addr;

//FSM
//// 
always @(posedge axi_clk or negedge axi_reset_n)  begin
  if ( !axi_reset_n ) 
    rd_state <= RD_IDLE;
  else
    rd_state <= rd_next_state;
end

always@(*)begin
  case(rd_state)
    RD_IDLE:
      if(arvalid && arready) rd_next_state = RD_ADDR_DONE;
      else      rd_next_state = RD_IDLE;
    RD_ADDR_DONE:
      if(rready && rvalid_out) rd_next_state = RD_IDLE;
      else    rd_next_state = RD_ADDR_DONE;
    default:rd_next_state = RD_IDLE;
  endcase
end 

always @(posedge axi_clk or negedge axi_reset_n)  begin
  if ( !axi_reset_n ) begin
    rd_addr <= 0;
	rvalid_out <= 0;
  end	
  else begin
    if (rd_state == RD_IDLE )
	  if(arvalid && arready) begin
		rd_addr <= araddr;
		rvalid_out <= 1;
	  end	
	if (rd_state == RD_ADDR_DONE ) 
	  if(rready && rvalid_out)
		rvalid_out <= 0;
  end	
end

////
always @(*) begin
  if      (rd_addr[11:2] == 10'h000) rdata_tmp = reg_rst;
  else if (rd_addr[11:2] == 10'h001) rdata_tmp = reg_widthIn;
  else if (rd_addr[11:2] == 10'h002) rdata_tmp = reg_heightIn;
  else if (rd_addr[11:2] == 10'h003) rdata_tmp = reg_sw_in;
  else if (rd_addr[11:2] == 10'h004) rdata_tmp = reg_crc32_stream_in;
  else if (rd_addr[11:2] == 10'h005) rdata_tmp = reg_crc32_stream_out;
  else if (rd_addr[11:2] == 10'h006) rdata_tmp = reg_edgedetect_done;
  else                              rdata_tmp = 0;
end

//DUT
assign sm_tdata  = dat_out_rsc_dat[31: 0]; 

`ifdef USER_PROJECT_SIDEBAND_SUPPORT
assign sm_tupsb = dat_out_rsc_dat[33:32];
`endif

assign sm_tlast = dat_out_rsc_dat[33];
assign {sm_tstrb, sm_tkeep} = 0;

wire dat_in_rsc_rdy;

assign ss_tready = dat_in_rsc_rdy;

always @(posedge axi_clk or negedge axi_reset_n)  begin
  if ( !axi_reset_n ) begin
    reg_crc32_stream_in  <= 0;
    reg_crc32_stream_out <= 0;
  end else if (edgedetect_done) begin
    reg_crc32_stream_in  <= crc32_stream_in ;
    reg_crc32_stream_out <= crc32_stream_out;
  end
end

EdgeDetect_Top U_EdgeDetect (
.clk                     (axi_clk           ), //user_clock2 ?
.rst                     (reg_rst           ), 
.arst_n                  (axi_reset_n       ), //~uck2_rst_n ? 
.widthIn                 (reg_widthIn       ), //I 
.heightIn                (reg_heightIn      ), //I
.sw_in                   (reg_sw_in         ), //I
.crc32_pix_in_rsc_dat    (crc32_stream_in   ), //O
.crc32_pix_in_triosy_lz  (),                   //O, not useful
.crc32_dat_out_rsc_dat   (crc32_stream_out  ), //O
.crc32_dat_out_triosy_lz (edgedetect_done   ), //O
.dat_in_rsc_dat          (dat_in_rsc_dat    ), //I
.dat_in_rsc_vld          (ss_tvalid         ), //I
.dat_in_rsc_rdy          (dat_in_rsc_rdy    ), //O
.dat_out_rsc_dat         (dat_out_rsc_dat   ), //O
.dat_out_rsc_vld         (sm_tvalid         ), //O
.dat_out_rsc_rdy         (sm_tready         ), //I
.line_buf0_rsc_en        (ram0_en           ), //O
.line_buf0_rsc_q         (ram0_q            ), //I
.line_buf0_rsc_we        (ram0_we           ), //O
.line_buf0_rsc_d         (ram0_d            ), //O
.line_buf0_rsc_adr       (ram0_adr          ), //O
.line_buf1_rsc_en        (ram1_en           ), //O
.line_buf1_rsc_q         (ram1_q            ), //I 
.line_buf1_rsc_we        (ram1_we           ), //O 
.line_buf1_rsc_d         (ram1_d            ), //O 
.line_buf1_rsc_adr       (ram1_adr          )  //O
);

//SRAM
SPRAM #(.data_width(64),.addr_width(7),.depth(80)) U_SPRAM_0(
.adr (ram0_adr ), 
.d   (ram0_d   ), 
.en  (ram0_en  ), 
.we  (ram0_we  ), 
.clk (axi_clk  ), //user_clock2 ? 
.q   (ram0_q   )
);

SPRAM #(.data_width(64),.addr_width(7),.depth(80)) U_SPRAM_1(
.adr (ram1_adr ), 
.d   (ram1_d   ), 
.en  (ram1_en  ), 
.we  (ram1_we  ), 
.clk (axi_clk  ), //user_clock2 ? 
.q   (ram1_q   )
);
//~

endmodule

`else
module USER_PRJ0 #( parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
					parameter pADDR_WIDTH   = 12,
                   parameter pDATA_WIDTH   = 32
                 )
(

// AW Channel (AXI-Lite)
  output wire                        awready,
  input  wire                        awvalid,
  input  wire                [11: 0] awaddr,
  
// W Channel (AXI-Lite)  
  output wire                        wready,
  input  wire                        wvalid,
  input  wire                 [3: 0] wstrb,
  input  wire  [(pDATA_WIDTH-1) : 0] wdata,
  
// AR Channel (AXI-Lite)  
  output wire                        arready,
  input  wire                        arvalid,
  input  wire                [11: 0] araddr,
  
// R Channel (AXI-Lite)    
  input  wire                        rready,
  output wire                        rvalid,
  output wire  [(pDATA_WIDTH-1) : 0] rdata,

// SS  (AXI-Stream)
  output wire                        ss_tready,
  input  wire                        ss_tvalid,
  input  wire  [(pDATA_WIDTH-1) : 0] ss_tdata,
  input  wire                 [1: 0] ss_tuser,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
	input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] ss_tupsb,
  `endif
  input  wire                 [3: 0] ss_tstrb,
  input  wire                 [3: 0] ss_tkeep,
  input  wire                        ss_tlast,

// SM  (AXI-Stream)
  input  wire                        sm_tready,
  output wire                        sm_tvalid,
  output wire  [(pDATA_WIDTH-1) : 0] sm_tdata,
  output wire                 [2: 0] sm_tid,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
	output  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb,
  `endif
  output wire                 [3: 0] sm_tstrb,
  output wire                 [3: 0] sm_tkeep,
  output wire                        sm_tlast,
  
//  
  output wire                        low__pri_irq,
  output wire                        High_pri_req,
  output wire                [23: 0] la_data_o,
  input  wire                        axi_clk,
  input  wire                        axis_clk,
  input  wire                        axi_reset_n,
  input  wire                        axis_rst_n,
  input  wire                        user_clock2,
  input  wire                        uck2_rst_n
);

//[TODO] does tlast from FPGA to SOC need send to UP? or use upsb as UP's tlast?
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
	localparam	FIFO_WIDTH = (pUSER_PROJECT_SIDEBAND_WIDTH + 4 + 4 + 1 + pDATA_WIDTH);		//upsb, tstrb, tkeep, tlast, tdata  
`else
	localparam	FIFO_WIDTH = (4 + 4 + 1 + pDATA_WIDTH);		//tstrb, tkeep, tlast, tdata
`endif


wire awvalid_in;
wire wvalid_in;

reg [31:0] RegisterData;

//write addr channel
assign 	awvalid_in	= awvalid; 
wire awready_out;
assign awready = awready_out;

//write data channel
assign 	wvalid_in	= wvalid;
wire wready_out;
assign wready = wready_out;

// if both awvalid_in=1 and wvalid_in=1 then output awready_out = 1 and wready_out = 1
assign awready_out = (awvalid_in && wvalid_in) ? 1 : 0;
assign wready_out = (awvalid_in && wvalid_in) ? 1 : 0;

assign arready = 1;

assign rvalid = 1;
assign rdata =  RegisterData;

//write register
always @(posedge axi_clk or negedge axi_reset_n)  begin
  if ( !axi_reset_n ) begin
    RegisterData <= 32'haa55aa55;
  end
  else begin
    if ( awvalid_in && wvalid_in ) begin		//when awvalid_in=1 and wvalid_in=1 means awready_out=1 and wready_out=1
      if (awaddr[11:2] == 10'h000 ) begin //offset 0
        if ( wstrb[0] == 1) RegisterData[7:0] <= wdata[7:0];
        if ( wstrb[1] == 1) RegisterData[15:8] <= wdata[15:8];
        if ( wstrb[2] == 1) RegisterData[23:16] <= wdata[23:16];
        if ( wstrb[3] == 1) RegisterData[31:24] <= wdata[31:24];  
      end
      else begin
        RegisterData <= RegisterData;
      end
    end
  end
end

reg [2:0] r_ptr;
reg [2:0] w_ptr;
reg [(FIFO_WIDTH-1) : 0] fifo[7:0];

wire full;
wire empty;

assign empty = (r_ptr == w_ptr);
assign full = (r_ptr == (w_ptr+1) );

assign ss_tready = !full;

//for push to fifo
always @(posedge axis_clk or negedge axis_rst_n)  begin
  if ( !axis_rst_n ) begin
    w_ptr <= 0;
  end
  else begin
	if ( ss_tready && ss_tvalid) begin
		`ifdef USER_PROJECT_SIDEBAND_SUPPORT
			fifo[w_ptr] <= {ss_tupsb, ss_tstrb, ss_tkeep, ss_tlast, ss_tdata}; 
		`else
			fifo[w_ptr] <= {ss_tstrb, ss_tkeep, ss_tlast, ss_tdata}; 
		`endif
		w_ptr <= w_ptr + 1;
	end
  end
end  

//for pop from fifo

`ifdef USER_PROJECT_SIDEBAND_SUPPORT
	assign {sm_tupsb, sm_tstrb, sm_tkeep, sm_tlast, sm_tdata} = fifo[r_ptr];
`else
	assign {sm_tstrb, sm_tkeep, sm_tlast, sm_tdata} = fifo[r_ptr];
`endif

assign sm_tvalid = !empty;
always @(posedge axis_clk or negedge axis_rst_n)  begin
  if ( !axis_rst_n ) begin
    r_ptr <= 0;
  end
  else begin
	if ( sm_tready && sm_tvalid) begin
		r_ptr <= r_ptr + 1;
	end
  end
end  

assign sm_tid = 3'b000;		//[TODO] remove tid in user project.
assign low__pri_irq  = 1'b0;
assign High_pri_req  = 1'b0;
assign la_data_o     = 24'b0;


endmodule // USER_PRJ0
`endif


