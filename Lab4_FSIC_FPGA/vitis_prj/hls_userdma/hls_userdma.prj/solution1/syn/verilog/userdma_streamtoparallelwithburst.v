// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module userdma_streamtoparallelwithburst (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        inbuf_dout,
        inbuf_num_data_valid,
        inbuf_fifo_cap,
        inbuf_empty_n,
        inbuf_read,
        incount47_dout,
        incount47_num_data_valid,
        incount47_fifo_cap,
        incount47_empty_n,
        incount47_read,
        in_en_clrsts_dout,
        in_en_clrsts_num_data_valid,
        in_en_clrsts_fifo_cap,
        in_en_clrsts_empty_n,
        in_en_clrsts_read,
        s2m_buf_sts,
        s2m_buf_sts_ap_vld,
        sts_clear_dout,
        sts_clear_num_data_valid,
        sts_clear_fifo_cap,
        sts_clear_empty_n,
        sts_clear_read,
        in_s2m_len_dout,
        in_s2m_len_num_data_valid,
        in_s2m_len_fifo_cap,
        in_s2m_len_empty_n,
        in_s2m_len_read,
        m_axi_gmem0_AWVALID,
        m_axi_gmem0_AWREADY,
        m_axi_gmem0_AWADDR,
        m_axi_gmem0_AWID,
        m_axi_gmem0_AWLEN,
        m_axi_gmem0_AWSIZE,
        m_axi_gmem0_AWBURST,
        m_axi_gmem0_AWLOCK,
        m_axi_gmem0_AWCACHE,
        m_axi_gmem0_AWPROT,
        m_axi_gmem0_AWQOS,
        m_axi_gmem0_AWREGION,
        m_axi_gmem0_AWUSER,
        m_axi_gmem0_WVALID,
        m_axi_gmem0_WREADY,
        m_axi_gmem0_WDATA,
        m_axi_gmem0_WSTRB,
        m_axi_gmem0_WLAST,
        m_axi_gmem0_WID,
        m_axi_gmem0_WUSER,
        m_axi_gmem0_ARVALID,
        m_axi_gmem0_ARREADY,
        m_axi_gmem0_ARADDR,
        m_axi_gmem0_ARID,
        m_axi_gmem0_ARLEN,
        m_axi_gmem0_ARSIZE,
        m_axi_gmem0_ARBURST,
        m_axi_gmem0_ARLOCK,
        m_axi_gmem0_ARCACHE,
        m_axi_gmem0_ARPROT,
        m_axi_gmem0_ARQOS,
        m_axi_gmem0_ARREGION,
        m_axi_gmem0_ARUSER,
        m_axi_gmem0_RVALID,
        m_axi_gmem0_RREADY,
        m_axi_gmem0_RDATA,
        m_axi_gmem0_RLAST,
        m_axi_gmem0_RID,
        m_axi_gmem0_RFIFONUM,
        m_axi_gmem0_RUSER,
        m_axi_gmem0_RRESP,
        m_axi_gmem0_BVALID,
        m_axi_gmem0_BREADY,
        m_axi_gmem0_BRESP,
        m_axi_gmem0_BID,
        m_axi_gmem0_BUSER,
        out_memory_dout,
        out_memory_num_data_valid,
        out_memory_fifo_cap,
        out_memory_empty_n,
        out_memory_read
);

parameter    ap_ST_fsm_state1 = 21'd1;
parameter    ap_ST_fsm_state2 = 21'd2;
parameter    ap_ST_fsm_state3 = 21'd4;
parameter    ap_ST_fsm_state4 = 21'd8;
parameter    ap_ST_fsm_state5 = 21'd16;
parameter    ap_ST_fsm_state6 = 21'd32;
parameter    ap_ST_fsm_state7 = 21'd64;
parameter    ap_ST_fsm_state8 = 21'd128;
parameter    ap_ST_fsm_state9 = 21'd256;
parameter    ap_ST_fsm_state10 = 21'd512;
parameter    ap_ST_fsm_state11 = 21'd1024;
parameter    ap_ST_fsm_state12 = 21'd2048;
parameter    ap_ST_fsm_state13 = 21'd4096;
parameter    ap_ST_fsm_state14 = 21'd8192;
parameter    ap_ST_fsm_state15 = 21'd16384;
parameter    ap_ST_fsm_state16 = 21'd32768;
parameter    ap_ST_fsm_state17 = 21'd65536;
parameter    ap_ST_fsm_state18 = 21'd131072;
parameter    ap_ST_fsm_state19 = 21'd262144;
parameter    ap_ST_fsm_state20 = 21'd524288;
parameter    ap_ST_fsm_state21 = 21'd1048576;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [32:0] inbuf_dout;
input  [7:0] inbuf_num_data_valid;
input  [7:0] inbuf_fifo_cap;
input   inbuf_empty_n;
output   inbuf_read;
input  [31:0] incount47_dout;
input  [3:0] incount47_num_data_valid;
input  [3:0] incount47_fifo_cap;
input   incount47_empty_n;
output   incount47_read;
input  [0:0] in_en_clrsts_dout;
input  [1:0] in_en_clrsts_num_data_valid;
input  [1:0] in_en_clrsts_fifo_cap;
input   in_en_clrsts_empty_n;
output   in_en_clrsts_read;
output  [0:0] s2m_buf_sts;
output   s2m_buf_sts_ap_vld;
input  [0:0] sts_clear_dout;
input  [2:0] sts_clear_num_data_valid;
input  [2:0] sts_clear_fifo_cap;
input   sts_clear_empty_n;
output   sts_clear_read;
input  [31:0] in_s2m_len_dout;
input  [1:0] in_s2m_len_num_data_valid;
input  [1:0] in_s2m_len_fifo_cap;
input   in_s2m_len_empty_n;
output   in_s2m_len_read;
output   m_axi_gmem0_AWVALID;
input   m_axi_gmem0_AWREADY;
output  [63:0] m_axi_gmem0_AWADDR;
output  [0:0] m_axi_gmem0_AWID;
output  [31:0] m_axi_gmem0_AWLEN;
output  [2:0] m_axi_gmem0_AWSIZE;
output  [1:0] m_axi_gmem0_AWBURST;
output  [1:0] m_axi_gmem0_AWLOCK;
output  [3:0] m_axi_gmem0_AWCACHE;
output  [2:0] m_axi_gmem0_AWPROT;
output  [3:0] m_axi_gmem0_AWQOS;
output  [3:0] m_axi_gmem0_AWREGION;
output  [0:0] m_axi_gmem0_AWUSER;
output   m_axi_gmem0_WVALID;
input   m_axi_gmem0_WREADY;
output  [31:0] m_axi_gmem0_WDATA;
output  [3:0] m_axi_gmem0_WSTRB;
output   m_axi_gmem0_WLAST;
output  [0:0] m_axi_gmem0_WID;
output  [0:0] m_axi_gmem0_WUSER;
output   m_axi_gmem0_ARVALID;
input   m_axi_gmem0_ARREADY;
output  [63:0] m_axi_gmem0_ARADDR;
output  [0:0] m_axi_gmem0_ARID;
output  [31:0] m_axi_gmem0_ARLEN;
output  [2:0] m_axi_gmem0_ARSIZE;
output  [1:0] m_axi_gmem0_ARBURST;
output  [1:0] m_axi_gmem0_ARLOCK;
output  [3:0] m_axi_gmem0_ARCACHE;
output  [2:0] m_axi_gmem0_ARPROT;
output  [3:0] m_axi_gmem0_ARQOS;
output  [3:0] m_axi_gmem0_ARREGION;
output  [0:0] m_axi_gmem0_ARUSER;
input   m_axi_gmem0_RVALID;
output   m_axi_gmem0_RREADY;
input  [31:0] m_axi_gmem0_RDATA;
input   m_axi_gmem0_RLAST;
input  [0:0] m_axi_gmem0_RID;
input  [8:0] m_axi_gmem0_RFIFONUM;
input  [0:0] m_axi_gmem0_RUSER;
input  [1:0] m_axi_gmem0_RRESP;
input   m_axi_gmem0_BVALID;
output   m_axi_gmem0_BREADY;
input  [1:0] m_axi_gmem0_BRESP;
input  [0:0] m_axi_gmem0_BID;
input  [0:0] m_axi_gmem0_BUSER;
input  [63:0] out_memory_dout;
input  [2:0] out_memory_num_data_valid;
input  [2:0] out_memory_fifo_cap;
input   out_memory_empty_n;
output   out_memory_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg inbuf_read;
reg incount47_read;
reg in_en_clrsts_read;
reg[0:0] s2m_buf_sts;
reg s2m_buf_sts_ap_vld;
reg sts_clear_read;
reg in_s2m_len_read;
reg m_axi_gmem0_AWVALID;
reg[63:0] m_axi_gmem0_AWADDR;
reg[0:0] m_axi_gmem0_AWID;
reg[31:0] m_axi_gmem0_AWLEN;
reg[2:0] m_axi_gmem0_AWSIZE;
reg[1:0] m_axi_gmem0_AWBURST;
reg[1:0] m_axi_gmem0_AWLOCK;
reg[3:0] m_axi_gmem0_AWCACHE;
reg[2:0] m_axi_gmem0_AWPROT;
reg[3:0] m_axi_gmem0_AWQOS;
reg[3:0] m_axi_gmem0_AWREGION;
reg[0:0] m_axi_gmem0_AWUSER;
reg m_axi_gmem0_WVALID;
reg m_axi_gmem0_BREADY;
reg out_memory_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [20:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] out_sts;
reg   [31:0] final_s2m_len_V;
reg    incount47_blk_n;
wire    ap_CS_fsm_state2;
reg    in_en_clrsts_blk_n;
reg    sts_clear_blk_n;
reg    in_s2m_len_blk_n;
reg    gmem0_blk_n_AW;
wire    ap_CS_fsm_state3;
reg    gmem0_blk_n_B;
wire    ap_CS_fsm_state19;
reg   [0:0] icmp_ln23_reg_301;
reg    out_memory_blk_n;
reg   [63:0] out_memory_read_reg_269;
wire   [0:0] in_en_clrsts_read_read_fu_100_p2;
reg   [0:0] in_en_clrsts_read_reg_274;
reg   [31:0] in_s2m_len_read_reg_278;
reg  signed [31:0] tmp_reg_293;
wire   [0:0] icmp_ln23_fu_182_p2;
reg   [61:0] trunc_ln_reg_305;
wire   [30:0] trunc_ln23_fu_219_p1;
reg   [30:0] trunc_ln23_reg_316;
wire    ap_CS_fsm_state4;
reg   [0:0] grp_load_fu_161_p1;
reg   [0:0] out_sts_load_1_reg_324;
wire    ap_CS_fsm_state21;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_done;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_idle;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_ready;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_inbuf_read;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWVALID;
wire   [63:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWADDR;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWID;
wire   [31:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWLEN;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWBURST;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWPROT;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWQOS;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWREGION;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWUSER;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WVALID;
wire   [31:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WDATA;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WSTRB;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WLAST;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WID;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WUSER;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARVALID;
wire   [63:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARADDR;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARID;
wire   [31:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARLEN;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARBURST;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARPROT;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARQOS;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARREGION;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARUSER;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_RREADY;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_BREADY;
reg   [0:0] ap_phi_mux_storemerge_phi_fu_141_p4;
reg   [0:0] storemerge_reg_138;
wire    ap_CS_fsm_state20;
reg    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start_reg;
wire    ap_CS_fsm_state5;
wire  signed [63:0] sext_ln23_fu_209_p1;
reg    ap_block_state19;
wire   [0:0] icmp_ln1065_fu_247_p2;
reg   [0:0] ap_sig_allocacmp_out_sts_load_1;
reg    ap_block_state1;
wire   [0:0] sts_clear_read_read_fu_112_p2;
wire   [31:0] add_ln886_fu_236_p2;
reg   [63:0] idx_fu_90;
wire   [63:0] add_ln28_fu_226_p2;
wire   [0:0] icmp_ln1073_fu_258_p2;
reg   [0:0] s2m_buf_sts_preg;
wire  signed [31:0] icmp_ln23_fu_182_p0;
wire   [63:0] shl_ln23_fu_188_p2;
wire   [63:0] add_ln23_fu_194_p2;
wire  signed [63:0] sext_ln28_fu_223_p1;
reg   [20:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
reg    ap_ST_fsm_state19_blk;
wire    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 21'd1;
#0 out_sts = 1'd0;
#0 final_s2m_len_V = 32'd0;
#0 grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start_reg = 1'b0;
#0 s2m_buf_sts_preg = 1'd0;
end

userdma_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2 grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start),
    .ap_done(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_done),
    .ap_idle(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_idle),
    .ap_ready(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_ready),
    .inbuf_dout(inbuf_dout),
    .inbuf_num_data_valid(8'd0),
    .inbuf_fifo_cap(8'd0),
    .inbuf_empty_n(inbuf_empty_n),
    .inbuf_read(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_inbuf_read),
    .m_axi_gmem0_AWVALID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(m_axi_gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(m_axi_gmem0_WREADY),
    .m_axi_gmem0_WDATA(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(1'b0),
    .m_axi_gmem0_ARADDR(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(1'b0),
    .m_axi_gmem0_RREADY(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(32'd0),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RFIFONUM(9'd0),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(m_axi_gmem0_BVALID),
    .m_axi_gmem0_BREADY(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(m_axi_gmem0_BRESP),
    .m_axi_gmem0_BID(m_axi_gmem0_BID),
    .m_axi_gmem0_BUSER(m_axi_gmem0_BUSER),
    .sext_ln23(trunc_ln_reg_305),
    .trunc_ln23_1(trunc_ln23_reg_316)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state20)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start_reg <= 1'b1;
        end else if ((grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_ready == 1'b1)) begin
            grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        s2m_buf_sts_preg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state20)) begin
            s2m_buf_sts_preg <= ap_phi_mux_storemerge_phi_fu_141_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (sts_clear_read_read_fu_112_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts_read_read_fu_100_p2 == 1'd1))) begin
        final_s2m_len_V <= 32'd0;
    end else if ((~((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state19))) begin
        final_s2m_len_V <= add_ln886_fu_236_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts_read_read_fu_100_p2 == 1'd0))) begin
        idx_fu_90 <= 64'd0;
    end else if ((~((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0)) & (icmp_ln1073_fu_258_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
        idx_fu_90 <= add_ln28_fu_226_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (sts_clear_read_read_fu_112_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts_read_read_fu_100_p2 == 1'd1))) begin
        out_sts <= 1'd0;
    end else if ((~((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0)) & (icmp_ln1065_fu_247_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
        out_sts <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state20) & (in_en_clrsts_read_reg_274 == 1'd0))) begin
        storemerge_reg_138 <= out_sts_load_1_reg_324;
    end else if ((1'b1 == ap_CS_fsm_state21)) begin
        storemerge_reg_138 <= grp_load_fu_161_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        icmp_ln23_reg_301 <= icmp_ln23_fu_182_p2;
        tmp_reg_293 <= incount47_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_en_clrsts_read_reg_274 <= in_en_clrsts_dout;
        in_s2m_len_read_reg_278 <= in_s2m_len_dout;
        out_memory_read_reg_269 <= out_memory_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        out_sts_load_1_reg_324 <= grp_load_fu_161_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        trunc_ln23_reg_316 <= trunc_ln23_fu_219_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln23_fu_182_p2 == 1'd1))) begin
        trunc_ln_reg_305 <= {{add_ln23_fu_194_p2[63:2]}};
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

always @ (*) begin
    if (((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0))) begin
        ap_ST_fsm_state19_blk = 1'b1;
    end else begin
        ap_ST_fsm_state19_blk = 1'b0;
    end
end

always @ (*) begin
    if (((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state20_blk = 1'b0;

assign ap_ST_fsm_state21_blk = 1'b0;

always @ (*) begin
    if ((incount47_empty_n == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((m_axi_gmem0_AWREADY == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state20) & (in_en_clrsts_read_reg_274 == 1'd0))) begin
        ap_phi_mux_storemerge_phi_fu_141_p4 = out_sts_load_1_reg_324;
    end else begin
        ap_phi_mux_storemerge_phi_fu_141_p4 = storemerge_reg_138;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1065_fu_247_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
        ap_sig_allocacmp_out_sts_load_1 = 1'd1;
    end else begin
        ap_sig_allocacmp_out_sts_load_1 = out_sts;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        gmem0_blk_n_AW = m_axi_gmem0_AWREADY;
    end else begin
        gmem0_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln23_reg_301 == 1'd1))) begin
        gmem0_blk_n_B = m_axi_gmem0_BVALID;
    end else begin
        gmem0_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state21)) begin
        grp_load_fu_161_p1 = out_sts;
    end else if ((1'b1 == ap_CS_fsm_state19)) begin
        grp_load_fu_161_p1 = ap_sig_allocacmp_out_sts_load_1;
    end else begin
        grp_load_fu_161_p1 = 'bx;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_en_clrsts_blk_n = in_en_clrsts_empty_n;
    end else begin
        in_en_clrsts_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_en_clrsts_read = 1'b1;
    end else begin
        in_en_clrsts_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_s2m_len_blk_n = in_s2m_len_empty_n;
    end else begin
        in_s2m_len_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        in_s2m_len_read = 1'b1;
    end else begin
        in_s2m_len_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        inbuf_read = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_inbuf_read;
    end else begin
        inbuf_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        incount47_blk_n = incount47_empty_n;
    end else begin
        incount47_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((incount47_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        incount47_read = 1'b1;
    end else begin
        incount47_read = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem0_AWADDR = sext_ln23_fu_209_p1;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWADDR = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWADDR;
    end else begin
        m_axi_gmem0_AWADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWBURST = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWBURST;
    end else begin
        m_axi_gmem0_AWBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWCACHE = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWCACHE;
    end else begin
        m_axi_gmem0_AWCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWID;
    end else begin
        m_axi_gmem0_AWID = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem0_AWLEN = tmp_reg_293;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWLEN = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWLEN;
    end else begin
        m_axi_gmem0_AWLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWLOCK = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWLOCK;
    end else begin
        m_axi_gmem0_AWLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWPROT = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWPROT;
    end else begin
        m_axi_gmem0_AWPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWQOS = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWQOS;
    end else begin
        m_axi_gmem0_AWQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWREGION = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWREGION;
    end else begin
        m_axi_gmem0_AWREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWSIZE = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWSIZE;
    end else begin
        m_axi_gmem0_AWSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWUSER = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWUSER;
    end else begin
        m_axi_gmem0_AWUSER = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem0_AWVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWVALID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_AWVALID;
    end else begin
        m_axi_gmem0_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state19) & (icmp_ln23_reg_301 == 1'd1))) begin
        m_axi_gmem0_BREADY = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_BREADY = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_BREADY;
    end else begin
        m_axi_gmem0_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_WVALID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WVALID;
    end else begin
        m_axi_gmem0_WVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_memory_blk_n = out_memory_empty_n;
    end else begin
        out_memory_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_memory_read = 1'b1;
    end else begin
        out_memory_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        s2m_buf_sts = ap_phi_mux_storemerge_phi_fu_141_p4;
    end else begin
        s2m_buf_sts = s2m_buf_sts_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        s2m_buf_sts_ap_vld = 1'b1;
    end else begin
        s2m_buf_sts_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sts_clear_blk_n = sts_clear_empty_n;
    end else begin
        sts_clear_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sts_clear_read = 1'b1;
    end else begin
        sts_clear_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts_read_read_fu_100_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state21;
            end else if ((~((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1) & (in_en_clrsts_read_read_fu_100_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((incount47_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln23_fu_182_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end else if (((incount47_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln23_fu_182_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            if ((~((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0)) & (icmp_ln1073_fu_258_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0)) & (icmp_ln1073_fu_258_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state19))) begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln23_fu_194_p2 = (out_memory_read_reg_269 + shl_ln23_fu_188_p2);

assign add_ln28_fu_226_p2 = ($signed(sext_ln28_fu_223_p1) + $signed(idx_fu_90));

assign add_ln886_fu_236_p2 = ($signed(final_s2m_len_V) + $signed(tmp_reg_293));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((in_s2m_len_empty_n == 1'b0) | (sts_clear_empty_n == 1'b0) | (in_en_clrsts_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0) | (out_memory_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state19 = ((icmp_ln23_reg_301 == 1'd1) & (m_axi_gmem0_BVALID == 1'b0));
end

assign grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_ap_start_reg;

assign icmp_ln1065_fu_247_p2 = ((add_ln886_fu_236_p2 == in_s2m_len_read_reg_278) ? 1'b1 : 1'b0);

assign icmp_ln1073_fu_258_p2 = ((add_ln886_fu_236_p2 < 32'd57600) ? 1'b1 : 1'b0);

assign icmp_ln23_fu_182_p0 = incount47_dout;

assign icmp_ln23_fu_182_p2 = (($signed(icmp_ln23_fu_182_p0) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign in_en_clrsts_read_read_fu_100_p2 = in_en_clrsts_dout;

assign m_axi_gmem0_ARADDR = 64'd0;

assign m_axi_gmem0_ARBURST = 2'd0;

assign m_axi_gmem0_ARCACHE = 4'd0;

assign m_axi_gmem0_ARID = 1'd0;

assign m_axi_gmem0_ARLEN = 32'd0;

assign m_axi_gmem0_ARLOCK = 2'd0;

assign m_axi_gmem0_ARPROT = 3'd0;

assign m_axi_gmem0_ARQOS = 4'd0;

assign m_axi_gmem0_ARREGION = 4'd0;

assign m_axi_gmem0_ARSIZE = 3'd0;

assign m_axi_gmem0_ARUSER = 1'd0;

assign m_axi_gmem0_ARVALID = 1'b0;

assign m_axi_gmem0_RREADY = 1'b0;

assign m_axi_gmem0_WDATA = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WDATA;

assign m_axi_gmem0_WID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WID;

assign m_axi_gmem0_WLAST = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WLAST;

assign m_axi_gmem0_WSTRB = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WSTRB;

assign m_axi_gmem0_WUSER = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148_m_axi_gmem0_WUSER;

assign sext_ln23_fu_209_p1 = $signed(trunc_ln_reg_305);

assign sext_ln28_fu_223_p1 = tmp_reg_293;

assign shl_ln23_fu_188_p2 = idx_fu_90 << 64'd2;

assign sts_clear_read_read_fu_112_p2 = sts_clear_dout;

assign trunc_ln23_fu_219_p1 = tmp_reg_293[30:0];

endmodule //userdma_streamtoparallelwithburst
