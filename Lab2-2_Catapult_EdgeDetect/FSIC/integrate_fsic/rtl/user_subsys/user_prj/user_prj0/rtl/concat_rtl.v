
//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  localparam stallOff = 0; 
  wire                  stall_ctrl;
  assign stall_ctrl = stallOff;

  assign idat = dat;
  assign rdy = irdy && !stall_ctrl;
  assign ivld = vld && !stall_ctrl;

endmodule


//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  localparam stallOff = 0; 
  wire stall_ctrl;
  assign stall_ctrl = stallOff;

  assign dat = idat;
  assign irdy = rdy && !stall_ctrl;
  assign vld = ivld && !stall_ctrl;

endmodule



//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_out_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_out_v1 (dat, idat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output   [width-1:0] dat;
  input    [width-1:0] idat;

  wire     [width-1:0] dat;

  assign dat = idat;

endmodule




//------> ../EdgeDetect_IP_EdgeDetect_MagAng.v1/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2024.1/1091966 Production Release
//  HLS Date:       Wed Feb 14 09:07:18 PST 2024
// 
//  Generated by:   ee525201@ws41
//  Generated date: Fri Apr 12 23:24:44 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, MCOL_C_0_tr0, MROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input MCOL_C_0_tr0;
  input MROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    MCOL_C_0 = 2'd1,
    MROW_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_1
    case (state_var)
      MCOL_C_0 : begin
        fsm_output = 4'b0010;
        if ( MCOL_C_0_tr0 ) begin
          state_var_NS = MROW_C_0;
        end
        else begin
          state_var_NS = MCOL_C_0;
        end
      end
      MROW_C_0 : begin
        fsm_output = 4'b0100;
        if ( MROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = MCOL_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 4'b0001;
        state_var_NS = MCOL_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_staller
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_staller (
  clk, rst, arst_n, run_wen, run_wten, dx_in_rsci_wen_comp, dy_in_rsci_wen_comp,
      dat_in_rsci_wen_comp, dat_out_rsci_wen_comp
);
  input clk;
  input rst;
  input arst_n;
  output run_wen;
  output run_wten;
  reg run_wten;
  input dx_in_rsci_wen_comp;
  input dy_in_rsci_wen_comp;
  input dat_in_rsci_wen_comp;
  input dat_out_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dx_in_rsci_wen_comp & dy_in_rsci_wen_comp & dat_in_rsci_wen_comp
      & dat_out_rsci_wen_comp;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      run_wten <= 1'b0;
    end
    else if ( rst ) begin
      run_wten <= 1'b0;
    end
    else begin
      run_wten <= ~ run_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
    (
  run_wten, crc32_dat_out_triosy_obj_iswt0, crc32_dat_out_triosy_obj_biwt
);
  input run_wten;
  input crc32_dat_out_triosy_obj_iswt0;
  output crc32_dat_out_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign crc32_dat_out_triosy_obj_biwt = (~ run_wten) & crc32_dat_out_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
    (
  run_wten, crc32_pix_in_triosy_obj_iswt0, crc32_pix_in_triosy_obj_biwt
);
  input run_wten;
  input crc32_pix_in_triosy_obj_iswt0;
  output crc32_pix_in_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign crc32_pix_in_triosy_obj_biwt = (~ run_wten) & crc32_pix_in_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_dp (
  clk, rst, arst_n, dat_in_rsci_oswt, dat_in_rsci_wen_comp, dat_in_rsci_idat_mxwt,
      dat_in_rsci_biwt, dat_in_rsci_bdwt, dat_in_rsci_bcwt, dat_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;
  input dat_in_rsci_biwt;
  input dat_in_rsci_bdwt;
  output dat_in_rsci_bcwt;
  reg dat_in_rsci_bcwt;
  input [31:0] dat_in_rsci_idat;


  // Interconnect Declarations
  reg [31:0] dat_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_wen_comp = (~ dat_in_rsci_oswt) | dat_in_rsci_biwt | dat_in_rsci_bcwt;
  assign dat_in_rsci_idat_mxwt = MUX_v_32_2_2(dat_in_rsci_idat, dat_in_rsci_idat_bfwt,
      dat_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_in_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_in_rsci_bcwt <= ~((~(dat_in_rsci_bcwt | dat_in_rsci_biwt)) | dat_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( dat_in_rsci_biwt ) begin
      dat_in_rsci_idat_bfwt <= dat_in_rsci_idat;
    end
  end

  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_ctrl (
  run_wen, dat_in_rsci_oswt, dat_in_rsci_biwt, dat_in_rsci_bdwt, dat_in_rsci_bcwt,
      dat_in_rsci_irdy_run_sct, dat_in_rsci_ivld
);
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_biwt;
  output dat_in_rsci_bdwt;
  input dat_in_rsci_bcwt;
  output dat_in_rsci_irdy_run_sct;
  input dat_in_rsci_ivld;


  // Interconnect Declarations
  wire dat_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_bdwt = dat_in_rsci_oswt & run_wen;
  assign dat_in_rsci_biwt = dat_in_rsci_ogwt & dat_in_rsci_ivld;
  assign dat_in_rsci_ogwt = dat_in_rsci_oswt & (~ dat_in_rsci_bcwt);
  assign dat_in_rsci_irdy_run_sct = dat_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp (
  clk, rst, arst_n, dy_in_rsci_oswt, dy_in_rsci_wen_comp, dy_in_rsci_idat_mxwt, dy_in_rsci_biwt,
      dy_in_rsci_bdwt, dy_in_rsci_bcwt, dy_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input dy_in_rsci_oswt;
  output dy_in_rsci_wen_comp;
  output [35:0] dy_in_rsci_idat_mxwt;
  input dy_in_rsci_biwt;
  input dy_in_rsci_bdwt;
  output dy_in_rsci_bcwt;
  reg dy_in_rsci_bcwt;
  input [35:0] dy_in_rsci_idat;


  // Interconnect Declarations
  reg [35:0] dy_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_in_rsci_wen_comp = (~ dy_in_rsci_oswt) | dy_in_rsci_biwt | dy_in_rsci_bcwt;
  assign dy_in_rsci_idat_mxwt = MUX_v_36_2_2(dy_in_rsci_idat, dy_in_rsci_idat_bfwt,
      dy_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dy_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dy_in_rsci_bcwt <= 1'b0;
    end
    else begin
      dy_in_rsci_bcwt <= ~((~(dy_in_rsci_bcwt | dy_in_rsci_biwt)) | dy_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( dy_in_rsci_biwt ) begin
      dy_in_rsci_idat_bfwt <= dy_in_rsci_idat;
    end
  end

  function automatic [35:0] MUX_v_36_2_2;
    input [35:0] input_0;
    input [35:0] input_1;
    input  sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl (
  run_wen, dy_in_rsci_oswt, dy_in_rsci_biwt, dy_in_rsci_bdwt, dy_in_rsci_bcwt, dy_in_rsci_irdy_run_sct,
      dy_in_rsci_ivld
);
  input run_wen;
  input dy_in_rsci_oswt;
  output dy_in_rsci_biwt;
  output dy_in_rsci_bdwt;
  input dy_in_rsci_bcwt;
  output dy_in_rsci_irdy_run_sct;
  input dy_in_rsci_ivld;


  // Interconnect Declarations
  wire dy_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_in_rsci_bdwt = dy_in_rsci_oswt & run_wen;
  assign dy_in_rsci_biwt = dy_in_rsci_ogwt & dy_in_rsci_ivld;
  assign dy_in_rsci_ogwt = dy_in_rsci_oswt & (~ dy_in_rsci_bcwt);
  assign dy_in_rsci_irdy_run_sct = dy_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp (
  clk, rst, arst_n, dx_in_rsci_oswt, dx_in_rsci_wen_comp, dx_in_rsci_idat_mxwt, dx_in_rsci_biwt,
      dx_in_rsci_bdwt, dx_in_rsci_bcwt, dx_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input dx_in_rsci_oswt;
  output dx_in_rsci_wen_comp;
  output [35:0] dx_in_rsci_idat_mxwt;
  input dx_in_rsci_biwt;
  input dx_in_rsci_bdwt;
  output dx_in_rsci_bcwt;
  reg dx_in_rsci_bcwt;
  input [35:0] dx_in_rsci_idat;


  // Interconnect Declarations
  reg [35:0] dx_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_in_rsci_wen_comp = (~ dx_in_rsci_oswt) | dx_in_rsci_biwt | dx_in_rsci_bcwt;
  assign dx_in_rsci_idat_mxwt = MUX_v_36_2_2(dx_in_rsci_idat, dx_in_rsci_idat_bfwt,
      dx_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dx_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dx_in_rsci_bcwt <= 1'b0;
    end
    else begin
      dx_in_rsci_bcwt <= ~((~(dx_in_rsci_bcwt | dx_in_rsci_biwt)) | dx_in_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( dx_in_rsci_biwt ) begin
      dx_in_rsci_idat_bfwt <= dx_in_rsci_idat;
    end
  end

  function automatic [35:0] MUX_v_36_2_2;
    input [35:0] input_0;
    input [35:0] input_1;
    input  sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl (
  run_wen, dx_in_rsci_oswt, dx_in_rsci_biwt, dx_in_rsci_bdwt, dx_in_rsci_bcwt, dx_in_rsci_irdy_run_sct,
      dx_in_rsci_ivld
);
  input run_wen;
  input dx_in_rsci_oswt;
  output dx_in_rsci_biwt;
  output dx_in_rsci_bdwt;
  input dx_in_rsci_bcwt;
  output dx_in_rsci_irdy_run_sct;
  input dx_in_rsci_ivld;


  // Interconnect Declarations
  wire dx_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_in_rsci_bdwt = dx_in_rsci_oswt & run_wen;
  assign dx_in_rsci_biwt = dx_in_rsci_ogwt & dx_in_rsci_ivld;
  assign dx_in_rsci_ogwt = dx_in_rsci_oswt & (~ dx_in_rsci_bcwt);
  assign dx_in_rsci_irdy_run_sct = dx_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj (
  crc32_dat_out_triosy_lz, run_wten, crc32_dat_out_triosy_obj_iswt0
);
  output crc32_dat_out_triosy_lz;
  input run_wten;
  input crc32_dat_out_triosy_obj_iswt0;


  // Interconnect Declarations
  wire crc32_dat_out_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) crc32_dat_out_triosy_obj (
      .ld(crc32_dat_out_triosy_obj_biwt),
      .lz(crc32_dat_out_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
      EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .crc32_dat_out_triosy_obj_iswt0(crc32_dat_out_triosy_obj_iswt0),
      .crc32_dat_out_triosy_obj_biwt(crc32_dat_out_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj (
  crc32_pix_in_triosy_lz, run_wten, crc32_pix_in_triosy_obj_iswt0
);
  output crc32_pix_in_triosy_lz;
  input run_wten;
  input crc32_pix_in_triosy_obj_iswt0;


  // Interconnect Declarations
  wire crc32_pix_in_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) crc32_pix_in_triosy_obj (
      .ld(crc32_pix_in_triosy_obj_biwt),
      .lz(crc32_pix_in_triosy_lz)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
      EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .crc32_pix_in_triosy_obj_iswt0(crc32_pix_in_triosy_obj_iswt0),
      .crc32_pix_in_triosy_obj_biwt(crc32_pix_in_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [33:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd9),
  .width(32'sd34)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(dat_out_rsci_idat),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, run_wen, dat_in_rsci_oswt,
      dat_in_rsci_wen_comp, dat_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dat_in_rsci_biwt;
  wire dat_in_rsci_bdwt;
  wire dat_in_rsci_bcwt;
  wire dat_in_rsci_irdy_run_sct;
  wire dat_in_rsci_ivld;
  wire [31:0] dat_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd3),
  .width(32'sd32)) dat_in_rsci (
      .rdy(dat_in_rsc_rdy),
      .vld(dat_in_rsc_vld),
      .dat(dat_in_rsc_dat),
      .irdy(dat_in_rsci_irdy_run_sct),
      .ivld(dat_in_rsci_ivld),
      .idat(dat_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_oswt(dat_in_rsci_oswt),
      .dat_in_rsci_biwt(dat_in_rsci_biwt),
      .dat_in_rsci_bdwt(dat_in_rsci_bdwt),
      .dat_in_rsci_bcwt(dat_in_rsci_bcwt),
      .dat_in_rsci_irdy_run_sct(dat_in_rsci_irdy_run_sct),
      .dat_in_rsci_ivld(dat_in_rsci_ivld)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_dat_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsci_oswt(dat_in_rsci_oswt),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt),
      .dat_in_rsci_biwt(dat_in_rsci_biwt),
      .dat_in_rsci_bdwt(dat_in_rsci_bdwt),
      .dat_in_rsci_bcwt(dat_in_rsci_bcwt),
      .dat_in_rsci_idat(dat_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci (
  clk, rst, arst_n, dy_in_rsc_dat, dy_in_rsc_vld, dy_in_rsc_rdy, run_wen, dy_in_rsci_oswt,
      dy_in_rsci_wen_comp, dy_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input run_wen;
  input dy_in_rsci_oswt;
  output dy_in_rsci_wen_comp;
  output [35:0] dy_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dy_in_rsci_biwt;
  wire dy_in_rsci_bdwt;
  wire dy_in_rsci_bcwt;
  wire dy_in_rsci_irdy_run_sct;
  wire dy_in_rsci_ivld;
  wire [35:0] dy_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd2),
  .width(32'sd36)) dy_in_rsci (
      .rdy(dy_in_rsc_rdy),
      .vld(dy_in_rsc_vld),
      .dat(dy_in_rsc_dat),
      .irdy(dy_in_rsci_irdy_run_sct),
      .ivld(dy_in_rsci_ivld),
      .idat(dy_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dy_in_rsci_oswt(dy_in_rsci_oswt),
      .dy_in_rsci_biwt(dy_in_rsci_biwt),
      .dy_in_rsci_bdwt(dy_in_rsci_bdwt),
      .dy_in_rsci_bcwt(dy_in_rsci_bcwt),
      .dy_in_rsci_irdy_run_sct(dy_in_rsci_irdy_run_sct),
      .dy_in_rsci_ivld(dy_in_rsci_ivld)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_in_rsci_oswt(dy_in_rsci_oswt),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .dy_in_rsci_idat_mxwt(dy_in_rsci_idat_mxwt),
      .dy_in_rsci_biwt(dy_in_rsci_biwt),
      .dy_in_rsci_bdwt(dy_in_rsci_bdwt),
      .dy_in_rsci_bcwt(dy_in_rsci_bcwt),
      .dy_in_rsci_idat(dy_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, run_wen, dx_in_rsci_oswt,
      dx_in_rsci_wen_comp, dx_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input run_wen;
  input dx_in_rsci_oswt;
  output dx_in_rsci_wen_comp;
  output [35:0] dx_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dx_in_rsci_biwt;
  wire dx_in_rsci_bdwt;
  wire dx_in_rsci_bcwt;
  wire dx_in_rsci_irdy_run_sct;
  wire dx_in_rsci_ivld;
  wire [35:0] dx_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd36)) dx_in_rsci (
      .rdy(dx_in_rsc_rdy),
      .vld(dx_in_rsc_vld),
      .dat(dx_in_rsc_dat),
      .irdy(dx_in_rsci_irdy_run_sct),
      .ivld(dx_in_rsci_ivld),
      .idat(dx_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dx_in_rsci_oswt(dx_in_rsci_oswt),
      .dx_in_rsci_biwt(dx_in_rsci_biwt),
      .dx_in_rsci_bdwt(dx_in_rsci_bdwt),
      .dx_in_rsci_bcwt(dx_in_rsci_bcwt),
      .dx_in_rsci_irdy_run_sct(dx_in_rsci_irdy_run_sct),
      .dx_in_rsci_ivld(dx_in_rsci_ivld)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsci_oswt(dx_in_rsci_oswt),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dx_in_rsci_idat_mxwt(dx_in_rsci_idat_mxwt),
      .dx_in_rsci_biwt(dx_in_rsci_biwt),
      .dx_in_rsci_bdwt(dx_in_rsci_bdwt),
      .dx_in_rsci_bcwt(dx_in_rsci_bcwt),
      .dx_in_rsci_idat(dx_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_run
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_run (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz, crc32_dat_out_rsc_dat,
      crc32_dat_out_triosy_lz, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire run_wten;
  wire dx_in_rsci_wen_comp;
  wire [35:0] dx_in_rsci_idat_mxwt;
  wire dy_in_rsci_wen_comp;
  wire [35:0] dy_in_rsci_idat_mxwt;
  wire dat_in_rsci_wen_comp;
  wire [31:0] dat_in_rsci_idat_mxwt;
  wire dat_out_rsci_wen_comp;
  reg crc32_pix_in_rsci_idat_31;
  reg crc32_pix_in_rsci_idat_30;
  reg crc32_pix_in_rsci_idat_29;
  reg crc32_pix_in_rsci_idat_28;
  reg crc32_pix_in_rsci_idat_27;
  reg crc32_pix_in_rsci_idat_26;
  reg crc32_pix_in_rsci_idat_25;
  reg crc32_pix_in_rsci_idat_24;
  reg crc32_pix_in_rsci_idat_23;
  reg crc32_pix_in_rsci_idat_22;
  reg crc32_pix_in_rsci_idat_21;
  reg crc32_pix_in_rsci_idat_20;
  reg crc32_pix_in_rsci_idat_19;
  reg crc32_pix_in_rsci_idat_18;
  reg crc32_pix_in_rsci_idat_17;
  reg crc32_pix_in_rsci_idat_16;
  reg crc32_pix_in_rsci_idat_15;
  reg crc32_pix_in_rsci_idat_14;
  reg crc32_pix_in_rsci_idat_13;
  reg crc32_pix_in_rsci_idat_12;
  reg crc32_pix_in_rsci_idat_11;
  reg crc32_pix_in_rsci_idat_10;
  reg crc32_pix_in_rsci_idat_9;
  reg crc32_pix_in_rsci_idat_8;
  reg crc32_pix_in_rsci_idat_7;
  reg crc32_pix_in_rsci_idat_6;
  reg crc32_pix_in_rsci_idat_5;
  reg crc32_pix_in_rsci_idat_4;
  reg crc32_pix_in_rsci_idat_3;
  reg crc32_pix_in_rsci_idat_2;
  reg crc32_pix_in_rsci_idat_1;
  reg crc32_pix_in_rsci_idat_0;
  reg crc32_dat_out_rsci_idat_31;
  reg crc32_dat_out_rsci_idat_30;
  reg crc32_dat_out_rsci_idat_29;
  reg crc32_dat_out_rsci_idat_28;
  reg crc32_dat_out_rsci_idat_27;
  reg crc32_dat_out_rsci_idat_26;
  reg crc32_dat_out_rsci_idat_25;
  reg crc32_dat_out_rsci_idat_24;
  reg crc32_dat_out_rsci_idat_23;
  reg crc32_dat_out_rsci_idat_22;
  reg crc32_dat_out_rsci_idat_21;
  reg crc32_dat_out_rsci_idat_20;
  reg crc32_dat_out_rsci_idat_19;
  reg crc32_dat_out_rsci_idat_18;
  reg crc32_dat_out_rsci_idat_17;
  reg crc32_dat_out_rsci_idat_16;
  reg crc32_dat_out_rsci_idat_15;
  reg crc32_dat_out_rsci_idat_14;
  reg crc32_dat_out_rsci_idat_13;
  reg crc32_dat_out_rsci_idat_12;
  reg crc32_dat_out_rsci_idat_11;
  reg crc32_dat_out_rsci_idat_10;
  reg crc32_dat_out_rsci_idat_9;
  reg crc32_dat_out_rsci_idat_8;
  reg crc32_dat_out_rsci_idat_7;
  reg crc32_dat_out_rsci_idat_6;
  reg crc32_dat_out_rsci_idat_5;
  reg crc32_dat_out_rsci_idat_4;
  reg crc32_dat_out_rsci_idat_3;
  reg crc32_dat_out_rsci_idat_2;
  reg crc32_dat_out_rsci_idat_1;
  reg crc32_dat_out_rsci_idat_0;
  reg [7:0] dat_out_rsci_idat_33_26;
  reg [7:0] dat_out_rsci_idat_25_18;
  reg [7:0] dat_out_rsci_idat_17_10;
  reg [7:0] dat_out_rsci_idat_9_2;
  reg dat_out_rsci_idat_1;
  reg dat_out_rsci_idat_0;
  wire [3:0] fsm_output;
  wire MROW_equal_tmp;
  wire MCOL_MCOL_if_5_and_tmp;
  wire and_dcpl_6;
  wire and_dcpl_8;
  wire or_dcpl_6;
  wire and_dcpl_9;
  wire and_dcpl_13;
  wire or_tmp_69;
  reg MCOL_stage_0;
  reg MCOL_stage_0_2;
  reg MCOL_if_4_slc_MCOL_if_4_acc_8_itm_1;
  reg MCOL_asn_10_itm_1;
  reg MCOL_if_slc_operator_10_false_acc_8_svs_1;
  wire [35:0] dx_lpi_3_dfm_mx0;
  wire [35:0] dy_lpi_3_dfm_mx0;
  wire MCOL_if_4_and_cse;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_and_cse;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_and_cse;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_and_15_cse;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_and_17_cse;
  wire crc32_pix_in_default_and_cse;
  reg reg_dx_in_rsci_oswt_cse;
  reg reg_dat_out_rsci_oswt_cse;
  reg reg_crc32_pix_in_triosy_obj_iswt0_cse;
  wire crc32_dat_out_default_and_32_cse;
  wire [8:0] z_out;
  wire [9:0] nl_z_out;
  reg [8:0] MROW_y_sva;
  reg [31:0] pix_buf_lpi_3;
  reg [35:0] dx_lpi_3;
  reg [35:0] dy_lpi_3;
  reg crc32_pix_in_default_31_1_lpi_3;
  reg crc32_dat_out_default_31_1_lpi_3;
  reg [7:0] MCOL_x_9_2_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva;
  reg EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva;
  reg [35:0] MCOL_asn_itm_1;
  reg [35:0] MCOL_asn_4_itm_1;
  reg MCOL_if_2_MCOL_if_2_nor_itm_1;
  wire [7:0] mag_cal_31_24_lpi_3_dfm_mx0w0;
  wire [7:0] mag_cal_23_16_lpi_3_dfm_mx0w0;
  wire [7:0] mag_cal_15_8_lpi_3_dfm_mx0w0;
  wire [7:0] mag_cal_7_0_lpi_3_dfm_mx0w0;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_mx0w0;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_mx0w0;
  wire EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w0;
  wire [31:0] pix_buf_lpi_3_dfm_mx0;
  wire [7:0] operator_10_false_1_acc_cse_sva_1;
  wire [8:0] nl_operator_10_false_1_acc_cse_sva_1;
  wire xor_cse;
  wire xor_cse_1;
  wire xor_cse_5;
  wire xor_cse_13;
  wire xor_cse_16;
  wire xor_cse_19;
  wire xor_cse_21;
  wire xor_cse_23;
  wire xor_cse_25;
  wire xor_cse_27;
  wire xor_cse_29;
  wire xor_cse_33;
  wire xor_cse_35;
  wire xor_cse_37;
  wire xor_cse_42;
  wire xor_cse_43;
  wire xor_cse_46;
  wire xor_cse_48;
  wire xor_cse_50;
  wire xor_cse_52;
  wire xor_cse_59;
  wire xor_cse_62;
  wire xor_cse_63;
  wire xor_cse_64;
  wire xor_cse_66;
  wire xor_cse_68;
  wire xor_cse_69;
  wire xor_cse_72;
  wire xor_cse_74;
  wire xor_cse_77;
  wire xor_cse_78;
  wire xor_cse_79;
  wire xor_cse_83;
  wire xor_cse_84;
  wire xor_cse_85;
  wire xor_cse_87;
  wire xor_cse_89;
  wire xor_cse_90;
  wire xor_cse_91;
  wire xor_cse_99;
  wire xor_cse_105;
  wire xor_cse_106;
  wire xor_cse_108;
  wire xor_cse_109;
  wire xor_cse_111;
  wire xor_cse_112;
  wire xor_cse_114;
  wire xor_cse_115;
  wire xor_cse_117;
  wire xor_cse_124;
  wire xor_cse_131;
  wire xor_cse_135;
  wire xor_cse_144;
  wire xor_cse_145;
  wire xor_cse_149;
  wire xor_cse_157;
  wire xor_cse_160;
  wire xor_cse_163;
  wire xor_cse_165;
  wire xor_cse_167;
  wire xor_cse_169;
  wire xor_cse_171;
  wire xor_cse_173;
  wire xor_cse_177;
  wire xor_cse_179;
  wire xor_cse_181;
  wire xor_cse_186;
  wire xor_cse_187;
  wire xor_cse_190;
  wire xor_cse_192;
  wire xor_cse_194;
  wire xor_cse_196;
  wire xor_cse_203;
  wire xor_cse_206;
  wire xor_cse_207;
  wire xor_cse_208;
  wire xor_cse_210;
  wire xor_cse_212;
  wire xor_cse_213;
  wire xor_cse_216;
  wire xor_cse_218;
  wire xor_cse_221;
  wire xor_cse_222;
  wire xor_cse_223;
  wire xor_cse_227;
  wire xor_cse_228;
  wire xor_cse_229;
  wire xor_cse_231;
  wire xor_cse_233;
  wire xor_cse_234;
  wire xor_cse_235;
  wire xor_cse_243;
  wire xor_cse_249;
  wire xor_cse_250;
  wire xor_cse_252;
  wire xor_cse_253;
  wire xor_cse_255;
  wire xor_cse_256;
  wire xor_cse_258;
  wire xor_cse_259;
  wire xor_cse_261;
  wire xor_cse_268;
  wire xor_cse_275;
  wire xor_cse_279;
  wire [7:0] dx_lpi_3_dfm_mx1_34_27;
  wire [7:0] dx_lpi_3_dfm_mx1_25_18;
  wire [7:0] dx_lpi_3_dfm_mx1_16_9;
  wire [7:0] dx_lpi_3_dfm_mx1_7_0;
  wire [7:0] dy_lpi_3_dfm_mx1_34_27;
  wire [7:0] dy_lpi_3_dfm_mx1_25_18;
  wire [7:0] dy_lpi_3_dfm_mx1_16_9;
  wire [7:0] dy_lpi_3_dfm_mx1_7_0;
  wire MROW_y_or_cse;
  wire MCOL_and_3_cse;
  wire MCOL_and_4_cse;
  wire dy_and_1_cse;
  wire MCOL_if_4_acc_1_itm_8_1;
  wire operator_10_false_acc_itm_8_1;
  wire ABSADD_1_operator_9_true_acc_itm_9_1;
  wire ABSADD_2_operator_9_true_acc_itm_9_1;
  wire ABSADD_3_operator_9_true_acc_itm_9_1;
  wire ABSADD_4_operator_9_true_acc_itm_9_1;
  wire ABSADD_4_operator_9_true_1_acc_itm_9_1;
  wire ABSADD_3_operator_9_true_1_acc_itm_9_1;
  wire ABSADD_2_operator_9_true_1_acc_itm_9_1;
  wire ABSADD_1_operator_9_true_1_acc_itm_9_1;

  wire MROW_y_not_1_nl;
  wire[7:0] operator_10_false_acc_nl;
  wire[8:0] nl_operator_10_false_acc_nl;
  wire not_115_nl;
  wire crc32_dat_out_default_mux_nl;
  wire crc32_pix_in_default_mux_nl;
  wire[7:0] ABSADD_ABSADD_or_3_nl;
  wire[7:0] ABSADD_4_else_acc_nl;
  wire[8:0] nl_ABSADD_4_else_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_3_nl;
  wire[7:0] ABSADD_4_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[8:0] nl_ABSADD_4_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_10_nl;
  wire[7:0] ABSADD_4_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[8:0] nl_ABSADD_4_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[2:0] ABSADD_4_operator_10_true_acc_nl;
  wire[3:0] nl_ABSADD_4_operator_10_true_acc_nl;
  wire[9:0] ABSADD_4_acc_1_nl;
  wire[10:0] nl_ABSADD_4_acc_1_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_3_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_10_nl;
  wire[8:0] ABSADD_4_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[9:0] nl_ABSADD_4_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[7:0] ABSADD_ABSADD_or_2_nl;
  wire[7:0] ABSADD_3_else_acc_nl;
  wire[8:0] nl_ABSADD_3_else_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_2_nl;
  wire[7:0] ABSADD_3_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[8:0] nl_ABSADD_3_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_9_nl;
  wire[7:0] ABSADD_3_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[8:0] nl_ABSADD_3_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[2:0] ABSADD_3_operator_10_true_acc_nl;
  wire[3:0] nl_ABSADD_3_operator_10_true_acc_nl;
  wire[9:0] ABSADD_3_acc_1_nl;
  wire[10:0] nl_ABSADD_3_acc_1_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_2_nl;
  wire[8:0] ABSADD_3_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[9:0] nl_ABSADD_3_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_9_nl;
  wire[8:0] ABSADD_3_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[9:0] nl_ABSADD_3_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[8:0] operator_9_false_acc_1_nl;
  wire[9:0] nl_operator_9_false_acc_1_nl;
  wire[7:0] ABSADD_ABSADD_or_1_nl;
  wire[7:0] ABSADD_2_else_acc_nl;
  wire[8:0] nl_ABSADD_2_else_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_1_nl;
  wire[7:0] ABSADD_2_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[8:0] nl_ABSADD_2_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_8_nl;
  wire[7:0] ABSADD_2_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[8:0] nl_ABSADD_2_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[2:0] ABSADD_2_operator_10_true_acc_nl;
  wire[3:0] nl_ABSADD_2_operator_10_true_acc_nl;
  wire[9:0] ABSADD_2_acc_1_nl;
  wire[10:0] nl_ABSADD_2_acc_1_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_1_nl;
  wire[8:0] ABSADD_2_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[9:0] nl_ABSADD_2_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_8_nl;
  wire[8:0] ABSADD_2_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[9:0] nl_ABSADD_2_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[7:0] ABSADD_ABSADD_or_nl;
  wire[7:0] ABSADD_1_else_acc_nl;
  wire[8:0] nl_ABSADD_1_else_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_nl;
  wire[7:0] ABSADD_1_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[8:0] nl_ABSADD_1_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl;
  wire[7:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_nl;
  wire[7:0] ABSADD_1_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[8:0] nl_ABSADD_1_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl;
  wire[2:0] ABSADD_1_operator_10_true_acc_nl;
  wire[3:0] nl_ABSADD_1_operator_10_true_acc_nl;
  wire[9:0] ABSADD_1_acc_1_nl;
  wire[10:0] nl_ABSADD_1_acc_1_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_nl;
  wire[8:0] ABSADD_1_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[9:0] nl_ABSADD_1_operator_9_true_operator_9_true_operator_9_true_acc_nl;
  wire[8:0] EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_nl;
  wire[8:0] ABSADD_1_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[9:0] nl_ABSADD_1_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl;
  wire[8:0] MCOL_if_4_acc_1_nl;
  wire[9:0] nl_MCOL_if_4_acc_1_nl;
  wire[8:0] operator_10_false_acc_nl_1;
  wire[9:0] nl_operator_10_false_acc_nl_1;
  wire[9:0] ABSADD_1_operator_9_true_acc_nl;
  wire[10:0] nl_ABSADD_1_operator_9_true_acc_nl;
  wire[9:0] ABSADD_2_operator_9_true_acc_nl;
  wire[10:0] nl_ABSADD_2_operator_9_true_acc_nl;
  wire[9:0] ABSADD_3_operator_9_true_acc_nl;
  wire[10:0] nl_ABSADD_3_operator_9_true_acc_nl;
  wire[9:0] ABSADD_4_operator_9_true_acc_nl;
  wire[10:0] nl_ABSADD_4_operator_9_true_acc_nl;
  wire[9:0] ABSADD_4_operator_9_true_1_acc_nl;
  wire[10:0] nl_ABSADD_4_operator_9_true_1_acc_nl;
  wire[9:0] ABSADD_3_operator_9_true_1_acc_nl;
  wire[10:0] nl_ABSADD_3_operator_9_true_1_acc_nl;
  wire[9:0] ABSADD_2_operator_9_true_1_acc_nl;
  wire[10:0] nl_ABSADD_2_operator_9_true_1_acc_nl;
  wire[9:0] ABSADD_1_operator_9_true_1_acc_nl;
  wire[10:0] nl_ABSADD_1_operator_9_true_1_acc_nl;
  wire[8:0] MROW_mux_1_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_crc32_pix_in_rsci_idat;
  assign nl_crc32_pix_in_rsci_idat = {crc32_pix_in_rsci_idat_31 , crc32_pix_in_rsci_idat_30
      , crc32_pix_in_rsci_idat_29 , crc32_pix_in_rsci_idat_28 , crc32_pix_in_rsci_idat_27
      , crc32_pix_in_rsci_idat_26 , crc32_pix_in_rsci_idat_25 , crc32_pix_in_rsci_idat_24
      , crc32_pix_in_rsci_idat_23 , crc32_pix_in_rsci_idat_22 , crc32_pix_in_rsci_idat_21
      , crc32_pix_in_rsci_idat_20 , crc32_pix_in_rsci_idat_19 , crc32_pix_in_rsci_idat_18
      , crc32_pix_in_rsci_idat_17 , crc32_pix_in_rsci_idat_16 , crc32_pix_in_rsci_idat_15
      , crc32_pix_in_rsci_idat_14 , crc32_pix_in_rsci_idat_13 , crc32_pix_in_rsci_idat_12
      , crc32_pix_in_rsci_idat_11 , crc32_pix_in_rsci_idat_10 , crc32_pix_in_rsci_idat_9
      , crc32_pix_in_rsci_idat_8 , crc32_pix_in_rsci_idat_7 , crc32_pix_in_rsci_idat_6
      , crc32_pix_in_rsci_idat_5 , crc32_pix_in_rsci_idat_4 , crc32_pix_in_rsci_idat_3
      , crc32_pix_in_rsci_idat_2 , crc32_pix_in_rsci_idat_1 , crc32_pix_in_rsci_idat_0};
  wire [31:0] nl_crc32_dat_out_rsci_idat;
  assign nl_crc32_dat_out_rsci_idat = {crc32_dat_out_rsci_idat_31 , crc32_dat_out_rsci_idat_30
      , crc32_dat_out_rsci_idat_29 , crc32_dat_out_rsci_idat_28 , crc32_dat_out_rsci_idat_27
      , crc32_dat_out_rsci_idat_26 , crc32_dat_out_rsci_idat_25 , crc32_dat_out_rsci_idat_24
      , crc32_dat_out_rsci_idat_23 , crc32_dat_out_rsci_idat_22 , crc32_dat_out_rsci_idat_21
      , crc32_dat_out_rsci_idat_20 , crc32_dat_out_rsci_idat_19 , crc32_dat_out_rsci_idat_18
      , crc32_dat_out_rsci_idat_17 , crc32_dat_out_rsci_idat_16 , crc32_dat_out_rsci_idat_15
      , crc32_dat_out_rsci_idat_14 , crc32_dat_out_rsci_idat_13 , crc32_dat_out_rsci_idat_12
      , crc32_dat_out_rsci_idat_11 , crc32_dat_out_rsci_idat_10 , crc32_dat_out_rsci_idat_9
      , crc32_dat_out_rsci_idat_8 , crc32_dat_out_rsci_idat_7 , crc32_dat_out_rsci_idat_6
      , crc32_dat_out_rsci_idat_5 , crc32_dat_out_rsci_idat_4 , crc32_dat_out_rsci_idat_3
      , crc32_dat_out_rsci_idat_2 , crc32_dat_out_rsci_idat_1 , crc32_dat_out_rsci_idat_0};
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat
      = {dat_out_rsci_idat_33_26 , dat_out_rsci_idat_25_18 , dat_out_rsci_idat_17_10
      , dat_out_rsci_idat_9_2 , dat_out_rsci_idat_1 , dat_out_rsci_idat_0};
  wire  nl_EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst_MCOL_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst_MCOL_C_0_tr0 = ~(MCOL_stage_0_2
      | MCOL_stage_0);
  ccs_out_v1 #(.rscid(32'sd7),
  .width(32'sd32)) crc32_pix_in_rsci (
      .idat(nl_crc32_pix_in_rsci_idat[31:0]),
      .dat(crc32_pix_in_rsc_dat)
    );
  ccs_out_v1 #(.rscid(32'sd8),
  .width(32'sd32)) crc32_dat_out_rsci (
      .idat(nl_crc32_dat_out_rsci_idat[31:0]),
      .dat(crc32_dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dx_in_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .run_wen(run_wen),
      .dx_in_rsci_oswt(reg_dx_in_rsci_oswt_cse),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dx_in_rsci_idat_mxwt(dx_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dy_in_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .run_wen(run_wen),
      .dy_in_rsci_oswt(reg_dx_in_rsci_oswt_cse),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .dy_in_rsci_idat_mxwt(dy_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dat_in_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .run_wen(run_wen),
      .dat_in_rsci_oswt(reg_dx_in_rsci_oswt_cse),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat[33:0])
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_inst
      (
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .run_wten(run_wten),
      .crc32_pix_in_triosy_obj_iswt0(reg_crc32_pix_in_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj EdgeDetect_IP_EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_inst
      (
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .run_wten(run_wten),
      .crc32_dat_out_triosy_obj_iswt0(reg_crc32_pix_in_triosy_obj_iswt0_cse)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_staller EdgeDetect_IP_EdgeDetect_MagAng_run_staller_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .MCOL_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_MagAng_run_run_fsm_inst_MCOL_C_0_tr0),
      .MROW_C_0_tr0(MROW_equal_tmp)
    );
  assign MCOL_if_4_and_cse = run_wen & (~((~ (fsm_output[1])) | (~ MCOL_stage_0_2)
      | MCOL_if_4_slc_MCOL_if_4_acc_8_itm_1));
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_and_cse = run_wen
      & (or_tmp_69 | ((~(MCOL_asn_10_itm_1 & MCOL_stage_0)) & MCOL_stage_0_2 & (fsm_output[1])));
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_and_cse = run_wen
      & (and_dcpl_6 | and_dcpl_8 | and_dcpl_9);
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_and_15_cse = run_wen
      & ((MCOL_stage_0_2 & (~ (fsm_output[2]))) | or_tmp_69);
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_and_17_cse = run_wen
      & (or_tmp_69 | (and_dcpl_6 & (fsm_output[1])) | (and_dcpl_8 & (fsm_output[1])));
  assign MROW_y_or_cse = (fsm_output[0]) | (fsm_output[2]);
  assign MCOL_and_3_cse = run_wen & MCOL_stage_0;
  assign MCOL_and_4_cse = run_wen & ((~ MCOL_if_slc_operator_10_false_acc_8_svs_1)
      | or_dcpl_6) & MCOL_stage_0 & operator_10_false_acc_itm_8_1;
  assign crc32_pix_in_default_and_cse = run_wen & (fsm_output[2]) & MROW_equal_tmp;
  assign dy_and_1_cse = run_wen & MCOL_stage_0_2 & (fsm_output[1]) & (~ MCOL_stage_0);
  assign crc32_dat_out_default_and_32_cse = run_wen & ((~ or_dcpl_6) | or_tmp_69
      | (fsm_output[2]));
  assign nl_ABSADD_4_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl
      =  -dx_lpi_3_dfm_mx1_34_27;
  assign ABSADD_4_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl =
      nl_ABSADD_4_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_3_nl = MUX_v_8_2_2(ABSADD_4_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl,
      dx_lpi_3_dfm_mx1_34_27, ABSADD_4_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_4_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl
      =  -dy_lpi_3_dfm_mx1_34_27;
  assign ABSADD_4_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl =
      nl_ABSADD_4_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_10_nl = MUX_v_8_2_2(ABSADD_4_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl,
      dy_lpi_3_dfm_mx1_34_27, ABSADD_4_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_4_else_acc_nl = EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_3_nl
      + EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_10_nl;
  assign ABSADD_4_else_acc_nl = nl_ABSADD_4_else_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_3_nl = MUX_v_9_2_2(z_out, (dx_lpi_3_dfm_mx0[35:27]),
      ABSADD_4_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_4_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl
      =  -(dy_lpi_3_dfm_mx0[35:27]);
  assign ABSADD_4_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl =
      nl_ABSADD_4_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_10_nl = MUX_v_9_2_2(ABSADD_4_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl,
      (dy_lpi_3_dfm_mx0[35:27]), ABSADD_4_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_4_acc_1_nl = conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_3_nl)
      + conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_10_nl);
  assign ABSADD_4_acc_1_nl = nl_ABSADD_4_acc_1_nl[9:0];
  assign nl_ABSADD_4_operator_10_true_acc_nl =  -conv_s2s_2_3(readslicef_10_2_8(ABSADD_4_acc_1_nl));
  assign ABSADD_4_operator_10_true_acc_nl = nl_ABSADD_4_operator_10_true_acc_nl[2:0];
  assign ABSADD_ABSADD_or_3_nl = MUX_v_8_2_2(ABSADD_4_else_acc_nl, 8'b11111111, (readslicef_3_1_2(ABSADD_4_operator_10_true_acc_nl)));
  assign mag_cal_31_24_lpi_3_dfm_mx0w0 = MUX_v_8_2_2(8'b00000000, ABSADD_ABSADD_or_3_nl,
      sw_in);
  assign nl_ABSADD_3_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl
      =  -dx_lpi_3_dfm_mx1_25_18;
  assign ABSADD_3_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl =
      nl_ABSADD_3_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_2_nl = MUX_v_8_2_2(ABSADD_3_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl,
      dx_lpi_3_dfm_mx1_25_18, ABSADD_3_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_3_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl
      =  -dy_lpi_3_dfm_mx1_25_18;
  assign ABSADD_3_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl =
      nl_ABSADD_3_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_9_nl = MUX_v_8_2_2(ABSADD_3_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl,
      dy_lpi_3_dfm_mx1_25_18, ABSADD_3_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_3_else_acc_nl = EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_2_nl
      + EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_9_nl;
  assign ABSADD_3_else_acc_nl = nl_ABSADD_3_else_acc_nl[7:0];
  assign nl_ABSADD_3_operator_9_true_operator_9_true_operator_9_true_acc_nl =  -(dx_lpi_3_dfm_mx0[26:18]);
  assign ABSADD_3_operator_9_true_operator_9_true_operator_9_true_acc_nl = nl_ABSADD_3_operator_9_true_operator_9_true_operator_9_true_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_2_nl = MUX_v_9_2_2(ABSADD_3_operator_9_true_operator_9_true_operator_9_true_acc_nl,
      (dx_lpi_3_dfm_mx0[26:18]), ABSADD_3_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_3_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl
      =  -(dy_lpi_3_dfm_mx0[26:18]);
  assign ABSADD_3_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl =
      nl_ABSADD_3_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_9_nl = MUX_v_9_2_2(ABSADD_3_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl,
      (dy_lpi_3_dfm_mx0[26:18]), ABSADD_3_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_3_acc_1_nl = conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_2_nl)
      + conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_9_nl);
  assign ABSADD_3_acc_1_nl = nl_ABSADD_3_acc_1_nl[9:0];
  assign nl_ABSADD_3_operator_10_true_acc_nl =  -conv_s2s_2_3(readslicef_10_2_8(ABSADD_3_acc_1_nl));
  assign ABSADD_3_operator_10_true_acc_nl = nl_ABSADD_3_operator_10_true_acc_nl[2:0];
  assign ABSADD_ABSADD_or_2_nl = MUX_v_8_2_2(ABSADD_3_else_acc_nl, 8'b11111111, (readslicef_3_1_2(ABSADD_3_operator_10_true_acc_nl)));
  assign mag_cal_23_16_lpi_3_dfm_mx0w0 = MUX_v_8_2_2(8'b00000000, ABSADD_ABSADD_or_2_nl,
      sw_in);
  assign nl_operator_9_false_acc_1_nl = heightIn + 9'b111111111;
  assign operator_9_false_acc_1_nl = nl_operator_9_false_acc_1_nl[8:0];
  assign MROW_equal_tmp = MROW_y_sva == operator_9_false_acc_1_nl;
  assign nl_ABSADD_2_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl
      =  -dx_lpi_3_dfm_mx1_16_9;
  assign ABSADD_2_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl =
      nl_ABSADD_2_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_1_nl = MUX_v_8_2_2(ABSADD_2_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl,
      dx_lpi_3_dfm_mx1_16_9, ABSADD_2_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_2_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl
      =  -dy_lpi_3_dfm_mx1_16_9;
  assign ABSADD_2_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl =
      nl_ABSADD_2_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_8_nl = MUX_v_8_2_2(ABSADD_2_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl,
      dy_lpi_3_dfm_mx1_16_9, ABSADD_2_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_2_else_acc_nl = EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_1_nl
      + EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_8_nl;
  assign ABSADD_2_else_acc_nl = nl_ABSADD_2_else_acc_nl[7:0];
  assign nl_ABSADD_2_operator_9_true_operator_9_true_operator_9_true_acc_nl =  -(dx_lpi_3_dfm_mx0[17:9]);
  assign ABSADD_2_operator_9_true_operator_9_true_operator_9_true_acc_nl = nl_ABSADD_2_operator_9_true_operator_9_true_operator_9_true_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_1_nl = MUX_v_9_2_2(ABSADD_2_operator_9_true_operator_9_true_operator_9_true_acc_nl,
      (dx_lpi_3_dfm_mx0[17:9]), ABSADD_2_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_2_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl
      =  -(dy_lpi_3_dfm_mx0[17:9]);
  assign ABSADD_2_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl =
      nl_ABSADD_2_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_8_nl = MUX_v_9_2_2(ABSADD_2_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl,
      (dy_lpi_3_dfm_mx0[17:9]), ABSADD_2_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_2_acc_1_nl = conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_1_nl)
      + conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_8_nl);
  assign ABSADD_2_acc_1_nl = nl_ABSADD_2_acc_1_nl[9:0];
  assign nl_ABSADD_2_operator_10_true_acc_nl =  -conv_s2s_2_3(readslicef_10_2_8(ABSADD_2_acc_1_nl));
  assign ABSADD_2_operator_10_true_acc_nl = nl_ABSADD_2_operator_10_true_acc_nl[2:0];
  assign ABSADD_ABSADD_or_1_nl = MUX_v_8_2_2(ABSADD_2_else_acc_nl, 8'b11111111, (readslicef_3_1_2(ABSADD_2_operator_10_true_acc_nl)));
  assign mag_cal_15_8_lpi_3_dfm_mx0w0 = MUX_v_8_2_2(8'b00000000, ABSADD_ABSADD_or_1_nl,
      sw_in);
  assign nl_ABSADD_1_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl
      =  -dx_lpi_3_dfm_mx1_7_0;
  assign ABSADD_1_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl =
      nl_ABSADD_1_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_nl = MUX_v_8_2_2(ABSADD_1_operator_9_true_2_operator_9_true_2_operator_9_true_2_acc_nl,
      dx_lpi_3_dfm_mx1_7_0, ABSADD_1_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_1_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl
      =  -dy_lpi_3_dfm_mx1_7_0;
  assign ABSADD_1_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl =
      nl_ABSADD_1_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl[7:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_nl = MUX_v_8_2_2(ABSADD_1_operator_9_true_3_operator_9_true_3_operator_9_true_3_acc_nl,
      dy_lpi_3_dfm_mx1_7_0, ABSADD_1_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_1_else_acc_nl = EdgeDetect_IP_EdgeDetect_MagAng_abs_2_mux_nl +
      EdgeDetect_IP_EdgeDetect_MagAng_abs_3_mux_nl;
  assign ABSADD_1_else_acc_nl = nl_ABSADD_1_else_acc_nl[7:0];
  assign nl_ABSADD_1_operator_9_true_operator_9_true_operator_9_true_acc_nl =  -(dx_lpi_3_dfm_mx0[8:0]);
  assign ABSADD_1_operator_9_true_operator_9_true_operator_9_true_acc_nl = nl_ABSADD_1_operator_9_true_operator_9_true_operator_9_true_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_nl = MUX_v_9_2_2(ABSADD_1_operator_9_true_operator_9_true_operator_9_true_acc_nl,
      (dx_lpi_3_dfm_mx0[8:0]), ABSADD_1_operator_9_true_acc_itm_9_1);
  assign nl_ABSADD_1_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl
      =  -(dy_lpi_3_dfm_mx0[8:0]);
  assign ABSADD_1_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl =
      nl_ABSADD_1_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl[8:0];
  assign EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_nl = MUX_v_9_2_2(ABSADD_1_operator_9_true_1_operator_9_true_1_operator_9_true_1_acc_nl,
      (dy_lpi_3_dfm_mx0[8:0]), ABSADD_1_operator_9_true_1_acc_itm_9_1);
  assign nl_ABSADD_1_acc_1_nl = conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_mux_nl)
      + conv_s2s_9_10(EdgeDetect_IP_EdgeDetect_MagAng_abs_1_mux_nl);
  assign ABSADD_1_acc_1_nl = nl_ABSADD_1_acc_1_nl[9:0];
  assign nl_ABSADD_1_operator_10_true_acc_nl =  -conv_s2s_2_3(readslicef_10_2_8(ABSADD_1_acc_1_nl));
  assign ABSADD_1_operator_10_true_acc_nl = nl_ABSADD_1_operator_10_true_acc_nl[2:0];
  assign ABSADD_ABSADD_or_nl = MUX_v_8_2_2(ABSADD_1_else_acc_nl, 8'b11111111, (readslicef_3_1_2(ABSADD_1_operator_10_true_acc_nl)));
  assign mag_cal_7_0_lpi_3_dfm_mx0w0 = MUX_v_8_2_2(8'b00000000, ABSADD_ABSADD_or_nl,
      sw_in);
  assign MCOL_MCOL_if_5_and_tmp = (MCOL_x_9_2_sva == operator_10_false_1_acc_cse_sva_1)
      & (widthIn[1:0]==2'b00);
  assign nl_MCOL_if_4_acc_1_nl = ({1'b1 , operator_10_false_1_acc_cse_sva_1}) + conv_u2u_8_9(~
      MCOL_x_9_2_sva) + 9'b000000001;
  assign MCOL_if_4_acc_1_nl = nl_MCOL_if_4_acc_1_nl[8:0];
  assign MCOL_if_4_acc_1_itm_8_1 = readslicef_9_1_8(MCOL_if_4_acc_1_nl);
  assign nl_operator_10_false_acc_nl_1 = ({1'b1 , (widthIn[9:2])}) + conv_u2u_8_9(~
      MCOL_x_9_2_sva);
  assign operator_10_false_acc_nl_1 = nl_operator_10_false_acc_nl_1[8:0];
  assign operator_10_false_acc_itm_8_1 = readslicef_9_1_8(operator_10_false_acc_nl_1);
  assign pix_buf_lpi_3_dfm_mx0 = MUX_v_32_2_2(dat_in_rsci_idat_mxwt, pix_buf_lpi_3,
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dx_lpi_3_dfm_mx0 = MUX_v_36_2_2(dx_in_rsci_idat_mxwt, MCOL_asn_itm_1, MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dx_lpi_3_dfm_mx1_34_27 = MUX_v_8_2_2((dx_in_rsci_idat_mxwt[34:27]), (MCOL_asn_itm_1[34:27]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dx_lpi_3_dfm_mx1_25_18 = MUX_v_8_2_2((dx_in_rsci_idat_mxwt[25:18]), (MCOL_asn_itm_1[25:18]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dx_lpi_3_dfm_mx1_16_9 = MUX_v_8_2_2((dx_in_rsci_idat_mxwt[16:9]), (MCOL_asn_itm_1[16:9]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dx_lpi_3_dfm_mx1_7_0 = MUX_v_8_2_2((dx_in_rsci_idat_mxwt[7:0]), (MCOL_asn_itm_1[7:0]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dy_lpi_3_dfm_mx0 = MUX_v_36_2_2(dy_in_rsci_idat_mxwt, MCOL_asn_4_itm_1,
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dy_lpi_3_dfm_mx1_34_27 = MUX_v_8_2_2((dy_in_rsci_idat_mxwt[34:27]), (MCOL_asn_4_itm_1[34:27]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dy_lpi_3_dfm_mx1_25_18 = MUX_v_8_2_2((dy_in_rsci_idat_mxwt[25:18]), (MCOL_asn_4_itm_1[25:18]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dy_lpi_3_dfm_mx1_16_9 = MUX_v_8_2_2((dy_in_rsci_idat_mxwt[16:9]), (MCOL_asn_4_itm_1[16:9]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign dy_lpi_3_dfm_mx1_7_0 = MUX_v_8_2_2((dy_in_rsci_idat_mxwt[7:0]), (MCOL_asn_4_itm_1[7:0]),
      MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign nl_ABSADD_1_operator_9_true_acc_nl =  -conv_s2s_9_10(dx_lpi_3_dfm_mx0[8:0]);
  assign ABSADD_1_operator_9_true_acc_nl = nl_ABSADD_1_operator_9_true_acc_nl[9:0];
  assign ABSADD_1_operator_9_true_acc_itm_9_1 = readslicef_10_1_9(ABSADD_1_operator_9_true_acc_nl);
  assign nl_ABSADD_2_operator_9_true_acc_nl =  -conv_s2s_9_10(dx_lpi_3_dfm_mx0[17:9]);
  assign ABSADD_2_operator_9_true_acc_nl = nl_ABSADD_2_operator_9_true_acc_nl[9:0];
  assign ABSADD_2_operator_9_true_acc_itm_9_1 = readslicef_10_1_9(ABSADD_2_operator_9_true_acc_nl);
  assign nl_ABSADD_3_operator_9_true_acc_nl =  -conv_s2s_9_10(dx_lpi_3_dfm_mx0[26:18]);
  assign ABSADD_3_operator_9_true_acc_nl = nl_ABSADD_3_operator_9_true_acc_nl[9:0];
  assign ABSADD_3_operator_9_true_acc_itm_9_1 = readslicef_10_1_9(ABSADD_3_operator_9_true_acc_nl);
  assign nl_ABSADD_4_operator_9_true_acc_nl =  -conv_s2s_9_10(dx_lpi_3_dfm_mx0[35:27]);
  assign ABSADD_4_operator_9_true_acc_nl = nl_ABSADD_4_operator_9_true_acc_nl[9:0];
  assign ABSADD_4_operator_9_true_acc_itm_9_1 = readslicef_10_1_9(ABSADD_4_operator_9_true_acc_nl);
  assign nl_operator_10_false_1_acc_cse_sva_1 = (widthIn[9:2]) + 8'b11111111;
  assign operator_10_false_1_acc_cse_sva_1 = nl_operator_10_false_1_acc_cse_sva_1[7:0];
  assign nl_ABSADD_4_operator_9_true_1_acc_nl =  -conv_s2s_9_10(dy_lpi_3_dfm_mx0[35:27]);
  assign ABSADD_4_operator_9_true_1_acc_nl = nl_ABSADD_4_operator_9_true_1_acc_nl[9:0];
  assign ABSADD_4_operator_9_true_1_acc_itm_9_1 = readslicef_10_1_9(ABSADD_4_operator_9_true_1_acc_nl);
  assign nl_ABSADD_3_operator_9_true_1_acc_nl =  -conv_s2s_9_10(dy_lpi_3_dfm_mx0[26:18]);
  assign ABSADD_3_operator_9_true_1_acc_nl = nl_ABSADD_3_operator_9_true_1_acc_nl[9:0];
  assign ABSADD_3_operator_9_true_1_acc_itm_9_1 = readslicef_10_1_9(ABSADD_3_operator_9_true_1_acc_nl);
  assign nl_ABSADD_2_operator_9_true_1_acc_nl =  -conv_s2s_9_10(dy_lpi_3_dfm_mx0[17:9]);
  assign ABSADD_2_operator_9_true_1_acc_nl = nl_ABSADD_2_operator_9_true_1_acc_nl[9:0];
  assign ABSADD_2_operator_9_true_1_acc_itm_9_1 = readslicef_10_1_9(ABSADD_2_operator_9_true_1_acc_nl);
  assign nl_ABSADD_1_operator_9_true_1_acc_nl =  -conv_s2s_9_10(dy_lpi_3_dfm_mx0[8:0]);
  assign ABSADD_1_operator_9_true_1_acc_nl = nl_ABSADD_1_operator_9_true_1_acc_nl[9:0];
  assign ABSADD_1_operator_9_true_1_acc_itm_9_1 = readslicef_10_1_9(ABSADD_1_operator_9_true_1_acc_nl);
  assign and_dcpl_6 = MCOL_stage_0_2 & (~ MCOL_stage_0);
  assign and_dcpl_8 = MCOL_stage_0_2 & (~ MCOL_asn_10_itm_1) & MCOL_stage_0;
  assign or_dcpl_6 = (~ MCOL_stage_0_2) | MCOL_asn_10_itm_1;
  assign and_dcpl_9 = or_dcpl_6 & MCOL_stage_0;
  assign and_dcpl_13 = MCOL_stage_0_2 & (~ MCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign or_tmp_69 = (fsm_output[3]) | (fsm_output[0]);
  assign xor_cse_1 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[7]) ^ crc32_dat_out_default_31_1_lpi_3 ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[7]);
  assign xor_cse_5 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[1]);
  assign xor_cse = xor_cse_1 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[3]) ^ xor_cse_5;
  assign xor_cse_13 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_16 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[4]);
  assign xor_cse_19 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva;
  assign xor_cse_21 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[6]);
  assign xor_cse_23 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[6]);
  assign xor_cse_25 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[1]);
  assign xor_cse_27 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_29 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[3]);
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_mx0w0 =
      xor_cse_1 ^ xor_cse_21 ^ xor_cse_23 ^ xor_cse_25 ^ xor_cse_27 ^ xor_cse_29
      ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[5]);
  assign xor_cse_33 = xor_cse_1 ^ xor_cse_13 ^ xor_cse_5 ^ xor_cse_21;
  assign xor_cse_35 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[5]);
  assign xor_cse_37 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[1]);
  assign xor_cse_43 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[4]);
  assign xor_cse_46 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[7]);
  assign xor_cse_42 = xor_cse_43 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[1]) ^ xor_cse_46;
  assign xor_cse_48 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[3]);
  assign xor_cse_50 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[4]);
  assign xor_cse_52 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[0]);
  assign xor_cse_59 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_62 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[3]);
  assign xor_cse_63 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[0]);
  assign xor_cse_64 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[1]);
  assign xor_cse_66 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[4]);
  assign xor_cse_69 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[5]);
  assign xor_cse_68 = xor_cse_23 ^ xor_cse_69 ^ xor_cse_43;
  assign xor_cse_72 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[0]);
  assign xor_cse_74 = xor_cse_59 ^ xor_cse_46 ^ xor_cse_1;
  assign xor_cse_77 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[4]);
  assign xor_cse_78 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[6]);
  assign xor_cse_79 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva;
  assign xor_cse_84 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[5]);
  assign xor_cse_85 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[3]);
  assign xor_cse_83 = xor_cse_21 ^ xor_cse_84 ^ xor_cse_85;
  assign xor_cse_87 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_89 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_90 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[3]);
  assign xor_cse_91 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_99 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[1]);
  assign xor_cse_105 = xor_cse_35 ^ xor_cse_37 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[6]);
  assign xor_cse_106 = xor_cse_21 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[4]);
  assign xor_cse_108 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[0]);
  assign xor_cse_109 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[6]);
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0
      = xor_cse_105 ^ xor_cse_106 ^ xor_cse_43 ^ xor_cse_108 ^ xor_cse_109 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[6]);
  assign xor_cse_111 = xor_cse_59 ^ xor_cse_85 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[7]);
  assign xor_cse_112 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[5]);
  assign xor_cse_114 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[1]);
  assign xor_cse_115 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva
      ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[7]);
  assign xor_cse_117 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[7]);
  assign xor_cse_124 = xor_cse_48 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva
      ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[6]) ^ xor_cse_25;
  assign xor_cse_131 = (mag_cal_15_8_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva
      ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[2]);
  assign xor_cse_135 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva
      ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[1]);
  assign xor_cse_145 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[7]) ^ crc32_pix_in_default_31_1_lpi_3 ^ (pix_buf_lpi_3_dfm_mx0[31]);
  assign xor_cse_149 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[30]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva
      ^ (pix_buf_lpi_3_dfm_mx0[25]);
  assign xor_cse_144 = xor_cse_145 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ (pix_buf_lpi_3_dfm_mx0[3]) ^ xor_cse_149;
  assign xor_cse_157 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[14]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[18]);
  assign xor_cse_160 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ (pix_buf_lpi_3_dfm_mx0[20]);
  assign xor_cse_163 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva
      ^ (pix_buf_lpi_3_dfm_mx0[15]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva;
  assign xor_cse_165 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva
      ^ (pix_buf_lpi_3_dfm_mx0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[22]);
  assign xor_cse_167 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ (pix_buf_lpi_3_dfm_mx0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[6]);
  assign xor_cse_169 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva
      ^ (pix_buf_lpi_3_dfm_mx0[15]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ (pix_buf_lpi_3_dfm_mx0[1]);
  assign xor_cse_171 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva
      ^ (pix_buf_lpi_3_dfm_mx0[25]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[2]);
  assign xor_cse_173 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
      ^ (pix_buf_lpi_3_dfm_mx0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva
      ^ (pix_buf_lpi_3_dfm_mx0[19]);
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_mx0w0 = xor_cse_145
      ^ xor_cse_165 ^ xor_cse_167 ^ xor_cse_169 ^ xor_cse_171 ^ xor_cse_173 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva
      ^ (pix_buf_lpi_3_dfm_mx0[21]);
  assign xor_cse_177 = xor_cse_145 ^ xor_cse_157 ^ xor_cse_149 ^ xor_cse_165;
  assign xor_cse_179 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva
      ^ (pix_buf_lpi_3_dfm_mx0[24]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva
      ^ (pix_buf_lpi_3_dfm_mx0[29]);
  assign xor_cse_181 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva
      ^ (pix_buf_lpi_3_dfm_mx0[13]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva
      ^ (pix_buf_lpi_3_dfm_mx0[17]);
  assign xor_cse_187 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[28]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
      ^ (pix_buf_lpi_3_dfm_mx0[12]);
  assign xor_cse_190 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva
      ^ (pix_buf_lpi_3_dfm_mx0[23]);
  assign xor_cse_186 = xor_cse_187 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva
      ^ (pix_buf_lpi_3_dfm_mx0[25]) ^ xor_cse_190;
  assign xor_cse_192 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva
      ^ (pix_buf_lpi_3_dfm_mx0[27]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva
      ^ (pix_buf_lpi_3_dfm_mx0[19]);
  assign xor_cse_194 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[16]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ (pix_buf_lpi_3_dfm_mx0[20]);
  assign xor_cse_196 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva
      ^ (pix_buf_lpi_3_dfm_mx0[13]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva
      ^ (pix_buf_lpi_3_dfm_mx0[0]);
  assign xor_cse_203 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva
      ^ (pix_buf_lpi_3_dfm_mx0[26]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[10]);
  assign xor_cse_206 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva
      ^ (pix_buf_lpi_3_dfm_mx0[27]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva
      ^ (pix_buf_lpi_3_dfm_mx0[11]);
  assign xor_cse_207 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[18]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva
      ^ (pix_buf_lpi_3_dfm_mx0[24]);
  assign xor_cse_208 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ (pix_buf_lpi_3_dfm_mx0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva
      ^ (pix_buf_lpi_3_dfm_mx0[9]);
  assign xor_cse_210 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ (pix_buf_lpi_3_dfm_mx0[20]);
  assign xor_cse_213 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva
      ^ (pix_buf_lpi_3_dfm_mx0[9]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva
      ^ (pix_buf_lpi_3_dfm_mx0[21]);
  assign xor_cse_212 = xor_cse_167 ^ xor_cse_213 ^ xor_cse_187;
  assign xor_cse_216 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
      ^ (pix_buf_lpi_3_dfm_mx0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva
      ^ (pix_buf_lpi_3_dfm_mx0[8]);
  assign xor_cse_218 = xor_cse_203 ^ xor_cse_190 ^ xor_cse_145;
  assign xor_cse_221 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[16]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[28]);
  assign xor_cse_222 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ (pix_buf_lpi_3_dfm_mx0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[14]);
  assign xor_cse_223 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[30]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva;
  assign xor_cse_228 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva
      ^ (pix_buf_lpi_3_dfm_mx0[15]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
      ^ (pix_buf_lpi_3_dfm_mx0[5]);
  assign xor_cse_229 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva
      ^ (pix_buf_lpi_3_dfm_mx0[11]);
  assign xor_cse_227 = xor_cse_165 ^ xor_cse_228 ^ xor_cse_229;
  assign xor_cse_231 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
      ^ (pix_buf_lpi_3_dfm_mx0[12]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[2]);
  assign xor_cse_233 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva
      ^ (pix_buf_lpi_3_dfm_mx0[26]);
  assign xor_cse_234 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva
      ^ (pix_buf_lpi_3_dfm_mx0[17]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ (pix_buf_lpi_3_dfm_mx0[3]);
  assign xor_cse_235 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva
      ^ (pix_buf_lpi_3_dfm_mx0[29]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[18]);
  assign xor_cse_243 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ (pix_buf_lpi_3_dfm_mx0[1]);
  assign xor_cse_249 = xor_cse_179 ^ xor_cse_181 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[30]);
  assign xor_cse_250 = xor_cse_165 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[4]);
  assign xor_cse_252 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva
      ^ (pix_buf_lpi_3_dfm_mx0[21]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[16]);
  assign xor_cse_253 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva
      ^ (pix_buf_lpi_3_dfm_mx0[23]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[14]);
  assign xor_cse_255 = xor_cse_203 ^ xor_cse_229 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva
      ^ (pix_buf_lpi_3_dfm_mx0[23]);
  assign xor_cse_256 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva
      ^ (pix_buf_lpi_3_dfm_mx0[29]);
  assign xor_cse_258 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva
      ^ (pix_buf_lpi_3_dfm_mx0[25]);
  assign xor_cse_259 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva
      ^ (pix_buf_lpi_3_dfm_mx0[24]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[7]);
  assign xor_cse_261 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva
      ^ (pix_buf_lpi_3_dfm_mx0[13]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[7]);
  assign xor_cse_268 = xor_cse_192 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[22]) ^ xor_cse_169;
  assign xor_cse_275 = (pix_buf_lpi_3_dfm_mx0[8]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva
      ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva ^ (pix_buf_lpi_3_dfm_mx0[26]);
  assign xor_cse_279 = EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[10]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva
      ^ (pix_buf_lpi_3_dfm_mx0[9]);
  assign EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w0 =
      xor_cse_190 ^ xor_cse_229 ^ xor_cse_194 ^ xor_cse_259 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva
      ^ (pix_buf_lpi_3_dfm_mx0[9]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
      ^ (pix_buf_lpi_3_dfm_mx0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva
      ^ (pix_buf_lpi_3_dfm_mx0[15]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
      ^ (pix_buf_lpi_3_dfm_mx0[28]);
  always @(posedge clk) begin
    if ( MCOL_if_4_and_cse ) begin
      dat_out_rsci_idat_33_26 <= mag_cal_31_24_lpi_3_dfm_mx0w0;
      dat_out_rsci_idat_0 <= MCOL_if_2_MCOL_if_2_nor_itm_1;
      dat_out_rsci_idat_25_18 <= mag_cal_23_16_lpi_3_dfm_mx0w0;
      dat_out_rsci_idat_1 <= MROW_equal_tmp;
      dat_out_rsci_idat_17_10 <= mag_cal_15_8_lpi_3_dfm_mx0w0;
      dat_out_rsci_idat_9_2 <= mag_cal_7_0_lpi_3_dfm_mx0w0;
    end
  end
  always @(posedge clk) begin
    if ( EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_and_cse ) begin
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva <= (xor_cse
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[0])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[6])
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[3]) ^ xor_cse_13 ^ xor_cse_16 ^ xor_cse_19)
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva <= (xor_cse_33
          ^ xor_cse_35 ^ xor_cse_37 ^ xor_cse_25 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[5])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva <= (xor_cse_42
          ^ xor_cse_1 ^ xor_cse_48 ^ xor_cse_50 ^ xor_cse_52 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[5]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[6])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva <= (xor_cse
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[2])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[5])
          ^ xor_cse_59 ^ xor_cse_43 ^ xor_cse_62 ^ xor_cse_63) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva <= (xor_cse_46
          ^ xor_cse_35 ^ xor_cse_5 ^ xor_cse_59 ^ xor_cse_64 ^ xor_cse_62 ^ xor_cse_66
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[1]))
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva <= (xor_cse_68
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[1])
          ^ xor_cse_1 ^ xor_cse_72 ^ xor_cse_52 ^ xor_cse_62) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva <= (xor_cse_74
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[0])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[7])
          ^ xor_cse_23 ^ xor_cse_35 ^ xor_cse_69 ^ xor_cse_77) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva <= (xor_cse_48
          ^ xor_cse_69 ^ xor_cse_78 ^ xor_cse_79 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[7]) ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[0])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[4])
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[4]) ^ crc32_dat_out_default_31_1_lpi_3
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[0])
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[7])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva <= (xor_cse_83
          ^ xor_cse_5 ^ xor_cse_13 ^ xor_cse_87 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[0]) ^ crc32_dat_out_default_31_1_lpi_3
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[7])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva <= (xor_cse_84
          ^ xor_cse_21 ^ xor_cse_43 ^ xor_cse_89 ^ xor_cse_90 ^ xor_cse_91 ^ crc32_dat_out_default_31_1_lpi_3
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[7])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva <= ((mag_cal_23_16_lpi_3_dfm_mx0w0[3])
          ^ xor_cse_1 ^ xor_cse_21 ^ xor_cse_72 ^ xor_cse_37 ^ xor_cse_16 ^ xor_cse_87
          ^ xor_cse_19) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva <= (xor_cse_83
          ^ xor_cse_1 ^ xor_cse_23 ^ xor_cse_48 ^ xor_cse_77 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[6])
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[6])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva <= (xor_cse_33
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[5]) ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[5])
          ^ xor_cse_59 ^ xor_cse_48 ^ xor_cse_99 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[0]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva <= (xor_cse_42
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[6])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[1])
          ^ xor_cse_35 ^ xor_cse_72 ^ xor_cse_50 ^ xor_cse_62) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva <= (xor_cse_74
          ^ xor_cse_48 ^ xor_cse_13 ^ xor_cse_64 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[5])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva <= (xor_cse_111
          ^ xor_cse_112 ^ xor_cse_23 ^ xor_cse_64 ^ xor_cse_114 ^ xor_cse_29) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva <= (xor_cse_72
          ^ xor_cse_85 ^ xor_cse_59 ^ xor_cse_115 ^ xor_cse_66 ^ xor_cse_87 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[3]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[6])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva <= (xor_cse_48
          ^ xor_cse_89 ^ xor_cse_79 ^ xor_cse_91 ^ xor_cse_117 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[6]) ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[0])
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[4])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva <= (xor_cse_105
          ^ xor_cse_85 ^ xor_cse_25 ^ xor_cse_78 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[5])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva <= (xor_cse_68
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[0])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[2])
          ^ xor_cse_35 ^ xor_cse_5 ^ xor_cse_37 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[7])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva <= (xor_cse_124
          ^ xor_cse_23 ^ xor_cse_72 ^ xor_cse_109 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[2])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva <= (xor_cse_124
          ^ xor_cse_111 ^ xor_cse_115 ^ xor_cse_77 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[5])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva <= (xor_cse_35
          ^ xor_cse_72 ^ xor_cse_114 ^ xor_cse_108 ^ xor_cse_90 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[2]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[4]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[0])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva <= (xor_cse_21
          ^ xor_cse_5 ^ xor_cse_85 ^ xor_cse_37 ^ xor_cse_64 ^ xor_cse_131 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
          ^ (mag_cal_23_16_lpi_3_dfm_mx0w0[2])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva <= (xor_cse_106
          ^ xor_cse_23 ^ xor_cse_72 ^ xor_cse_27 ^ xor_cse_63 ^ xor_cse_135 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[4])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva <= (xor_cse_46
          ^ xor_cse_43 ^ xor_cse_50 ^ xor_cse_78 ^ xor_cse_52 ^ xor_cse_135 ^ xor_cse_112)
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva <= (xor_cse_106
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[5])
          ^ xor_cse_13 ^ xor_cse_69 ^ xor_cse_89 ^ xor_cse_117) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva <= (xor_cse_46
          ^ xor_cse_85 ^ xor_cse_50 ^ xor_cse_115 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[6]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva
          ^ (mag_cal_15_8_lpi_3_dfm_mx0w0[7]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[4])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva <= (xor_cse_46
          ^ xor_cse_72 ^ xor_cse_69 ^ xor_cse_115 ^ xor_cse_99 ^ xor_cse_90 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva
          ^ (mag_cal_31_24_lpi_3_dfm_mx0w0[3])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva <= (xor_cse_21
          ^ xor_cse_46 ^ xor_cse_23 ^ xor_cse_50 ^ xor_cse_99 ^ xor_cse_131 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
          ^ (mag_cal_7_0_lpi_3_dfm_mx0w0[7])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva <= (xor_cse_144
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva ^ (pix_buf_lpi_3_dfm_mx0[24])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva ^ (pix_buf_lpi_3_dfm_mx0[22])
          ^ (pix_buf_lpi_3_dfm_mx0[19]) ^ xor_cse_157 ^ xor_cse_160 ^ xor_cse_163)
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva <= (xor_cse_177
          ^ xor_cse_179 ^ xor_cse_181 ^ xor_cse_169 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva
          ^ (pix_buf_lpi_3_dfm_mx0[23]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
          ^ (pix_buf_lpi_3_dfm_mx0[5])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva <= (xor_cse_186
          ^ xor_cse_145 ^ xor_cse_192 ^ xor_cse_194 ^ xor_cse_196 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva
          ^ (pix_buf_lpi_3_dfm_mx0[11]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
          ^ (pix_buf_lpi_3_dfm_mx0[1]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva
          ^ (pix_buf_lpi_3_dfm_mx0[29]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
          ^ (pix_buf_lpi_3_dfm_mx0[6])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva <= (xor_cse_144
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva ^ (pix_buf_lpi_3_dfm_mx0[2])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva ^ (pix_buf_lpi_3_dfm_mx0[21])
          ^ xor_cse_203 ^ xor_cse_187 ^ xor_cse_206 ^ xor_cse_207) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva <= (xor_cse_190
          ^ xor_cse_179 ^ xor_cse_149 ^ xor_cse_203 ^ xor_cse_208 ^ xor_cse_206 ^
          xor_cse_210 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva
          ^ (pix_buf_lpi_3_dfm_mx0[17])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva <= (xor_cse_212
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva ^ (pix_buf_lpi_3_dfm_mx0[25])
          ^ xor_cse_145 ^ xor_cse_216 ^ xor_cse_196 ^ xor_cse_206) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva <= (xor_cse_218
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva ^ (pix_buf_lpi_3_dfm_mx0[8])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva ^ (pix_buf_lpi_3_dfm_mx0[15])
          ^ xor_cse_167 ^ xor_cse_179 ^ xor_cse_213 ^ xor_cse_221) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva <= (xor_cse_192
          ^ xor_cse_213 ^ xor_cse_222 ^ xor_cse_223 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva
          ^ (pix_buf_lpi_3_dfm_mx0[23]) ^ (pix_buf_lpi_3_dfm_mx0[8]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
          ^ (pix_buf_lpi_3_dfm_mx0[28]) ^ (pix_buf_lpi_3_dfm_mx0[20]) ^ crc32_pix_in_default_31_1_lpi_3
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva ^ (pix_buf_lpi_3_dfm_mx0[0])
          ^ (pix_buf_lpi_3_dfm_mx0[31])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva <= (xor_cse_227
          ^ xor_cse_149 ^ xor_cse_157 ^ xor_cse_231 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
          ^ (pix_buf_lpi_3_dfm_mx0[16]) ^ crc32_pix_in_default_31_1_lpi_3 ^ (pix_buf_lpi_3_dfm_mx0[31]))
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva <= (xor_cse_228
          ^ xor_cse_165 ^ xor_cse_187 ^ xor_cse_233 ^ xor_cse_234 ^ xor_cse_235 ^
          crc32_pix_in_default_31_1_lpi_3 ^ (pix_buf_lpi_3_dfm_mx0[31])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva <= ((pix_buf_lpi_3_dfm_mx0[19])
          ^ xor_cse_145 ^ xor_cse_165 ^ xor_cse_216 ^ xor_cse_181 ^ xor_cse_160 ^
          xor_cse_231 ^ xor_cse_163) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva <= (xor_cse_227
          ^ xor_cse_145 ^ xor_cse_167 ^ xor_cse_192 ^ xor_cse_221 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva
          ^ (pix_buf_lpi_3_dfm_mx0[17]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva ^ (pix_buf_lpi_3_dfm_mx0[14])
          ^ (pix_buf_lpi_3_dfm_mx0[30])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva <= (xor_cse_177
          ^ (pix_buf_lpi_3_dfm_mx0[13]) ^ (pix_buf_lpi_3_dfm_mx0[29]) ^ xor_cse_203
          ^ xor_cse_192 ^ xor_cse_243 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
          ^ (pix_buf_lpi_3_dfm_mx0[16]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva <= (xor_cse_186
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva ^ (pix_buf_lpi_3_dfm_mx0[14])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva ^ (pix_buf_lpi_3_dfm_mx0[17])
          ^ xor_cse_179 ^ xor_cse_216 ^ xor_cse_194 ^ xor_cse_206) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva <= (xor_cse_218
          ^ xor_cse_192 ^ xor_cse_157 ^ xor_cse_208 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
          ^ (pix_buf_lpi_3_dfm_mx0[12]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
          ^ (pix_buf_lpi_3_dfm_mx0[5])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva <= (xor_cse_249
          ^ xor_cse_250 ^ xor_cse_187 ^ xor_cse_252 ^ xor_cse_253 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
          ^ (pix_buf_lpi_3_dfm_mx0[6])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva <= (xor_cse_255
          ^ xor_cse_256 ^ xor_cse_167 ^ xor_cse_208 ^ xor_cse_258 ^ xor_cse_173)
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva <= (xor_cse_192
          ^ xor_cse_233 ^ xor_cse_223 ^ xor_cse_235 ^ xor_cse_261 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva
          ^ (pix_buf_lpi_3_dfm_mx0[22]) ^ (pix_buf_lpi_3_dfm_mx0[8]) ^ (pix_buf_lpi_3_dfm_mx0[20]))
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva <= (xor_cse_249
          ^ xor_cse_229 ^ xor_cse_169 ^ xor_cse_222 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
          ^ (pix_buf_lpi_3_dfm_mx0[10]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva
          ^ (pix_buf_lpi_3_dfm_mx0[21])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva <= (xor_cse_212
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva ^ (pix_buf_lpi_3_dfm_mx0[0])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva ^ (pix_buf_lpi_3_dfm_mx0[18])
          ^ xor_cse_179 ^ xor_cse_149 ^ xor_cse_181 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva
          ^ (pix_buf_lpi_3_dfm_mx0[26]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva
          ^ (pix_buf_lpi_3_dfm_mx0[15])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva <= (xor_cse_268
          ^ xor_cse_167 ^ xor_cse_216 ^ xor_cse_253 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
          ^ (pix_buf_lpi_3_dfm_mx0[10])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva <= (xor_cse_268
          ^ xor_cse_255 ^ xor_cse_259 ^ xor_cse_221 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva
          ^ (pix_buf_lpi_3_dfm_mx0[13])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva <= (xor_cse_179
          ^ xor_cse_216 ^ xor_cse_258 ^ xor_cse_252 ^ xor_cse_234 ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
          ^ (pix_buf_lpi_3_dfm_mx0[10]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
          ^ (pix_buf_lpi_3_dfm_mx0[12]) ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva
          ^ (pix_buf_lpi_3_dfm_mx0[0])) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva <= (xor_cse_165
          ^ xor_cse_149 ^ xor_cse_229 ^ xor_cse_181 ^ xor_cse_208 ^ xor_cse_275 ^
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva ^ (pix_buf_lpi_3_dfm_mx0[6])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva ^ (pix_buf_lpi_3_dfm_mx0[18]))
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva <= (xor_cse_250
          ^ xor_cse_167 ^ xor_cse_216 ^ xor_cse_171 ^ xor_cse_207 ^ xor_cse_279 ^
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva ^ (pix_buf_lpi_3_dfm_mx0[28]))
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva <= (xor_cse_190
          ^ xor_cse_187 ^ xor_cse_194 ^ xor_cse_222 ^ xor_cse_196 ^ xor_cse_279 ^
          xor_cse_256) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva <= (xor_cse_250
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva ^ (pix_buf_lpi_3_dfm_mx0[5])
          ^ xor_cse_157 ^ xor_cse_213 ^ xor_cse_233 ^ xor_cse_261) | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva <= (xor_cse_190
          ^ xor_cse_216 ^ xor_cse_213 ^ xor_cse_259 ^ xor_cse_243 ^ xor_cse_234 ^
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva ^ (pix_buf_lpi_3_dfm_mx0[27]))
          | or_tmp_69;
    end
  end
  always @(posedge clk) begin
    if ( EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_and_cse ) begin
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva <= MUX1HOT_s_1_3_2(EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_mx0w0,
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0,
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva, {and_dcpl_6
          , and_dcpl_8 , and_dcpl_9});
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva <= MUX1HOT_s_1_3_2(EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_mx0w0,
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w0,
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva, {and_dcpl_6
          , and_dcpl_8 , and_dcpl_9});
    end
  end
  always @(posedge clk) begin
    if ( EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_and_15_cse ) begin
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva <= EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva <= EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w0
          | or_tmp_69;
    end
  end
  always @(posedge clk) begin
    if ( EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_and_17_cse ) begin
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva <= (xor_cse_216
          ^ xor_cse_229 ^ xor_cse_203 ^ xor_cse_259 ^ xor_cse_210 ^ xor_cse_231 ^
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva ^ (pix_buf_lpi_3_dfm_mx0[27])
          ^ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva ^ (pix_buf_lpi_3_dfm_mx0[30]))
          | or_tmp_69;
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva <= (xor_cse_165
          ^ xor_cse_190 ^ xor_cse_167 ^ xor_cse_194 ^ xor_cse_243 ^ xor_cse_275 ^
          EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva ^ (pix_buf_lpi_3_dfm_mx0[7]))
          | or_tmp_69;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & MROW_y_or_cse ) begin
      MROW_y_sva <= MUX_v_9_2_2(9'b000000000, z_out, MROW_y_not_1_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_asn_10_itm_1 <= 1'b0;
      MCOL_if_4_slc_MCOL_if_4_acc_8_itm_1 <= 1'b0;
      MCOL_if_slc_operator_10_false_acc_8_svs_1 <= 1'b0;
    end
    else if ( rst ) begin
      MCOL_asn_10_itm_1 <= 1'b0;
      MCOL_if_4_slc_MCOL_if_4_acc_8_itm_1 <= 1'b0;
      MCOL_if_slc_operator_10_false_acc_8_svs_1 <= 1'b0;
    end
    else if ( MCOL_and_3_cse ) begin
      MCOL_asn_10_itm_1 <= MCOL_MCOL_if_5_and_tmp;
      MCOL_if_4_slc_MCOL_if_4_acc_8_itm_1 <= MCOL_if_4_acc_1_itm_8_1;
      MCOL_if_slc_operator_10_false_acc_8_svs_1 <= operator_10_false_acc_itm_8_1;
    end
  end
  always @(posedge clk) begin
    if ( MCOL_and_4_cse ) begin
      MCOL_asn_4_itm_1 <= MUX_v_36_2_2(dy_in_rsci_idat_mxwt, dy_lpi_3, or_dcpl_6);
      MCOL_asn_itm_1 <= MUX_v_36_2_2(dx_in_rsci_idat_mxwt, dx_lpi_3, or_dcpl_6);
    end
  end
  always @(posedge clk) begin
    if ( crc32_pix_in_default_and_cse ) begin
      crc32_pix_in_rsci_idat_15 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva;
      crc32_pix_in_rsci_idat_16 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva;
      crc32_pix_in_rsci_idat_14 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva;
      crc32_pix_in_rsci_idat_17 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva;
      crc32_pix_in_rsci_idat_13 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva;
      crc32_pix_in_rsci_idat_18 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva;
      crc32_pix_in_rsci_idat_12 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva;
      crc32_pix_in_rsci_idat_19 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva;
      crc32_pix_in_rsci_idat_11 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva;
      crc32_pix_in_rsci_idat_20 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva;
      crc32_pix_in_rsci_idat_10 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva;
      crc32_pix_in_rsci_idat_21 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva;
      crc32_pix_in_rsci_idat_9 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva;
      crc32_pix_in_rsci_idat_22 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva;
      crc32_pix_in_rsci_idat_8 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva;
      crc32_pix_in_rsci_idat_23 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva;
      crc32_pix_in_rsci_idat_7 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva;
      crc32_pix_in_rsci_idat_24 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva;
      crc32_pix_in_rsci_idat_6 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva;
      crc32_pix_in_rsci_idat_25 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva;
      crc32_pix_in_rsci_idat_5 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva;
      crc32_pix_in_rsci_idat_26 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva;
      crc32_pix_in_rsci_idat_4 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva;
      crc32_pix_in_rsci_idat_27 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva;
      crc32_pix_in_rsci_idat_3 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva;
      crc32_pix_in_rsci_idat_28 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva;
      crc32_pix_in_rsci_idat_2 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva;
      crc32_pix_in_rsci_idat_29 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva;
      crc32_pix_in_rsci_idat_1 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva;
      crc32_pix_in_rsci_idat_30 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva;
      crc32_pix_in_rsci_idat_0 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva;
      crc32_pix_in_rsci_idat_31 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva;
      crc32_dat_out_rsci_idat_15 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva;
      crc32_dat_out_rsci_idat_16 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva;
      crc32_dat_out_rsci_idat_14 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva;
      crc32_dat_out_rsci_idat_17 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva;
      crc32_dat_out_rsci_idat_13 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva;
      crc32_dat_out_rsci_idat_18 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva;
      crc32_dat_out_rsci_idat_12 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva;
      crc32_dat_out_rsci_idat_19 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva;
      crc32_dat_out_rsci_idat_11 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva;
      crc32_dat_out_rsci_idat_20 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva;
      crc32_dat_out_rsci_idat_10 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva;
      crc32_dat_out_rsci_idat_21 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva;
      crc32_dat_out_rsci_idat_9 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva;
      crc32_dat_out_rsci_idat_22 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva;
      crc32_dat_out_rsci_idat_8 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva;
      crc32_dat_out_rsci_idat_23 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva;
      crc32_dat_out_rsci_idat_7 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva;
      crc32_dat_out_rsci_idat_24 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva;
      crc32_dat_out_rsci_idat_6 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva;
      crc32_dat_out_rsci_idat_25 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva;
      crc32_dat_out_rsci_idat_5 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva;
      crc32_dat_out_rsci_idat_26 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva;
      crc32_dat_out_rsci_idat_4 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva;
      crc32_dat_out_rsci_idat_27 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva;
      crc32_dat_out_rsci_idat_3 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva;
      crc32_dat_out_rsci_idat_28 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva;
      crc32_dat_out_rsci_idat_2 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva;
      crc32_dat_out_rsci_idat_29 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva;
      crc32_dat_out_rsci_idat_1 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva;
      crc32_dat_out_rsci_idat_30 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva;
      crc32_dat_out_rsci_idat_0 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva;
      crc32_dat_out_rsci_idat_31 <= ~ EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_stage_0 <= 1'b0;
    end
    else if ( rst ) begin
      MCOL_stage_0 <= 1'b0;
    end
    else if ( run_wen & ((MCOL_stage_0 & MCOL_MCOL_if_5_and_tmp) | MROW_y_or_cse)
        ) begin
      MCOL_stage_0 <= MROW_y_or_cse;
    end
  end
  always @(posedge clk) begin
    if ( run_wen ) begin
      MCOL_x_9_2_sva <= MUX_v_8_2_2(8'b00000000, operator_10_false_acc_nl, not_115_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_stage_0_2 <= 1'b0;
      reg_dx_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_crc32_pix_in_triosy_obj_iswt0_cse <= 1'b0;
    end
    else if ( rst ) begin
      MCOL_stage_0_2 <= 1'b0;
      reg_dx_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_crc32_pix_in_triosy_obj_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      MCOL_stage_0_2 <= MCOL_stage_0 & (~ MROW_y_or_cse);
      reg_dx_in_rsci_oswt_cse <= MCOL_stage_0 & (~ operator_10_false_acc_itm_8_1)
          & (fsm_output[1]);
      reg_dat_out_rsci_oswt_cse <= MCOL_stage_0_2 & (~ MCOL_if_4_slc_MCOL_if_4_acc_8_itm_1)
          & (fsm_output[1]);
      reg_crc32_pix_in_triosy_obj_iswt0_cse <= MROW_equal_tmp & (fsm_output[2]);
    end
  end
  always @(posedge clk) begin
    if ( dy_and_1_cse ) begin
      dy_lpi_3 <= MUX_v_36_2_2(MCOL_asn_4_itm_1, dy_in_rsci_idat_mxwt, and_dcpl_13);
      dx_lpi_3 <= MUX_v_36_2_2(MCOL_asn_itm_1, dx_in_rsci_idat_mxwt, and_dcpl_13);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & MCOL_stage_0 & (~ MCOL_if_4_acc_1_itm_8_1) ) begin
      MCOL_if_2_MCOL_if_2_nor_itm_1 <= ~((MROW_y_sva!=9'b000000000) | (MCOL_x_9_2_sva!=8'b00000000));
    end
  end
  always @(posedge clk) begin
    if ( crc32_dat_out_default_and_32_cse ) begin
      crc32_dat_out_default_31_1_lpi_3 <= crc32_dat_out_default_mux_nl | or_tmp_69;
      crc32_pix_in_default_31_1_lpi_3 <= crc32_pix_in_default_mux_nl | or_tmp_69;
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (~((MCOL_asn_10_itm_1 & MCOL_stage_0) | (~ MCOL_stage_0_2) | MCOL_if_slc_operator_10_false_acc_8_svs_1
        | (~ (fsm_output[1])))) & ((~ MCOL_stage_0) | operator_10_false_acc_itm_8_1)
        ) begin
      pix_buf_lpi_3 <= dat_in_rsci_idat_mxwt;
    end
  end
  assign MROW_y_not_1_nl = ~ (fsm_output[0]);
  assign nl_operator_10_false_acc_nl = MCOL_x_9_2_sva + 8'b00000001;
  assign operator_10_false_acc_nl = nl_operator_10_false_acc_nl[7:0];
  assign not_115_nl = ~ MROW_y_or_cse;
  assign crc32_dat_out_default_mux_nl = MUX_s_1_2_2(EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_mx0w0,
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva, fsm_output[2]);
  assign crc32_pix_in_default_mux_nl = MUX_s_1_2_2(EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_mx0w0,
      EdgeDetect_IP_EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva, fsm_output[2]);
  assign MROW_mux_1_nl = MUX_v_9_2_2(MROW_y_sva, (~ (dx_lpi_3_dfm_mx0[35:27])), fsm_output[1]);
  assign nl_z_out = MROW_mux_1_nl + 9'b000000001;
  assign z_out = nl_z_out[8:0];

  function automatic  MUX1HOT_s_1_3_2;
    input  input_2;
    input  input_1;
    input  input_0;
    input [2:0] sel;
    reg  result;
  begin
    result = input_0 & sel[0];
    result = result | (input_1 & sel[1]);
    result = result | (input_2 & sel[2]);
    MUX1HOT_s_1_3_2 = result;
  end
  endfunction


  function automatic  MUX_s_1_2_2;
    input  input_0;
    input  input_1;
    input  sel;
    reg  result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [35:0] MUX_v_36_2_2;
    input [35:0] input_0;
    input [35:0] input_1;
    input  sel;
    reg [35:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_36_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [1:0] readslicef_10_2_8;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_10_2_8 = tmp[1:0];
  end
  endfunction


  function automatic [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function automatic [2:0] conv_s2s_2_3 ;
    input [1:0]  vector ;
  begin
    conv_s2s_2_3 = {vector[1], vector};
  end
  endfunction


  function automatic [9:0] conv_s2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_s2s_9_10 = {vector[8], vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng_struct
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng_struct (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz, crc32_dat_out_rsc_dat,
      crc32_dat_out_triosy_lz, dat_out_rsc_dat_pix, dat_out_rsc_dat_eol, dat_out_rsc_dat_sof,
      dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  output [31:0] dat_out_rsc_dat_pix;
  output dat_out_rsc_dat_eol;
  output dat_out_rsc_dat_sof;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire [33:0] dat_out_rsc_dat;


  // Interconnect Declarations for Component Instantiations 
  EdgeDetect_IP_EdgeDetect_MagAng_run EdgeDetect_IP_EdgeDetect_MagAng_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .sw_in(sw_in),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_out_rsc_dat_sof = dat_out_rsc_dat[0];
  assign dat_out_rsc_dat_eol = dat_out_rsc_dat[1];
  assign dat_out_rsc_dat_pix = dat_out_rsc_dat[33:2];
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_MagAng
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_MagAng (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz, crc32_dat_out_rsc_dat,
      crc32_dat_out_triosy_lz, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire [31:0] dat_out_rsc_dat_pix;
  wire dat_out_rsc_dat_eol;
  wire dat_out_rsc_dat_sof;


  // Interconnect Declarations for Component Instantiations 
  EdgeDetect_IP_EdgeDetect_MagAng_struct EdgeDetect_IP_EdgeDetect_MagAng_struct_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .sw_in(sw_in),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .dat_out_rsc_dat_pix(dat_out_rsc_dat_pix),
      .dat_out_rsc_dat_eol(dat_out_rsc_dat_eol),
      .dat_out_rsc_dat_sof(dat_out_rsc_dat_sof),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_out_rsc_dat = {dat_out_rsc_dat_pix , dat_out_rsc_dat_eol , dat_out_rsc_dat_sof};
endmodule




//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_in_wait_coupled_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_coupled_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  assign idat = dat;
  assign rdy = irdy;
  assign ivld = vld;

endmodule


//------> ../EdgeDetect_IP_EdgeDetect_HorDer.v1/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2024.1/1091966 Production Release
//  HLS Date:       Wed Feb 14 09:07:18 PST 2024
// 
//  Generated by:   ee525201@ws41
//  Generated date: Fri Apr 12 23:24:05 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, HCOL_C_0_tr0, HROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input HCOL_C_0_tr0;
  input HROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    HCOL_C_0 = 2'd1,
    HROW_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_1
    case (state_var)
      HCOL_C_0 : begin
        fsm_output = 4'b0010;
        if ( HCOL_C_0_tr0 ) begin
          state_var_NS = HROW_C_0;
        end
        else begin
          state_var_NS = HCOL_C_0;
        end
      end
      HROW_C_0 : begin
        fsm_output = 4'b0100;
        if ( HROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = HCOL_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 4'b0001;
        state_var_NS = HCOL_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_staller
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_staller (
  run_wen, dat_in_rsci_wen_comp, dat_out_rsci_wen_comp, dx_rsci_wen_comp
);
  output run_wen;
  input dat_in_rsci_wen_comp;
  input dat_out_rsci_wen_comp;
  input dx_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dat_in_rsci_wen_comp & dat_out_rsci_wen_comp & dx_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp (
  clk, rst, arst_n, dx_rsci_oswt, dx_rsci_wen_comp, dx_rsci_biwt, dx_rsci_bdwt, dx_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dx_rsci_oswt;
  output dx_rsci_wen_comp;
  input dx_rsci_biwt;
  input dx_rsci_bdwt;
  output dx_rsci_bcwt;
  reg dx_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dx_rsci_wen_comp = (~ dx_rsci_oswt) | dx_rsci_biwt | dx_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dx_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dx_rsci_bcwt <= 1'b0;
    end
    else begin
      dx_rsci_bcwt <= ~((~(dx_rsci_bcwt | dx_rsci_biwt)) | dx_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl (
  run_wen, dx_rsci_oswt, dx_rsci_biwt, dx_rsci_bdwt, dx_rsci_bcwt, dx_rsci_irdy,
      dx_rsci_ivld_run_sct
);
  input run_wen;
  input dx_rsci_oswt;
  output dx_rsci_biwt;
  output dx_rsci_bdwt;
  input dx_rsci_bcwt;
  input dx_rsci_irdy;
  output dx_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dx_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_rsci_bdwt = dx_rsci_oswt & run_wen;
  assign dx_rsci_biwt = dx_rsci_ogwt & dx_rsci_irdy;
  assign dx_rsci_ogwt = dx_rsci_oswt & (~ dx_rsci_bcwt);
  assign dx_rsci_ivld_run_sct = dx_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl (
  run_wen, dat_in_rsci_iswt0, dat_in_rsci_irdy_run_sct
);
  input run_wen;
  input dat_in_rsci_iswt0;
  output dat_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_irdy_run_sct = dat_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci (
  clk, rst, arst_n, dx_rsc_dat, dx_rsc_vld, dx_rsc_rdy, run_wen, dx_rsci_oswt, dx_rsci_wen_comp,
      dx_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;
  input run_wen;
  input dx_rsci_oswt;
  output dx_rsci_wen_comp;
  input [35:0] dx_rsci_idat;


  // Interconnect Declarations
  wire dx_rsci_biwt;
  wire dx_rsci_bdwt;
  wire dx_rsci_bcwt;
  wire dx_rsci_irdy;
  wire dx_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd5),
  .width(32'sd36)) dx_rsci (
      .irdy(dx_rsci_irdy),
      .ivld(dx_rsci_ivld_run_sct),
      .idat(dx_rsci_idat),
      .rdy(dx_rsc_rdy),
      .vld(dx_rsc_vld),
      .dat(dx_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dx_rsci_oswt(dx_rsci_oswt),
      .dx_rsci_biwt(dx_rsci_biwt),
      .dx_rsci_bdwt(dx_rsci_bdwt),
      .dx_rsci_bcwt(dx_rsci_bcwt),
      .dx_rsci_irdy(dx_rsci_irdy),
      .dx_rsci_ivld_run_sct(dx_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_rsci_oswt(dx_rsci_oswt),
      .dx_rsci_wen_comp(dx_rsci_wen_comp),
      .dx_rsci_biwt(dx_rsci_biwt),
      .dx_rsci_bdwt(dx_rsci_bdwt),
      .dx_rsci_bcwt(dx_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [31:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd32)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(dat_out_rsci_idat),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci (
  dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, run_wen, dat_in_rsci_oswt, dat_in_rsci_wen_comp,
      dat_in_rsci_idat_mxwt
);
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dat_in_rsci_irdy_run_sct;
  wire dat_in_rsci_ivld;
  wire [31:0] dat_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd1),
  .width(32'sd32)) dat_in_rsci (
      .rdy(dat_in_rsc_rdy),
      .vld(dat_in_rsc_vld),
      .dat(dat_in_rsc_dat),
      .irdy(dat_in_rsci_irdy_run_sct),
      .ivld(dat_in_rsci_ivld),
      .idat(dat_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_dat_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_iswt0(dat_in_rsci_oswt),
      .dat_in_rsci_irdy_run_sct(dat_in_rsci_irdy_run_sct)
    );
  assign dat_in_rsci_idat_mxwt = dat_in_rsci_idat;
  assign dat_in_rsci_wen_comp = (~ dat_in_rsci_oswt) | dat_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer_run
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer_run (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire dat_in_rsci_wen_comp;
  wire [31:0] dat_in_rsci_idat_mxwt;
  wire dat_out_rsci_wen_comp;
  reg [31:0] dat_out_rsci_idat;
  wire dx_rsci_wen_comp;
  reg [8:0] dx_rsci_idat_35_27;
  reg [8:0] dx_rsci_idat_26_18;
  wire [9:0] nl_dx_rsci_idat_26_18;
  reg [8:0] dx_rsci_idat_17_9;
  wire [9:0] nl_dx_rsci_idat_17_9;
  reg [8:0] dx_rsci_idat_8_0;
  wire [9:0] nl_dx_rsci_idat_8_0;
  wire [3:0] fsm_output;
  wire HCOL_HCOL_if_2_and_tmp;
  wire or_dcpl;
  reg [7:0] HCOL_x_9_2_sva;
  wire [7:0] HCOL_x_9_2_sva_mx1;
  reg HCOL_stage_0_2;
  reg HCOL_stage_0_1;
  reg [7:0] HCOL_asn_1_itm_1;
  reg HCOL_if_slc_operator_10_false_acc_8_svs_1;
  wire HCOL_if_3_and_cse;
  reg reg_dat_in_rsci_oswt_cse;
  reg reg_dat_out_rsci_oswt_cse;
  wire HCOL_HCOL_and_cse;
  reg [31:0] pix_buf1_lpi_3;
  wire [8:0] z_out;
  wire [9:0] nl_z_out;
  wire [8:0] z_out_1;
  reg [8:0] HROW_y_sva;
  reg [31:0] pix_buf_lpi_3;
  wire [7:0] pix3_lpi_3_dfm_mx0;
  wire [7:0] pix2_lpi_3_dfm_mx0;
  wire [7:0] pix_buf_lpi_3_dfm_mx1_7_0;
  wire HROW_y_or_cse;
  wire operator_10_false_acc_itm_8_1;

  wire[7:0] HCOL_mux_1_nl;
  wire[7:0] HCOL_mux_2_nl;
  wire not_29_nl;
  wire HROW_y_not_1_nl;
  wire pix_buf1_and_1_nl;
  wire[8:0] operator_10_false_acc_nl;
  wire[9:0] nl_operator_10_false_acc_nl;
  wire HROW_HROW_and_1_nl;
  wire[7:0] HROW_mux_2_nl;
  wire[9:0] acc_1_nl;
  wire[10:0] nl_acc_1_nl;
  wire operator_8_false_11_operator_8_false_11_or_1_nl;
  wire[7:0] operator_8_false_11_operator_8_false_11_mux1h_1_nl;
  wire operator_8_false_11_operator_8_false_11_nor_1_nl;
  wire operator_8_false_11_and_2_nl;
  wire operator_8_false_11_or_1_nl;
  wire[7:0] operator_8_false_11_operator_8_false_11_nand_1_nl;
  wire operator_8_false_11_not_6_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [35:0] nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat = {dx_rsci_idat_35_27
      , dx_rsci_idat_26_18 , dx_rsci_idat_17_9 , dx_rsci_idat_8_0};
  wire  nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HCOL_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HCOL_C_0_tr0 = ~(HCOL_stage_0_2
      | HCOL_stage_0_1);
  wire  nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0 = HROW_y_sva
      == (z_out_1);
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci EdgeDetect_IP_EdgeDetect_HorDer_run_dat_in_rsci_inst
      (
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .run_wen(run_wen),
      .dat_in_rsci_oswt(reg_dat_in_rsci_oswt_cse),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci EdgeDetect_IP_EdgeDetect_HorDer_run_dat_out_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(dat_out_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy),
      .run_wen(run_wen),
      .dx_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dx_rsci_wen_comp(dx_rsci_wen_comp),
      .dx_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat[35:0])
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_staller EdgeDetect_IP_EdgeDetect_HorDer_run_staller_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dx_rsci_wen_comp(dx_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .HCOL_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HCOL_C_0_tr0),
      .HROW_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0)
    );
  assign HCOL_if_3_and_cse = run_wen & (fsm_output[1]) & (~((HCOL_asn_1_itm_1==8'b00000000)))
      & HCOL_stage_0_2;
  assign HROW_y_or_cse = (fsm_output[0]) | (fsm_output[2]);
  assign HCOL_x_9_2_sva_mx1 = MUX_v_8_2_2(HCOL_x_9_2_sva, (z_out[7:0]), HCOL_stage_0_2);
  assign HCOL_HCOL_and_cse = HCOL_stage_0_1 & or_dcpl;
  assign nl_operator_10_false_acc_nl = ({1'b1 , (widthIn[9:2])}) + conv_u2u_8_9(~
      HCOL_x_9_2_sva_mx1);
  assign operator_10_false_acc_nl = nl_operator_10_false_acc_nl[8:0];
  assign operator_10_false_acc_itm_8_1 = readslicef_9_1_8(operator_10_false_acc_nl);
  assign pix_buf_lpi_3_dfm_mx1_7_0 = MUX_v_8_2_2((dat_in_rsci_idat_mxwt[7:0]), (pix_buf_lpi_3[7:0]),
      HCOL_if_slc_operator_10_false_acc_8_svs_1);
  assign pix3_lpi_3_dfm_mx0 = MUX_v_8_2_2((pix_buf1_lpi_3[31:24]), pix_buf_lpi_3_dfm_mx1_7_0,
      HCOL_HCOL_if_2_and_tmp);
  assign pix2_lpi_3_dfm_mx0 = MUX_v_8_2_2((pix_buf1_lpi_3[23:16]), (pix_buf1_lpi_3[31:24]),
      HCOL_HCOL_if_2_and_tmp);
  assign HCOL_HCOL_if_2_and_tmp = (HCOL_x_9_2_sva == (widthIn[9:2])) & (widthIn[1:0]==2'b00);
  assign or_dcpl = ~(HCOL_HCOL_if_2_and_tmp & HCOL_stage_0_2);
  always @(posedge clk) begin
    if ( HCOL_if_3_and_cse ) begin
      dat_out_rsci_idat <= pix_buf1_lpi_3;
      dx_rsci_idat_35_27 <= z_out_1;
      dx_rsci_idat_8_0 <= nl_dx_rsci_idat_8_0[8:0];
      dx_rsci_idat_26_18 <= nl_dx_rsci_idat_26_18[8:0];
      dx_rsci_idat_17_9 <= nl_dx_rsci_idat_17_9[8:0];
    end
  end
  always @(posedge clk) begin
    if ( (HCOL_stage_0_2 | (fsm_output[2]) | (fsm_output[0])) & run_wen ) begin
      HCOL_x_9_2_sva <= MUX_v_8_2_2(8'b00000000, HCOL_x_9_2_sva_mx1, not_29_nl);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & HROW_y_or_cse ) begin
      HROW_y_sva <= MUX_v_9_2_2(9'b000000000, z_out, HROW_y_not_1_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_stage_0_1 <= 1'b0;
      HCOL_asn_1_itm_1 <= 8'b00000000;
      HCOL_stage_0_2 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_stage_0_1 <= 1'b0;
      HCOL_asn_1_itm_1 <= 8'b00000000;
      HCOL_stage_0_2 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      HCOL_stage_0_1 <= HCOL_HCOL_and_cse | HROW_y_or_cse;
      HCOL_asn_1_itm_1 <= HCOL_x_9_2_sva_mx1;
      HCOL_stage_0_2 <= HCOL_HCOL_and_cse & (~ HROW_y_or_cse);
      reg_dat_in_rsci_oswt_cse <= or_dcpl & HCOL_stage_0_1 & (~ operator_10_false_acc_itm_8_1)
          & (fsm_output[1]);
      reg_dat_out_rsci_oswt_cse <= ((HCOL_asn_1_itm_1!=8'b00000000)) & HCOL_stage_0_2
          & (fsm_output[1]);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (HCOL_stage_0_2 | HROW_y_or_cse) ) begin
      pix_buf1_lpi_3 <= MUX_v_32_2_2(pix_buf_lpi_3, dat_in_rsci_idat_mxwt, pix_buf1_and_1_nl);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & (~((~ HCOL_stage_0_2) | HCOL_if_slc_operator_10_false_acc_8_svs_1
        | (~ (fsm_output[1])))) & ((HCOL_HCOL_if_2_and_tmp & HCOL_stage_0_2) | (~
        HCOL_stage_0_1) | operator_10_false_acc_itm_8_1) ) begin
      pix_buf_lpi_3 <= dat_in_rsci_idat_mxwt;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_if_slc_operator_10_false_acc_8_svs_1 <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_if_slc_operator_10_false_acc_8_svs_1 <= 1'b0;
    end
    else if ( run_wen & HCOL_HCOL_and_cse ) begin
      HCOL_if_slc_operator_10_false_acc_8_svs_1 <= operator_10_false_acc_itm_8_1;
    end
  end
  assign HCOL_mux_1_nl = MUX_v_8_2_2((pix_buf1_lpi_3[7:0]), (pix_buf1_lpi_3[15:8]),
      HCOL_HCOL_if_2_and_tmp);
  assign nl_dx_rsci_idat_8_0  = ({1'b1 , pix2_lpi_3_dfm_mx0}) + conv_u2s_8_9(~ HCOL_mux_1_nl)
      + 9'b000000001;
  assign nl_dx_rsci_idat_26_18  = ({1'b1 , pix_buf_lpi_3_dfm_mx1_7_0}) + conv_u2s_8_9(~
      pix2_lpi_3_dfm_mx0) + 9'b000000001;
  assign HCOL_mux_2_nl = MUX_v_8_2_2((pix_buf1_lpi_3[15:8]), (pix_buf1_lpi_3[23:16]),
      HCOL_HCOL_if_2_and_tmp);
  assign nl_dx_rsci_idat_17_9  = ({1'b1 , pix3_lpi_3_dfm_mx0}) + conv_u2s_8_9(~ HCOL_mux_2_nl)
      + 9'b000000001;
  assign not_29_nl = ~ HROW_y_or_cse;
  assign HROW_y_not_1_nl = ~ (fsm_output[0]);
  assign pix_buf1_and_1_nl = HCOL_stage_0_2 & (~ HCOL_if_slc_operator_10_false_acc_8_svs_1)
      & (~ HROW_y_or_cse);
  assign HROW_HROW_and_1_nl = (HROW_y_sva[8]) & (~ (fsm_output[1]));
  assign HROW_mux_2_nl = MUX_v_8_2_2((HROW_y_sva[7:0]), HCOL_x_9_2_sva, fsm_output[1]);
  assign nl_z_out = ({HROW_HROW_and_1_nl , HROW_mux_2_nl}) + 9'b000000001;
  assign z_out = nl_z_out[8:0];
  assign operator_8_false_11_operator_8_false_11_or_1_nl = (heightIn[8]) | (~ (fsm_output[2]));
  assign operator_8_false_11_operator_8_false_11_nor_1_nl = ~(HCOL_if_slc_operator_10_false_acc_8_svs_1
      | (fsm_output[2]));
  assign operator_8_false_11_and_2_nl = HCOL_if_slc_operator_10_false_acc_8_svs_1
      & (~ (fsm_output[2]));
  assign operator_8_false_11_operator_8_false_11_mux1h_1_nl = MUX1HOT_v_8_3_2((dat_in_rsci_idat_mxwt[15:8]),
      (pix_buf_lpi_3[15:8]), (heightIn[7:0]), {operator_8_false_11_operator_8_false_11_nor_1_nl
      , operator_8_false_11_and_2_nl , (fsm_output[2])});
  assign operator_8_false_11_or_1_nl = (fsm_output[2:1]!=2'b10);
  assign operator_8_false_11_not_6_nl = ~ (fsm_output[2]);
  assign operator_8_false_11_operator_8_false_11_nand_1_nl = ~(MUX_v_8_2_2(8'b00000000,
      pix3_lpi_3_dfm_mx0, operator_8_false_11_not_6_nl));
  assign nl_acc_1_nl = ({operator_8_false_11_operator_8_false_11_or_1_nl , operator_8_false_11_operator_8_false_11_mux1h_1_nl
      , operator_8_false_11_or_1_nl}) + ({(fsm_output[2]) , operator_8_false_11_operator_8_false_11_nand_1_nl
      , 1'b1});
  assign acc_1_nl = nl_acc_1_nl[9:0];
  assign z_out_1 = readslicef_10_9_1(acc_1_nl);

  function automatic [7:0] MUX1HOT_v_8_3_2;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [2:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | (input_1 & {8{sel[1]}});
    result = result | (input_2 & {8{sel[2]}});
    MUX1HOT_v_8_3_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [8:0] readslicef_10_9_1;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_10_9_1 = tmp[8:0];
  end
  endfunction


  function automatic [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_HorDer
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_HorDer (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  EdgeDetect_IP_EdgeDetect_HorDer_run EdgeDetect_IP_EdgeDetect_HorDer_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy)
    );
endmodule




//------> ../EdgeDetect_IP_EdgeDetect_VerDer.v1/rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2024.1/1091966 Production Release
//  HLS Date:       Wed Feb 14 09:07:18 PST 2024
// 
//  Generated by:   ee525201@ws41
//  Generated date: Fri Apr 12 23:23:39 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_7_80_80_64_5_gen
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_7_80_80_64_5_gen
    (
  en, q, we, d, adr, adr_d, d_d, en_d, we_d, q_d, port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d
);
  output en;
  input [63:0] q;
  output we;
  output [63:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [63:0] d_d;
  input en_d;
  input we_d;
  output [63:0] q_d;
  input port_0_rw_ram_ir_internal_RMASK_B_d;
  input port_0_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign q_d = q;
  assign we = (port_0_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_7_80_80_64_5_gen
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_7_80_80_64_5_gen
    (
  en, q, we, d, adr, adr_d, d_d, en_d, we_d, q_d, port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d
);
  output en;
  input [63:0] q;
  output we;
  output [63:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [63:0] d_d;
  input en_d;
  input we_d;
  output [63:0] q_d;
  input port_0_rw_ram_ir_internal_RMASK_B_d;
  input port_0_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign q_d = q;
  assign we = (port_0_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, VCOL_C_0_tr0, VROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input VCOL_C_0_tr0;
  input VROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    VCOL_C_0 = 2'd1,
    VROW_C_0 = 2'd2,
    main_C_1 = 2'd3;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_1
    case (state_var)
      VCOL_C_0 : begin
        fsm_output = 4'b0010;
        if ( VCOL_C_0_tr0 ) begin
          state_var_NS = VROW_C_0;
        end
        else begin
          state_var_NS = VCOL_C_0;
        end
      end
      VROW_C_0 : begin
        fsm_output = 4'b0100;
        if ( VROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = VCOL_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 4'b0001;
        state_var_NS = VCOL_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_staller
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_staller (
  run_wen, dat_in_rsci_wen_comp, dat_out_rsci_wen_comp, dy_rsci_wen_comp
);
  output run_wen;
  input dat_in_rsci_wen_comp;
  input dat_out_rsci_wen_comp;
  input dy_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dat_in_rsci_wen_comp & dat_out_rsci_wen_comp & dy_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp (
  line_buf0_rsci_en_d, run_wen, line_buf0_rsci_cgo, line_buf0_rsci_cgo_ir_unreg
);
  output line_buf0_rsci_en_d;
  input run_wen;
  input line_buf0_rsci_cgo;
  input line_buf0_rsci_cgo_ir_unreg;



  // Interconnect Declarations for Component Instantiations 
  assign line_buf0_rsci_en_d = run_wen & (line_buf0_rsci_cgo | line_buf0_rsci_cgo_ir_unreg);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp (
  clk, rst, arst_n, dy_rsci_oswt, dy_rsci_wen_comp, dy_rsci_biwt, dy_rsci_bdwt, dy_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dy_rsci_oswt;
  output dy_rsci_wen_comp;
  input dy_rsci_biwt;
  input dy_rsci_bdwt;
  output dy_rsci_bcwt;
  reg dy_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dy_rsci_wen_comp = (~ dy_rsci_oswt) | dy_rsci_biwt | dy_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dy_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dy_rsci_bcwt <= 1'b0;
    end
    else begin
      dy_rsci_bcwt <= ~((~(dy_rsci_bcwt | dy_rsci_biwt)) | dy_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl (
  run_wen, dy_rsci_oswt, dy_rsci_biwt, dy_rsci_bdwt, dy_rsci_bcwt, dy_rsci_irdy,
      dy_rsci_ivld_run_sct
);
  input run_wen;
  input dy_rsci_oswt;
  output dy_rsci_biwt;
  output dy_rsci_bdwt;
  input dy_rsci_bcwt;
  input dy_rsci_irdy;
  output dy_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dy_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_rsci_bdwt = dy_rsci_oswt & run_wen;
  assign dy_rsci_biwt = dy_rsci_ogwt & dy_rsci_irdy;
  assign dy_rsci_ogwt = dy_rsci_oswt & (~ dy_rsci_bcwt);
  assign dy_rsci_ivld_run_sct = dy_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl (
  run_wen, dat_in_rsci_iswt0, dat_in_rsci_irdy_run_sct
);
  input run_wen;
  input dat_in_rsci_iswt0;
  output dat_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_irdy_run_sct = dat_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci (
  clk, rst, arst_n, dy_rsc_dat, dy_rsc_vld, dy_rsc_rdy, run_wen, dy_rsci_oswt, dy_rsci_wen_comp,
      dy_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  input run_wen;
  input dy_rsci_oswt;
  output dy_rsci_wen_comp;
  input [35:0] dy_rsci_idat;


  // Interconnect Declarations
  wire dy_rsci_biwt;
  wire dy_rsci_bdwt;
  wire dy_rsci_bcwt;
  wire dy_rsci_irdy;
  wire dy_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd5),
  .width(32'sd36)) dy_rsci (
      .irdy(dy_rsci_irdy),
      .ivld(dy_rsci_ivld_run_sct),
      .idat(dy_rsci_idat),
      .rdy(dy_rsc_rdy),
      .vld(dy_rsc_vld),
      .dat(dy_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dy_rsci_oswt(dy_rsci_oswt),
      .dy_rsci_biwt(dy_rsci_biwt),
      .dy_rsci_bdwt(dy_rsci_bdwt),
      .dy_rsci_bcwt(dy_rsci_bcwt),
      .dy_rsci_irdy(dy_rsci_irdy),
      .dy_rsci_ivld_run_sct(dy_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_rsci_oswt(dy_rsci_oswt),
      .dy_rsci_wen_comp(dy_rsci_wen_comp),
      .dy_rsci_biwt(dy_rsci_biwt),
      .dy_rsci_bdwt(dy_rsci_bdwt),
      .dy_rsci_bcwt(dy_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [31:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd32)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(dat_out_rsci_idat),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci (
  dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, run_wen, dat_in_rsci_oswt, dat_in_rsci_wen_comp,
      dat_in_rsci_idat_mxwt
);
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dat_in_rsci_irdy_run_sct;
  wire dat_in_rsci_ivld;
  wire [33:0] dat_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd1),
  .width(32'sd34)) dat_in_rsci (
      .rdy(dat_in_rsc_rdy),
      .vld(dat_in_rsc_vld),
      .dat(dat_in_rsc_dat),
      .irdy(dat_in_rsci_irdy_run_sct),
      .ivld(dat_in_rsci_ivld),
      .idat(dat_in_rsci_idat)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_iswt0(dat_in_rsci_oswt),
      .dat_in_rsci_irdy_run_sct(dat_in_rsci_irdy_run_sct)
    );
  assign dat_in_rsci_idat_mxwt = dat_in_rsci_idat[33:2];
  assign dat_in_rsci_wen_comp = (~ dat_in_rsci_oswt) | dat_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_run
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_run (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsci_d_d, line_buf0_rsci_en_d, line_buf0_rsci_q_d, line_buf1_rsci_d_d,
      line_buf1_rsci_q_d, line_buf0_rsci_adr_d_pff, line_buf0_rsci_we_d_pff, line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output [63:0] line_buf0_rsci_d_d;
  output line_buf0_rsci_en_d;
  input [63:0] line_buf0_rsci_q_d;
  output [63:0] line_buf1_rsci_d_d;
  input [63:0] line_buf1_rsci_q_d;
  output [6:0] line_buf0_rsci_adr_d_pff;
  output line_buf0_rsci_we_d_pff;
  output line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff;


  // Interconnect Declarations
  wire run_wen;
  wire dat_in_rsci_wen_comp;
  wire [31:0] dat_in_rsci_idat_mxwt;
  wire dat_out_rsci_wen_comp;
  wire dy_rsci_wen_comp;
  reg [7:0] dat_out_rsci_idat_31_24;
  reg [7:0] dat_out_rsci_idat_23_16;
  reg [7:0] dat_out_rsci_idat_15_8;
  reg [7:0] dat_out_rsci_idat_7_0;
  reg [8:0] dy_rsci_idat_35_27;
  wire [9:0] nl_dy_rsci_idat_35_27;
  reg [8:0] dy_rsci_idat_26_18;
  wire [9:0] nl_dy_rsci_idat_26_18;
  reg [8:0] dy_rsci_idat_17_9;
  wire [9:0] nl_dy_rsci_idat_17_9;
  reg [8:0] dy_rsci_idat_8_0;
  wire [9:0] nl_dy_rsci_idat_8_0;
  reg [7:0] pix0_3_lpi_3_dfm;
  reg [7:0] pix0_2_lpi_3_dfm;
  reg [7:0] pix0_1_lpi_3_dfm;
  reg [7:0] pix0_0_lpi_3_dfm;
  wire [3:0] fsm_output;
  wire VROW_equal_tmp;
  wire VCOL_VCOL_if_6_and_tmp;
  wire or_dcpl;
  wire or_dcpl_3;
  wire or_dcpl_7;
  wire or_dcpl_10;
  wire or_dcpl_43;
  wire or_dcpl_48;
  wire and_dcpl_32;
  wire and_dcpl_33;
  wire and_dcpl_34;
  wire or_tmp_14;
  reg [8:0] VROW_y_sva;
  reg VCOL_nor_1_itm_2;
  wire [7:0] VCOL_x_9_2_sva_2;
  wire [8:0] nl_VCOL_x_9_2_sva_2;
  reg VCOL_stage_0_2;
  reg VCOL_stage_0_1;
  reg [7:0] VCOL_x_9_2_sva;
  reg VCOL_nor_1_itm_1;
  reg [8:0] VCOL_asn_13_itm_1;
  reg VCOL_x_slc_VCOL_x_9_2_0_9_itm_1;
  reg [8:0] VCOL_asn_13_itm;
  reg VCOL_stage_0_3;
  reg [8:0] VCOL_asn_13_itm_2;
  reg VCOL_land_lpi_3_dfm_1;
  reg VCOL_asn_23_itm_1;
  wire VCOL_if_5_and_cse;
  wire VCOL_if_5_and_4_cse;
  reg reg_dat_in_rsci_oswt_cse;
  reg reg_dat_out_rsci_oswt_cse;
  reg reg_line_buf0_rsci_cgo_cse;
  reg reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse;
  wire wrbuf0_pix_and_cse;
  wire nand_cse;
  reg [63:0] reg_line_buf1_rsci_d_d_cse;
  wire VCOL_VCOL_and_cse;
  wire pix0_or_2_cse;
  wire VCOL_if_and_cse;
  wire VCOL_if_and_1_cse;
  wire rdbuf0_pix_or_cse;
  wire [7:0] pix0_mux1h_6_rmff;
  wire [7:0] pix0_mux1h_4_rmff;
  wire [7:0] pix0_mux1h_2_rmff;
  wire [7:0] pix0_mux1h_rmff;
  wire [63:0] VCOL_if_2_mux1h_3_rmff;
  wire and_107_rmff;
  reg [7:0] wrbuf0_pix_31_24_lpi_4;
  reg [7:0] wrbuf0_pix_23_16_lpi_4;
  reg [7:0] wrbuf0_pix_15_8_lpi_4;
  reg [7:0] wrbuf0_pix_7_0_lpi_4;
  reg [7:0] pix0_1_lpi_3;
  reg [7:0] pix0_2_lpi_3;
  reg [7:0] pix0_0_lpi_3;
  reg [7:0] pix0_3_lpi_3;
  reg [7:0] VCOL_qelse_slc_rdbuf1_pix_39_32_itm_1;
  reg [55:0] rdbuf1_pix_lpi_3_63_8;
  wire [8:0] VROW_y_sva_mx0w1;
  wire [9:0] nl_VROW_y_sva_mx0w1;
  wire [7:0] VCOL_x_9_2_sva_mx1;
  wire [55:0] rdbuf1_pix_lpi_3_63_8_mx0;
  wire [7:0] pix0_1_lpi_3_dfm_2_mx0;
  wire [7:0] pix0_2_lpi_3_dfm_2_mx0;
  wire [7:0] pix0_0_lpi_3_dfm_2_mx0;
  wire [7:0] pix0_3_lpi_3_dfm_2_mx0;
  wire [7:0] VCOL_qr_7_lpi_3_dfm_mx0;
  wire VCOL_unequal_tmp_1;
  wire [7:0] VCOL_qr_4_lpi_3_dfm_mx0;
  wire [7:0] VCOL_qr_6_lpi_3_dfm_mx0;
  wire [7:0] VCOL_qr_5_lpi_3_dfm_mx0;
  wire [63:0] rdbuf0_pix_lpi_3_dfm_mx0;
  wire VCOL_and_9;
  wire VCOL_and_11;
  wire [23:0] rdbuf1_pix_lpi_3_dfm_63_8_mx0_55_32;
  wire [23:0] rdbuf1_pix_lpi_3_dfm_63_8_mx0_23_0;
  wire VROW_y_or_cse;
  wire VCOL_and_cse;
  wire VCOL_and_13_cse;
  wire pix0_and_13_cse;
  wire VCOL_if_6_equal_tmp;
  wire and_148_cse;
  wire operator_10_false_acc_itm_8_1;
  wire operator_9_false_acc_itm_9_1;

  wire[7:0] VCOL_VCOL_mux1h_3_nl;
  wire[7:0] VCOL_VCOL_mux1h_nl;
  wire[7:0] VCOL_VCOL_mux1h_2_nl;
  wire[7:0] VCOL_VCOL_mux1h_1_nl;
  wire VROW_y_not_2_nl;
  wire not_86_nl;
  wire[8:0] VROW_y_mux_nl;
  wire VCOL_nor_nl;
  wire mux_3_nl;
  wire or_123_nl;
  wire[7:0] operator_10_false_1_acc_nl;
  wire[8:0] nl_operator_10_false_1_acc_nl;
  wire[8:0] operator_10_false_acc_nl;
  wire[9:0] nl_operator_10_false_acc_nl;
  wire[9:0] operator_9_false_acc_nl;
  wire[10:0] nl_operator_9_false_acc_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst_dat_out_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst_dat_out_rsci_idat
      = {dat_out_rsci_idat_31_24 , dat_out_rsci_idat_23_16 , dat_out_rsci_idat_15_8
      , dat_out_rsci_idat_7_0};
  wire [35:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat = {dy_rsci_idat_35_27
      , dy_rsci_idat_26_18 , dy_rsci_idat_17_9 , dy_rsci_idat_8_0};
  wire  nl_EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst_VCOL_C_0_tr0;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst_VCOL_C_0_tr0 = ~(VCOL_stage_0_1
      | VCOL_stage_0_2 | VCOL_stage_0_3);
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci EdgeDetect_IP_EdgeDetect_VerDer_run_dat_in_rsci_inst
      (
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .run_wen(run_wen),
      .dat_in_rsci_oswt(reg_dat_in_rsci_oswt_cse),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dat_out_rsci_inst_dat_out_rsci_idat[31:0])
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .run_wen(run_wen),
      .dy_rsci_oswt(reg_dat_out_rsci_oswt_cse),
      .dy_rsci_wen_comp(dy_rsci_wen_comp),
      .dy_rsci_idat(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat[35:0])
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp EdgeDetect_IP_EdgeDetect_VerDer_run_wait_dp_inst
      (
      .line_buf0_rsci_en_d(line_buf0_rsci_en_d),
      .run_wen(run_wen),
      .line_buf0_rsci_cgo(reg_line_buf0_rsci_cgo_cse),
      .line_buf0_rsci_cgo_ir_unreg(and_107_rmff)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_staller EdgeDetect_IP_EdgeDetect_VerDer_run_staller_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dy_rsci_wen_comp(dy_rsci_wen_comp)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .VCOL_C_0_tr0(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_run_fsm_inst_VCOL_C_0_tr0),
      .VROW_C_0_tr0(VROW_equal_tmp)
    );
  assign VCOL_if_5_and_cse = run_wen & (fsm_output[1]) & (~((VCOL_asn_13_itm_2==9'b000000000)))
      & VCOL_stage_0_3;
  assign VCOL_if_5_and_4_cse = run_wen & ((or_dcpl_43 & VCOL_stage_0_3 & reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse
      & (fsm_output[1])) | or_tmp_14);
  assign VROW_y_or_cse = (fsm_output[0]) | (fsm_output[2]);
  assign VCOL_and_cse = run_wen & VCOL_stage_0_2;
  assign VCOL_and_13_cse = run_wen & VCOL_VCOL_and_cse;
  assign and_107_rmff = (VCOL_stage_0_2 | VCOL_stage_0_3) & (fsm_output[1]);
  assign pix0_mux1h_rmff = MUX1HOT_v_8_3_2(pix0_0_lpi_3_dfm_2_mx0, pix0_0_lpi_3,
      (dat_in_rsci_idat_mxwt[7:0]), {VCOL_if_and_cse , VCOL_if_and_1_cse , VCOL_land_lpi_3_dfm_1});
  assign and_148_cse = (VCOL_asn_23_itm_1 | (~ VCOL_stage_0_3) | VCOL_land_lpi_3_dfm_1
      | VROW_equal_tmp) & run_wen;
  assign pix0_mux1h_2_rmff = MUX1HOT_v_8_3_2(pix0_1_lpi_3_dfm_2_mx0, pix0_1_lpi_3,
      (dat_in_rsci_idat_mxwt[15:8]), {VCOL_if_and_cse , VCOL_if_and_1_cse , VCOL_land_lpi_3_dfm_1});
  assign pix0_mux1h_4_rmff = MUX1HOT_v_8_3_2(pix0_2_lpi_3_dfm_2_mx0, pix0_2_lpi_3,
      (dat_in_rsci_idat_mxwt[23:16]), {VCOL_if_and_cse , VCOL_if_and_1_cse , VCOL_land_lpi_3_dfm_1});
  assign pix0_mux1h_6_rmff = MUX1HOT_v_8_3_2(pix0_3_lpi_3_dfm_2_mx0, pix0_3_lpi_3,
      (dat_in_rsci_idat_mxwt[31:24]), {VCOL_if_and_cse , VCOL_if_and_1_cse , VCOL_land_lpi_3_dfm_1});
  assign rdbuf0_pix_or_cse = reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse | or_dcpl_48;
  assign VCOL_if_2_mux1h_3_rmff = MUX_v_64_2_2(line_buf0_rsci_q_d, reg_line_buf1_rsci_d_d_cse,
      rdbuf0_pix_or_cse);
  assign pix0_or_2_cse = (VROW_equal_tmp & and_dcpl_32) | and_dcpl_34;
  assign pix0_and_13_cse = run_wen & (and_dcpl_32 | and_dcpl_34 | (and_dcpl_33 &
      (~ VROW_equal_tmp))) & (fsm_output[1]) & (~((~(or_dcpl | operator_9_false_acc_itm_9_1))
      | VCOL_stage_0_2));
  assign wrbuf0_pix_and_cse = run_wen & (~ (VCOL_x_9_2_sva[0]));
  assign VCOL_if_and_cse = ~(or_dcpl_48 | VCOL_land_lpi_3_dfm_1);
  assign VCOL_if_and_1_cse = or_dcpl_48 & (~ VCOL_land_lpi_3_dfm_1);
  assign nl_VROW_y_sva_mx0w1 = VROW_y_sva + 9'b000000001;
  assign VROW_y_sva_mx0w1 = nl_VROW_y_sva_mx0w1[8:0];
  assign nl_operator_10_false_1_acc_nl = (widthIn[9:2]) + 8'b11111111;
  assign operator_10_false_1_acc_nl = nl_operator_10_false_1_acc_nl[7:0];
  assign VCOL_if_6_equal_tmp = VCOL_x_9_2_sva == operator_10_false_1_acc_nl;
  assign VCOL_VCOL_if_6_and_tmp = VCOL_if_6_equal_tmp & (widthIn[1:0]==2'b00);
  assign VCOL_x_9_2_sva_mx1 = MUX_v_8_2_2(VCOL_x_9_2_sva, VCOL_x_9_2_sva_2, VCOL_stage_0_2);
  assign VCOL_VCOL_and_cse = VCOL_stage_0_1 & nand_cse;
  assign rdbuf1_pix_lpi_3_63_8_mx0 = MUX_v_56_2_2((line_buf1_rsci_q_d[63:8]), rdbuf1_pix_lpi_3_63_8,
      rdbuf0_pix_or_cse);
  assign pix0_1_lpi_3_dfm_2_mx0 = MUX_v_8_2_2(pix0_1_lpi_3_dfm, VCOL_qr_5_lpi_3_dfm_mx0,
      VROW_equal_tmp);
  assign pix0_2_lpi_3_dfm_2_mx0 = MUX_v_8_2_2(pix0_2_lpi_3_dfm, VCOL_qr_6_lpi_3_dfm_mx0,
      VROW_equal_tmp);
  assign pix0_0_lpi_3_dfm_2_mx0 = MUX_v_8_2_2(pix0_0_lpi_3_dfm, VCOL_qr_4_lpi_3_dfm_mx0,
      VROW_equal_tmp);
  assign pix0_3_lpi_3_dfm_2_mx0 = MUX_v_8_2_2(pix0_3_lpi_3_dfm, VCOL_qr_7_lpi_3_dfm_mx0,
      VROW_equal_tmp);
  assign VCOL_qr_7_lpi_3_dfm_mx0 = MUX_v_8_2_2((line_buf0_rsci_q_d[31:24]), (reg_line_buf1_rsci_d_d_cse[63:56]),
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign VCOL_unequal_tmp_1 = ~((VROW_y_sva[0]) & VCOL_nor_1_itm_2);
  assign rdbuf1_pix_lpi_3_dfm_63_8_mx0_55_32 = MUX_v_24_2_2((line_buf1_rsci_q_d[63:40]),
      (rdbuf1_pix_lpi_3_63_8[55:32]), reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign rdbuf1_pix_lpi_3_dfm_63_8_mx0_23_0 = MUX_v_24_2_2((line_buf1_rsci_q_d[31:8]),
      (rdbuf1_pix_lpi_3_63_8[23:0]), reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign VCOL_qr_4_lpi_3_dfm_mx0 = MUX_v_8_2_2((line_buf0_rsci_q_d[7:0]), (reg_line_buf1_rsci_d_d_cse[39:32]),
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign VCOL_qr_6_lpi_3_dfm_mx0 = MUX_v_8_2_2((line_buf0_rsci_q_d[23:16]), (reg_line_buf1_rsci_d_d_cse[55:48]),
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign VCOL_qr_5_lpi_3_dfm_mx0 = MUX_v_8_2_2((line_buf0_rsci_q_d[15:8]), (reg_line_buf1_rsci_d_d_cse[47:40]),
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign rdbuf0_pix_lpi_3_dfm_mx0 = MUX_v_64_2_2(line_buf0_rsci_q_d, reg_line_buf1_rsci_d_d_cse,
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse);
  assign nl_operator_10_false_acc_nl = ({1'b1 , (widthIn[9:2])}) + conv_u2u_8_9(~
      VCOL_x_9_2_sva_mx1);
  assign operator_10_false_acc_nl = nl_operator_10_false_acc_nl[8:0];
  assign operator_10_false_acc_itm_8_1 = readslicef_9_1_8(operator_10_false_acc_nl);
  assign nl_VCOL_x_9_2_sva_2 = VCOL_x_9_2_sva + 8'b00000001;
  assign VCOL_x_9_2_sva_2 = nl_VCOL_x_9_2_sva_2[7:0];
  assign VCOL_and_9 = (~ reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse) & VCOL_unequal_tmp_1;
  assign VCOL_and_11 = reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse & VCOL_unequal_tmp_1;
  assign VROW_equal_tmp = VROW_y_sva == heightIn;
  assign or_dcpl = (~ VCOL_stage_0_1) | operator_10_false_acc_itm_8_1;
  assign or_dcpl_3 = (VCOL_asn_13_itm_1[1:0]!=2'b00);
  assign or_dcpl_7 = (VCOL_asn_13_itm_1[4:3]!=2'b00);
  assign or_dcpl_10 = or_dcpl_7 | (VCOL_asn_13_itm_1[5]) | (VCOL_asn_13_itm_1[6])
      | (VCOL_asn_13_itm_1[7]) | (VCOL_asn_13_itm_1[8]) | (VCOL_asn_13_itm_1[2])
      | or_dcpl_3;
  assign nand_cse = ~(VCOL_VCOL_if_6_and_tmp & VCOL_stage_0_2);
  assign or_dcpl_43 = (VCOL_asn_13_itm_2!=9'b000000000);
  assign or_dcpl_48 = (~ VCOL_stage_0_3) | VCOL_asn_23_itm_1;
  assign and_dcpl_32 = VCOL_stage_0_1 & VCOL_stage_0_3 & (~ VCOL_asn_23_itm_1);
  assign and_dcpl_33 = (~ VCOL_stage_0_1) & VCOL_stage_0_3;
  assign and_dcpl_34 = and_dcpl_33 & VROW_equal_tmp;
  assign or_tmp_14 = or_dcpl_43 & VCOL_stage_0_3 & (~ reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse)
      & (fsm_output[1]);
  assign nl_operator_9_false_acc_nl = ({1'b1 , heightIn}) + conv_u2s_9_10(~ VROW_y_sva);
  assign operator_9_false_acc_nl = nl_operator_9_false_acc_nl[9:0];
  assign operator_9_false_acc_itm_9_1 = readslicef_10_1_9(operator_9_false_acc_nl);
  assign line_buf0_rsci_adr_d_pff = VCOL_x_9_2_sva[7:1];
  assign line_buf0_rsci_d_d = {pix0_mux1h_6_rmff , pix0_mux1h_4_rmff , pix0_mux1h_2_rmff
      , pix0_mux1h_rmff , wrbuf0_pix_31_24_lpi_4 , wrbuf0_pix_23_16_lpi_4 , wrbuf0_pix_15_8_lpi_4
      , wrbuf0_pix_7_0_lpi_4};
  assign line_buf0_rsci_we_d_pff = VCOL_stage_0_2 & VCOL_x_slc_VCOL_x_9_2_0_9_itm_1
      & (fsm_output[1]);
  assign line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff = VCOL_stage_0_2
      & (~ VCOL_x_slc_VCOL_x_9_2_0_9_itm_1) & (fsm_output[1]);
  assign line_buf1_rsci_d_d = VCOL_if_2_mux1h_3_rmff;
  always @(posedge clk) begin
    if ( VCOL_if_5_and_cse ) begin
      dy_rsci_idat_35_27 <= nl_dy_rsci_idat_35_27[8:0];
      dy_rsci_idat_8_0 <= nl_dy_rsci_idat_8_0[8:0];
      dy_rsci_idat_26_18 <= nl_dy_rsci_idat_26_18[8:0];
      dy_rsci_idat_17_9 <= nl_dy_rsci_idat_17_9[8:0];
    end
  end
  always @(posedge clk) begin
    if ( VCOL_if_5_and_4_cse ) begin
      dat_out_rsci_idat_31_24 <= MUX_v_8_2_2((rdbuf0_pix_lpi_3_dfm_mx0[63:56]), (rdbuf0_pix_lpi_3_dfm_mx0[31:24]),
          or_tmp_14);
      dat_out_rsci_idat_7_0 <= MUX_v_8_2_2((rdbuf0_pix_lpi_3_dfm_mx0[39:32]), (rdbuf0_pix_lpi_3_dfm_mx0[7:0]),
          or_tmp_14);
      dat_out_rsci_idat_23_16 <= MUX_v_8_2_2((rdbuf0_pix_lpi_3_dfm_mx0[55:48]), (rdbuf0_pix_lpi_3_dfm_mx0[23:16]),
          or_tmp_14);
      dat_out_rsci_idat_15_8 <= MUX_v_8_2_2((rdbuf0_pix_lpi_3_dfm_mx0[47:40]), (rdbuf0_pix_lpi_3_dfm_mx0[15:8]),
          or_tmp_14);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VROW_y_sva <= 9'b000000000;
    end
    else if ( rst ) begin
      VROW_y_sva <= 9'b000000000;
    end
    else if ( run_wen & VROW_y_or_cse ) begin
      VROW_y_sva <= MUX_v_9_2_2(9'b000000000, VROW_y_sva_mx0w1, VROW_y_not_2_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_asn_23_itm_1 <= 1'b0;
      VCOL_asn_13_itm_2 <= 9'b000000000;
    end
    else if ( rst ) begin
      VCOL_asn_23_itm_1 <= 1'b0;
      VCOL_asn_13_itm_2 <= 9'b000000000;
    end
    else if ( VCOL_and_cse ) begin
      VCOL_asn_23_itm_1 <= VCOL_VCOL_if_6_and_tmp;
      VCOL_asn_13_itm_2 <= VCOL_asn_13_itm_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( rst ) begin
      VCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( (VCOL_stage_0_2 | (fsm_output[2]) | (fsm_output[0])) & run_wen ) begin
      VCOL_x_9_2_sva <= MUX_v_8_2_2(8'b00000000, VCOL_x_9_2_sva_mx1, not_86_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_stage_0_1 <= 1'b0;
      VCOL_stage_0_2 <= 1'b0;
      VCOL_stage_0_3 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_line_buf0_rsci_cgo_cse <= 1'b0;
      VCOL_asn_13_itm <= 9'b000000000;
    end
    else if ( rst ) begin
      VCOL_stage_0_1 <= 1'b0;
      VCOL_stage_0_2 <= 1'b0;
      VCOL_stage_0_3 <= 1'b0;
      reg_dat_in_rsci_oswt_cse <= 1'b0;
      reg_dat_out_rsci_oswt_cse <= 1'b0;
      reg_line_buf0_rsci_cgo_cse <= 1'b0;
      VCOL_asn_13_itm <= 9'b000000000;
    end
    else if ( run_wen ) begin
      VCOL_stage_0_1 <= VCOL_VCOL_and_cse | VROW_y_or_cse;
      VCOL_stage_0_2 <= VCOL_VCOL_and_cse & (~ VROW_y_or_cse);
      VCOL_stage_0_3 <= VCOL_stage_0_2 & (~ VROW_y_or_cse);
      reg_dat_in_rsci_oswt_cse <= VCOL_stage_0_1 & (~ operator_10_false_acc_itm_8_1)
          & (~ operator_9_false_acc_itm_9_1) & nand_cse & (fsm_output[1]);
      reg_dat_out_rsci_oswt_cse <= or_dcpl_43 & VCOL_stage_0_3 & (fsm_output[1]);
      reg_line_buf0_rsci_cgo_cse <= and_107_rmff;
      VCOL_asn_13_itm <= MUX_v_9_2_2(9'b000000000, VROW_y_mux_nl, VCOL_nor_nl);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_asn_13_itm_1 <= 9'b000000000;
      VCOL_x_slc_VCOL_x_9_2_0_9_itm_1 <= 1'b0;
      VCOL_land_lpi_3_dfm_1 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_asn_13_itm_1 <= 9'b000000000;
      VCOL_x_slc_VCOL_x_9_2_0_9_itm_1 <= 1'b0;
      VCOL_land_lpi_3_dfm_1 <= 1'b0;
    end
    else if ( VCOL_and_13_cse ) begin
      VCOL_asn_13_itm_1 <= VCOL_asn_13_itm;
      VCOL_x_slc_VCOL_x_9_2_0_9_itm_1 <= VCOL_x_9_2_sva_mx1[0];
      VCOL_land_lpi_3_dfm_1 <= ~(operator_9_false_acc_itm_9_1 | operator_10_false_acc_itm_8_1);
    end
  end
  always @(posedge clk) begin
    if ( and_148_cse ) begin
      pix0_0_lpi_3_dfm <= pix0_mux1h_rmff;
      pix0_1_lpi_3_dfm <= pix0_mux1h_2_rmff;
      pix0_2_lpi_3_dfm <= pix0_mux1h_4_rmff;
      pix0_3_lpi_3_dfm <= pix0_mux1h_6_rmff;
    end
  end
  always @(posedge clk) begin
    if ( VCOL_stage_0_3 & (~ VCOL_asn_23_itm_1) & (~ reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse)
        & run_wen ) begin
      reg_line_buf1_rsci_d_d_cse <= VCOL_if_2_mux1h_3_rmff;
    end
  end
  always @(posedge clk) begin
    if ( pix0_and_13_cse ) begin
      pix0_3_lpi_3 <= MUX_v_8_2_2(pix0_3_lpi_3_dfm, VCOL_qr_7_lpi_3_dfm_mx0, pix0_or_2_cse);
      pix0_2_lpi_3 <= MUX_v_8_2_2(pix0_2_lpi_3_dfm, VCOL_qr_6_lpi_3_dfm_mx0, pix0_or_2_cse);
      pix0_1_lpi_3 <= MUX_v_8_2_2(pix0_1_lpi_3_dfm, VCOL_qr_5_lpi_3_dfm_mx0, pix0_or_2_cse);
      pix0_0_lpi_3 <= MUX_v_8_2_2(pix0_0_lpi_3_dfm, VCOL_qr_4_lpi_3_dfm_mx0, pix0_or_2_cse);
    end
  end
  always @(posedge clk) begin
    if ( run_wen & or_dcpl_10 & (~((VROW_y_sva[0]) & VCOL_nor_1_itm_1)) & (VCOL_x_9_2_sva[0])
        & VCOL_stage_0_2 ) begin
      VCOL_qelse_slc_rdbuf1_pix_39_32_itm_1 <= rdbuf1_pix_lpi_3_63_8_mx0[31:24];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse <= 1'b0;
    end
    else if ( rst ) begin
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse <= 1'b0;
    end
    else if ( run_wen & (or_dcpl_7 | (VCOL_asn_13_itm_1[5]) | (VCOL_asn_13_itm_1[6])
        | (VCOL_asn_13_itm_1[7]) | (VCOL_asn_13_itm_1[8]) | (VCOL_asn_13_itm_1[2])
        | or_dcpl_3 | or_dcpl | operator_9_false_acc_itm_9_1 | VCOL_VCOL_if_6_and_tmp
        | (VCOL_x_9_2_sva_2[0])) & VCOL_stage_0_2 ) begin
      reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse <= VCOL_x_9_2_sva[0];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_nor_1_itm_2 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_nor_1_itm_2 <= 1'b0;
    end
    else if ( run_wen & or_dcpl_10 & VCOL_stage_0_2 ) begin
      VCOL_nor_1_itm_2 <= VCOL_nor_1_itm_1;
    end
  end
  always @(posedge clk) begin
    if ( mux_3_nl & VCOL_stage_0_3 & (~ VCOL_asn_23_itm_1) & (~ reg_VCOL_x_slc_VCOL_x_9_2_0_12_itm_1_cse)
        & run_wen & (VCOL_x_9_2_sva[0]) ) begin
      rdbuf1_pix_lpi_3_63_8 <= rdbuf1_pix_lpi_3_63_8_mx0;
    end
  end
  always @(posedge clk) begin
    if ( wrbuf0_pix_and_cse ) begin
      wrbuf0_pix_31_24_lpi_4 <= pix0_mux1h_6_rmff;
      wrbuf0_pix_23_16_lpi_4 <= pix0_mux1h_4_rmff;
      wrbuf0_pix_15_8_lpi_4 <= pix0_mux1h_2_rmff;
      wrbuf0_pix_7_0_lpi_4 <= pix0_mux1h_rmff;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_nor_1_itm_1 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_nor_1_itm_1 <= 1'b0;
    end
    else if ( run_wen & ((VCOL_asn_13_itm!=9'b000000000)) & VCOL_VCOL_and_cse ) begin
      VCOL_nor_1_itm_1 <= ~((VROW_y_sva[8:1]!=8'b00000000));
    end
  end
  assign VCOL_VCOL_mux1h_3_nl = MUX1HOT_v_8_3_2(VCOL_qr_7_lpi_3_dfm_mx0, (rdbuf1_pix_lpi_3_dfm_63_8_mx0_23_0[23:16]),
      (rdbuf1_pix_lpi_3_dfm_63_8_mx0_55_32[23:16]), {(~ VCOL_unequal_tmp_1) , VCOL_and_9
      , VCOL_and_11});
  assign nl_dy_rsci_idat_35_27  = ({1'b1 , VCOL_VCOL_mux1h_3_nl}) + conv_u2s_8_9(~
      pix0_3_lpi_3_dfm_2_mx0) + 9'b000000001;
  assign VCOL_VCOL_mux1h_nl = MUX1HOT_v_8_3_2(VCOL_qr_4_lpi_3_dfm_mx0, (line_buf1_rsci_q_d[7:0]),
      VCOL_qelse_slc_rdbuf1_pix_39_32_itm_1, {(~ VCOL_unequal_tmp_1) , VCOL_and_9
      , VCOL_and_11});
  assign nl_dy_rsci_idat_8_0  = ({1'b1 , VCOL_VCOL_mux1h_nl}) + conv_u2s_8_9(~ pix0_0_lpi_3_dfm_2_mx0)
      + 9'b000000001;
  assign VCOL_VCOL_mux1h_2_nl = MUX1HOT_v_8_3_2(VCOL_qr_6_lpi_3_dfm_mx0, (rdbuf1_pix_lpi_3_dfm_63_8_mx0_23_0[15:8]),
      (rdbuf1_pix_lpi_3_dfm_63_8_mx0_55_32[15:8]), {(~ VCOL_unequal_tmp_1) , VCOL_and_9
      , VCOL_and_11});
  assign nl_dy_rsci_idat_26_18  = ({1'b1 , VCOL_VCOL_mux1h_2_nl}) + conv_u2s_8_9(~
      pix0_2_lpi_3_dfm_2_mx0) + 9'b000000001;
  assign VCOL_VCOL_mux1h_1_nl = MUX1HOT_v_8_3_2(VCOL_qr_5_lpi_3_dfm_mx0, (rdbuf1_pix_lpi_3_dfm_63_8_mx0_23_0[7:0]),
      (rdbuf1_pix_lpi_3_dfm_63_8_mx0_55_32[7:0]), {(~ VCOL_unequal_tmp_1) , VCOL_and_9
      , VCOL_and_11});
  assign nl_dy_rsci_idat_17_9  = ({1'b1 , VCOL_VCOL_mux1h_1_nl}) + conv_u2s_8_9(~
      pix0_1_lpi_3_dfm_2_mx0) + 9'b000000001;
  assign VROW_y_not_2_nl = ~ (fsm_output[0]);
  assign not_86_nl = ~ VROW_y_or_cse;
  assign VROW_y_mux_nl = MUX_v_9_2_2(VROW_y_sva, VROW_y_sva_mx0w1, fsm_output[2]);
  assign VCOL_nor_nl = ~((fsm_output[0]) | (fsm_output[3]));
  assign or_123_nl = (((~ VCOL_if_6_equal_tmp) | (widthIn[1:0]!=2'b00)) & (VCOL_x_9_2_sva_2[0]))
      | (~(((VROW_y_sva[0]) & VCOL_nor_1_itm_1) | (~((VCOL_asn_13_itm_1!=9'b000000000)))));
  assign mux_3_nl = MUX_s_1_2_2(VCOL_stage_0_1, or_123_nl, VCOL_stage_0_2);

  function automatic [7:0] MUX1HOT_v_8_3_2;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [2:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | (input_1 & {8{sel[1]}});
    result = result | (input_2 & {8{sel[2]}});
    MUX1HOT_v_8_3_2 = result;
  end
  endfunction


  function automatic  MUX_s_1_2_2;
    input  input_0;
    input  input_1;
    input  sel;
    reg  result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [23:0] MUX_v_24_2_2;
    input [23:0] input_0;
    input [23:0] input_1;
    input  sel;
    reg [23:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_24_2_2 = result;
  end
  endfunction


  function automatic [55:0] MUX_v_56_2_2;
    input [55:0] input_0;
    input [55:0] input_1;
    input  sel;
    reg [55:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_56_2_2 = result;
  end
  endfunction


  function automatic [63:0] MUX_v_64_2_2;
    input [63:0] input_0;
    input [63:0] input_1;
    input  sel;
    reg [63:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_64_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_10 =  {1'b0, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer_struct
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer_struct (
  clk, rst, arst_n, dat_in_rsc_dat_pix, dat_in_rsc_dat_eol, dat_in_rsc_dat_sof, dat_in_rsc_vld,
      dat_in_rsc_rdy, widthIn, heightIn, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy,
      dy_rsc_dat, dy_rsc_vld, dy_rsc_rdy, line_buf0_rsc_en, line_buf0_rsc_q, line_buf0_rsc_we,
      line_buf0_rsc_d, line_buf0_rsc_adr, line_buf1_rsc_en, line_buf1_rsc_q, line_buf1_rsc_we,
      line_buf1_rsc_d, line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] dat_in_rsc_dat_pix;
  input dat_in_rsc_dat_eol;
  input dat_in_rsc_dat_sof;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire [63:0] line_buf0_rsci_d_d;
  wire line_buf0_rsci_en_d;
  wire [63:0] line_buf0_rsci_q_d;
  wire [63:0] line_buf1_rsci_d_d;
  wire [63:0] line_buf1_rsci_q_d;
  wire [6:0] line_buf0_rsci_adr_d_iff;
  wire line_buf0_rsci_we_d_iff;
  wire line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff;


  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_run_inst_dat_in_rsc_dat;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_run_inst_dat_in_rsc_dat = {dat_in_rsc_dat_pix
      , dat_in_rsc_dat_eol , dat_in_rsc_dat_sof};
  EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_7_80_80_64_5_gen
      line_buf0_rsci (
      .en(line_buf0_rsc_en),
      .q(line_buf0_rsc_q),
      .we(line_buf0_rsc_we),
      .d(line_buf0_rsc_d),
      .adr(line_buf0_rsc_adr),
      .adr_d(line_buf0_rsci_adr_d_iff),
      .d_d(line_buf0_rsci_d_d),
      .en_d(line_buf0_rsci_en_d),
      .we_d(line_buf0_rsci_we_d_iff),
      .q_d(line_buf0_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff),
      .port_0_rw_ram_ir_internal_WMASK_B_d(line_buf0_rsci_we_d_iff)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_7_80_80_64_5_gen
      line_buf1_rsci (
      .en(line_buf1_rsc_en),
      .q(line_buf1_rsc_q),
      .we(line_buf1_rsc_we),
      .d(line_buf1_rsc_d),
      .adr(line_buf1_rsc_adr),
      .adr_d(line_buf0_rsci_adr_d_iff),
      .d_d(line_buf1_rsci_d_d),
      .en_d(line_buf0_rsci_en_d),
      .we_d(line_buf0_rsci_we_d_iff),
      .q_d(line_buf1_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff),
      .port_0_rw_ram_ir_internal_WMASK_B_d(line_buf0_rsci_we_d_iff)
    );
  EdgeDetect_IP_EdgeDetect_VerDer_run EdgeDetect_IP_EdgeDetect_VerDer_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(nl_EdgeDetect_IP_EdgeDetect_VerDer_run_inst_dat_in_rsc_dat[33:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .line_buf0_rsci_d_d(line_buf0_rsci_d_d),
      .line_buf0_rsci_en_d(line_buf0_rsci_en_d),
      .line_buf0_rsci_q_d(line_buf0_rsci_q_d),
      .line_buf1_rsci_d_d(line_buf1_rsci_d_d),
      .line_buf1_rsci_q_d(line_buf1_rsci_q_d),
      .line_buf0_rsci_adr_d_pff(line_buf0_rsci_adr_d_iff),
      .line_buf0_rsci_we_d_pff(line_buf0_rsci_we_d_iff),
      .line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_VerDer
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_VerDer (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsc_en, line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d,
      line_buf0_rsc_adr, line_buf1_rsc_en, line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d,
      line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;



  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_pix;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_pix = dat_in_rsc_dat[33:2];
  wire  nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_eol;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_eol = dat_in_rsc_dat[1];
  wire  nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_sof;
  assign nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_sof = dat_in_rsc_dat[0];
  EdgeDetect_IP_EdgeDetect_VerDer_struct EdgeDetect_IP_EdgeDetect_VerDer_struct_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat_pix(nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_pix[31:0]),
      .dat_in_rsc_dat_eol(nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_eol),
      .dat_in_rsc_dat_sof(nl_EdgeDetect_IP_EdgeDetect_VerDer_struct_inst_dat_in_rsc_dat_sof),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .line_buf0_rsc_en(line_buf0_rsc_en),
      .line_buf0_rsc_q(line_buf0_rsc_q),
      .line_buf0_rsc_we(line_buf0_rsc_we),
      .line_buf0_rsc_d(line_buf0_rsc_d),
      .line_buf0_rsc_adr(line_buf0_rsc_adr),
      .line_buf1_rsc_en(line_buf1_rsc_en),
      .line_buf1_rsc_q(line_buf1_rsc_q),
      .line_buf1_rsc_we(line_buf1_rsc_we),
      .line_buf1_rsc_d(line_buf1_rsc_d),
      .line_buf1_rsc_adr(line_buf1_rsc_adr)
    );
endmodule




//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_genreg_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_genreg_v1 (clk, en, arst, srst, d, z);
    parameter integer width   = 1;
    parameter integer ph_clk  = 1;
    parameter integer ph_en   = 1;
    parameter integer ph_arst = 0;
    parameter integer ph_srst = 1;
    parameter         has_en  = 1'b1;

    input clk;
    input en;
    input arst;
    input srst;
    input      [width-1:0] d;
    output reg [width-1:0] z;

    //  Generate parameters
    //  ph_clk | ph_arst | has_en     Label:
    //    1        1          1       GEN_CLK1_ARST1_EN1
    //    1        1          0       GEN_CLK1_ARST1_EN0
    //    1        0          1       GEN_CLK1_ARST0_EN1
    //    1        0          0       GEN_CLK1_ARST0_EN0
    //    0        1          1       GEN_CLK0_ARST1_EN1
    //    0        1          0       GEN_CLK0_ARST1_EN0
    //    0        0          1       GEN_CLK0_ARST0_EN1
    //    0        0          0       GEN_CLK0_ARST0_EN0
    
    generate 
      // Pos edge clock, pos edge async reset, has enable
      if (ph_clk == 1 & ph_arst == 1 & has_en == 1)
      begin: GEN_CLK1_ARST1_EN1
        always @(posedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK1_ARST1_EN1

      // Pos edge clock, pos edge async reset, no enable
      else if (ph_clk == 1 & ph_arst == 1 & has_en == 0)
      begin: GEN_CLK1_ARST1_EN0
        always @(posedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK1_ARST1_EN0

      // Pos edge clock, neg edge async reset, has enable
      else if (ph_clk == 1 & ph_arst == 0 & has_en == 1)
      begin: GEN_CLK1_ARST0_EN1
        always @(posedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK1_ARST0_EN1

      // Pos edge clock, neg edge async reset, no enable
      else if (ph_clk == 1 & ph_arst == 0 & has_en == 0)
      begin: GEN_CLK1_ARST0_EN0
        always @(posedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK1_ARST0_EN0


      // Neg edge clock, pos edge async reset, has enable
      if (ph_clk == 0 & ph_arst == 1 & has_en == 1)
      begin: GEN_CLK0_ARST1_EN1
        always @(negedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK0_ARST1_EN1

      // Neg edge clock, pos edge async reset, no enable
      else if (ph_clk == 0 & ph_arst == 1 & has_en == 0)
      begin: GEN_CLK0_ARST1_EN0
        always @(negedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK0_ARST1_EN0

      // Neg edge clock, neg edge async reset, has enable
      else if (ph_clk == 0 & ph_arst == 0 & has_en == 1)
      begin: GEN_CLK0_ARST0_EN1
        always @(negedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK0_ARST0_EN1

      // Neg edge clock, neg edge async reset, no enable
      else if (ph_clk == 0 & ph_arst == 0 & has_en == 0)
      begin: GEN_CLK0_ARST0_EN0
        always @(negedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK0_ARST0_EN0
    endgenerate
endmodule


//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_fifo_wait_core_v5.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

/*
 *            _________________________________________________
 * WRITER    |                                                 |   READER
 *           |               ccs_fifo_wait_core                |
 *           |             _____________________               |
 *        --<|  din_rdy --<|  ---------------- <|--- dout_rdy <|---
 *           |             |       FIFO         |              |
 *        ---|> din_vld ---|> ----------------  |>-- dout_vld  |>--
 *        ---|>     din ---|> ----------------  |>-- dout      |>--
 *           |             |____________________|              |
 *           |_________________________________________________|
 *
 *    rdy    - can be considered as a notFULL signal
 *    vld    - can be considered as a notEMPTY signal
 *    is_idle - clk can be safely gated
 *
 * Change History:
 *    2019-01-24 - Add assertion to verify rdy signal behavior under reset.
 *                 Fix bug in that behavior.
 */

module ccs_fifo_wait_core_v5 (clk, en, arst, srst, din_vld, din_rdy, din, dout_vld, dout_rdy, dout, sd, is_idle);

    parameter integer rscid    = 0;     // resource ID
    parameter integer width    = 8;     // fifo width
    parameter integer sz_width = 8;     // size of port for elements in fifo
    parameter integer fifo_sz  = 8;     // fifo depth
    parameter integer ph_clk   = 1;     // clock polarity 1=rising edge, 0=falling edge
    parameter integer ph_en    = 1;     // clock enable polarity
    parameter integer ph_arst  = 1;     // async reset polarity
    parameter integer ph_srst  = 1;     // sync reset polarity
    parameter integer ph_log2  = 3;     // log2(fifo_sz)

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 din_vld;    // writer has valid data
    output                din_rdy;    // fifo ready for data (not full)
    input  [width-1:0]    din;
    output                dout_vld;   // fifo has valid data (not empty)
    input                 dout_rdy;   // reader ready for data
    output [width-1:0]    dout;
    output [sz_width-1:0] sd;
    output                is_idle;

    localparam integer fifo_b  = width * fifo_sz;
    localparam integer fifo_mx = (fifo_sz > 0) ? (fifo_sz-1) : 0 ;
    localparam integer fifo_mx_over_8 = fifo_mx / 8 ;

    reg      [fifo_mx:0] stat_pre;
    wire     [fifo_mx:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [fifo_mx:0] en_l;
    reg      [fifo_mx_over_8:0] en_l_s;

    reg      [width-1:0] buff_nxt;

    reg                  stat_nxt;
    reg                  stat_behind;
    reg                  stat_ahead;
    reg                  stat_tail;
    reg                  en_l_var;

    integer              i;
    genvar               eni;

    wire [32:0]          size_t;
    reg  [31:0]          count;
    reg  [31:0]          count_t;
    reg  [32:0]          n_elem;
    wire                 din_rdy_drv;
    wire                 dout_vld_drv;
    wire                 din_vld_int;
    wire                 hs_init;
    wire                 active;
    wire                 is_idle_drv;

    // synopsys translate_off
    reg  [31:0]          peak;
    initial
    begin
      peak  = 32'b0;
    end
    // synopsys translate_on

    assign din_rdy = din_rdy_drv;
    assign dout_vld = dout_vld_drv;
    assign is_idle = is_idle_drv;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign din_vld_int = din_vld & hs_init;
      assign din_rdy_drv = (dout_rdy | (~stat[0])) & hs_init;
      assign dout_vld_drv = din_vld_int | stat[fifo_sz-1];

      assign active = (din_vld_int & din_rdy_drv) | (dout_rdy & dout_vld_drv);
      assign is_idle_drv = (~active) & hs_init;

      assign size_t = (count - {31'b0, (dout_rdy & stat[fifo_sz-1])}) + {31'b0, din_vld_int};
      assign sd = size_t[sz_width-1:0];

      assign dout = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : din;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          stat_behind = (i != 0) ? stat[i-1] : 1'b0;
          stat_ahead  = (i != (fifo_sz-1)) ? stat[i+1] : 1'b1;

          // Determine if this buffer element will have data
          stat_nxt = stat_ahead &                       // valid element ahead of this one (or head)
                       (stat_behind                     // valid element behind this one
                         | (stat[i] & (~dout_rdy))      // valid element and output not ready (in use and not shifted)
                         | (stat[i] & din_vld_int)      // valid element and input has data
                         | (din_vld_int & (~dout_rdy))  // input has data and output not ready
                       );
          stat_pre[i] = stat_nxt;

          // First empty elem when not shifting or last valid elem after shifting (assumes stat_behind == 0)
          stat_tail = stat_ahead & (((~stat[i]) & (~dout_rdy)) | (stat[i] & dout_rdy));

          if (dout_rdy & stat_behind)
          begin
            // shift valid element
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
            en_l_var = 1'b1;
          end
          else if (din_vld_int & stat_tail)
          begin
            // update tail with input data
            buff_nxt = din;
            en_l_var = 1'b1;
          end
          else
          begin
            // no-op, disable register
            buff_nxt = din; // Don't care input to disabled flop
            en_l_var = 1'b0;
          end
          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          if ((stat_ahead == 1'b1) & (stat[i] == 1'b0))
            //found tail, update the number of elements for count
            n_elem = ($unsigned(fifo_sz) - 1) - $unsigned(i);
        end //for loop

        // Enable for stat registers (partitioned into banks of eight)
        // Take care of the head first
        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = en & active;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = en | ~active;

        // Now every eight
        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if (($unsigned(i) % 32'd8) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]) & (active);
            else
              en_l_s[(i/8)-1] = (en) | (~stat[i]) | (~active);
          end
        end

        // Update count and peak
        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = fifo_sz;
        else
          count_t = n_elem[31:0];
        count = count_t;
        // synopsys translate_off
        peak = (peak < count) ? count : peak;
        // synopsys translate_on
      end //FIFOPROC

      // Handshake valid after reset
      ccs_genreg_v1
      #(
        .width   (1),
        .ph_clk  (ph_clk),
        .ph_en   (1),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .has_en  (1'b0)
      )
      HS_INIT_REG
      (
        .clk     (clk),
        .en      (1'b1),
        .arst    (arst),
        .srst    (srst),
        .d       (1'b1),
        .z       (hs_init)
      );

      // Buffer and status registers
      for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
      begin: GEN_REGS
        ccs_genreg_v1
        #(
          .width   (1),
          .ph_clk  (ph_clk),
          .ph_en   (ph_en),
          .ph_arst (ph_arst),
          .ph_srst (ph_srst),
          .has_en  (1'b1)
        )
        STATREG
        (
          .clk     (clk),
          .en      (en_l_s[eni/8]),
          .arst    (arst),
          .srst    (srst),
          .d       (stat_pre[eni]),
          .z       (stat[eni])
        );

        ccs_genreg_v1
        #(
          .width   (width),
          .ph_clk  (ph_clk),
          .ph_en   (ph_en),
          .ph_arst (ph_arst),
          .ph_srst (ph_srst),
          .has_en  (1'b1)
        )
        BUFREG
        (
          .clk     (clk),
          .en      (en_l[eni]),
          .arst    (arst),
          .srst    (srst),
          .d       (buff_pre[width*eni+:width]),
          .z       (buff[width*eni+:width])
        );
      end

    end
    else
    begin: FEED_THRU
      assign din_rdy_drv  = dout_rdy;
      assign dout_vld_drv = din_vld;
      assign dout     = din;
      // non-blocking is not II=1 when fifo_sz=0
      assign sd = {{(sz_width-1){1'b0}}, (din_vld & ~dout_rdy)};
      assign is_idle_drv = ~(din_vld & dout_rdy);
    end
    endgenerate

`ifdef RDY_ASRT
    generate
    if (ph_clk==1)
    begin: POS_CLK_ASSERT

       property rdyAsrt ;
         @(posedge clk) (srst==ph_srst) |=> (din_rdy==0);
       endproperty
       a1Pos: assert property(rdyAsrt);

       property rdyAsrtASync ;
         @(posedge clk) (arst==ph_arst) |-> (din_rdy==0);
       endproperty
       a2Pos: assert property(rdyAsrtASync);

    end else if (ph_clk==0)
    begin: NEG_CLK_ASSERT

       property rdyAsrt ;
         @(negedge clk) ((srst==ph_srst) || (arst==ph_arst)) |=> (din_rdy==0);
       endproperty
       a1Neg: assert property(rdyAsrt);

       property rdyAsrtASync ;
         @(negedge clk) (arst==ph_arst) |-> (din_rdy==0);
       endproperty
       a2Neg: assert property(rdyAsrtASync);

    end
    endgenerate
`endif

endmodule

//------> /usr/cadtool/mentor/Catapult/2024.1/Mgc_home/pkgs/siflibs/ccs_pipe_v6.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------
/*
 *
 *            _______________________________________________
 * WRITER    |                                              |          READER
 *           |                 ccs_pipe                     |
 *           |            ______________________            |
 *        --<| din_rdy --<|  ---------------- <|---dout_rdy<|---
 *           |            |       FIFO         |            |
 *        ---|>din_vld ---|> ----------------  |>--dout_vld |>--
 *        ---|>din -------|> ----------------  |> -----dout |>--
 *           |            |____________________|            |
 *           |______________________________________________|
 *
 *    din_rdy     - can be considered as a notFULL signal
 *    dout_vld    - can be considered as a notEMPTY signal
 *    write_stall - an internal debug signal formed from din_vld & !din_rdy
 *    read_stall  - an internal debug signal formed from dout_rdy & !dout_vld
 *    is_idle     - indicates the clock can be safely gated
 *    stall_ctrl  - Stall the pipe(fifo).  Used by STALL_FLAG_SV directive
 */

module ccs_pipe_v6 (clk, en, arst, srst, din_rdy, din_vld, din, dout_rdy, dout_vld, dout, 
                    sz, sz_req, is_idle);

    parameter integer rscid    = 0; // resource ID
    parameter integer width    = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz  = 8; // fifo depth
    parameter integer log2_sz  = 3; // log2(fifo_sz)
    parameter integer ph_clk   = 1; // clock polarity 1=rising edge, 0=falling edge
    parameter integer ph_en    = 1; // clock enable polarity
    parameter integer ph_arst  = 1; // async reset polarity
    parameter integer ph_srst  = 1; // sync reset polarity

    // clock 
    input              clk;
    input              en;
    input              arst;
    input              srst;

    // writer
    output             din_rdy;
    input              din_vld;
    input  [width-1:0] din;

    // reader
    input              dout_rdy;
    output             dout_vld;
    output [width-1:0] dout;

    // size
    output [sz_width-1:0] sz;
    input                 sz_req;
    output                is_idle;

    localparam stallOff = 0; 
    wire                  stall_ctrl;
    assign stall_ctrl = stallOff;
   
    // synopsys translate_off
    wire   write_stall;
    wire   read_stall;
    assign write_stall = (din_vld & !din_rdy) | stall_ctrl;
    assign read_stall  = (dout_rdy & !dout_vld) | stall_ctrl;
    // synopsys translate_on

    wire    tmp_din_rdy;
    assign  din_rdy = tmp_din_rdy & !stall_ctrl;
    wire    tmp_dout_vld;
    assign  dout_vld = tmp_dout_vld & !stall_ctrl;
   
    ccs_fifo_wait_core_v5
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz)
    )
    FIFO
    (
        .clk      (clk),
        .en       (en),
        .arst     (arst),
        .srst     (srst),
        .din_vld  (din_vld & !stall_ctrl),
        .din_rdy  (tmp_din_rdy),
        .din      (din),
        .dout_vld (tmp_dout_vld),
        .dout_rdy (dout_rdy & !stall_ctrl),
        .dout     (dout),
        .sd       (sz),
        .is_idle  (is_idle)
    );

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2024.1/1091966 Production Release
//  HLS Date:       Wed Feb 14 09:07:18 PST 2024
// 
//  Generated by:   ee525201@ws41
//  Generated date: Fri Apr 12 23:25:16 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_IP_EdgeDetect_Top
// ------------------------------------------------------------------


module EdgeDetect_IP_EdgeDetect_Top (
  clk, rst, arst_n, widthIn, heightIn, sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz,
      crc32_dat_out_rsc_dat, crc32_dat_out_triosy_lz, dat_in_rsc_dat, dat_in_rsc_vld,
      dat_in_rsc_rdy, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, line_buf0_rsc_en,
      line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d, line_buf0_rsc_adr, line_buf1_rsc_en,
      line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d, line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire [31:0] dat_out_rsc_dat_n_VerDer_inst;
  wire [35:0] dy_rsc_dat_n_VerDer_inst;
  wire dy_rsc_rdy_n_VerDer_inst;
  wire line_buf0_rsc_en_n_VerDer_inst;
  wire [63:0] line_buf0_rsc_d_n_VerDer_inst;
  wire [6:0] line_buf0_rsc_adr_n_VerDer_inst;
  wire line_buf1_rsc_en_n_VerDer_inst;
  wire [63:0] line_buf1_rsc_d_n_VerDer_inst;
  wire [6:0] line_buf1_rsc_adr_n_VerDer_inst;
  wire [31:0] dat_out_rsc_dat_n_HorDer_inst;
  wire [35:0] dx_rsc_dat_n_HorDer_inst;
  wire [35:0] dy_in_rsc_dat_n_MagAng_inst;
  wire dy_in_rsc_vld_n_MagAng_inst;
  wire [31:0] crc32_pix_in_rsc_dat_n_MagAng_inst;
  wire [31:0] crc32_dat_out_rsc_dat_n_MagAng_inst;
  wire [33:0] dat_out_rsc_dat_n_MagAng_inst;
  wire dat_in_rsc_rdy_n_VerDer_inst_bud;
  wire dat_out_rsc_vld_n_VerDer_inst_bud;
  wire dat_in_rsc_rdy_n_HorDer_inst_bud;
  wire dy_rsc_vld_n_VerDer_inst_bud;
  wire dy_in_rsc_rdy_n_MagAng_inst_bud;
  wire line_buf0_rsc_we_n_VerDer_inst_bud;
  wire line_buf1_rsc_we_n_VerDer_inst_bud;
  wire dat_out_rsc_vld_n_HorDer_inst_bud;
  wire dat_in_rsc_rdy_n_MagAng_inst_bud;
  wire dx_rsc_vld_n_HorDer_inst_bud;
  wire dx_in_rsc_rdy_n_MagAng_inst_bud;
  wire dat_out_rsc_vld_n_MagAng_inst_bud;
  wire crc32_pix_in_triosy_lz_n_MagAng_inst_bud;
  wire crc32_dat_out_triosy_lz_n_MagAng_inst_bud;
  wire dy_chan_unc_1;
  wire dy_chan_idle;


  // Interconnect Declarations for Component Instantiations 
  ccs_pipe_v6 #(.rscid(32'sd35),
  .width(32'sd36),
  .sz_width(32'sd1),
  .fifo_sz(32'sd2),
  .log2_sz(32'sd1),
  .ph_clk(32'sd1),
  .ph_en(32'sd0),
  .ph_arst(32'sd0),
  .ph_srst(32'sd1)) dy_chan_cns_pipe (
      .clk(clk),
      .en(1'b0),
      .arst(arst_n),
      .srst(rst),
      .din_rdy(dy_rsc_rdy_n_VerDer_inst),
      .din_vld(dy_rsc_vld_n_VerDer_inst_bud),
      .din(dy_rsc_dat_n_VerDer_inst),
      .dout_rdy(dy_in_rsc_rdy_n_MagAng_inst_bud),
      .dout_vld(dy_in_rsc_vld_n_MagAng_inst),
      .dout(dy_in_rsc_dat_n_MagAng_inst),
      .sz(dy_chan_unc_1),
      .sz_req(1'b0),
      .is_idle(dy_chan_idle)
    );
  EdgeDetect_IP_EdgeDetect_VerDer VerDer_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy_n_VerDer_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_VerDer_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_VerDer_inst_bud),
      .dat_out_rsc_rdy(dat_in_rsc_rdy_n_HorDer_inst_bud),
      .dy_rsc_dat(dy_rsc_dat_n_VerDer_inst),
      .dy_rsc_vld(dy_rsc_vld_n_VerDer_inst_bud),
      .dy_rsc_rdy(dy_rsc_rdy_n_VerDer_inst),
      .line_buf0_rsc_en(line_buf0_rsc_en_n_VerDer_inst),
      .line_buf0_rsc_q(line_buf0_rsc_q),
      .line_buf0_rsc_we(line_buf0_rsc_we_n_VerDer_inst_bud),
      .line_buf0_rsc_d(line_buf0_rsc_d_n_VerDer_inst),
      .line_buf0_rsc_adr(line_buf0_rsc_adr_n_VerDer_inst),
      .line_buf1_rsc_en(line_buf1_rsc_en_n_VerDer_inst),
      .line_buf1_rsc_q(line_buf1_rsc_q),
      .line_buf1_rsc_we(line_buf1_rsc_we_n_VerDer_inst_bud),
      .line_buf1_rsc_d(line_buf1_rsc_d_n_VerDer_inst),
      .line_buf1_rsc_adr(line_buf1_rsc_adr_n_VerDer_inst)
    );
  EdgeDetect_IP_EdgeDetect_HorDer HorDer_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_out_rsc_dat_n_VerDer_inst),
      .dat_in_rsc_vld(dat_out_rsc_vld_n_VerDer_inst_bud),
      .dat_in_rsc_rdy(dat_in_rsc_rdy_n_HorDer_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_HorDer_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_HorDer_inst_bud),
      .dat_out_rsc_rdy(dat_in_rsc_rdy_n_MagAng_inst_bud),
      .dx_rsc_dat(dx_rsc_dat_n_HorDer_inst),
      .dx_rsc_vld(dx_rsc_vld_n_HorDer_inst_bud),
      .dx_rsc_rdy(dx_in_rsc_rdy_n_MagAng_inst_bud)
    );
  EdgeDetect_IP_EdgeDetect_MagAng MagAng_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_rsc_dat_n_HorDer_inst),
      .dx_in_rsc_vld(dx_rsc_vld_n_HorDer_inst_bud),
      .dx_in_rsc_rdy(dx_in_rsc_rdy_n_MagAng_inst_bud),
      .dy_in_rsc_dat(dy_in_rsc_dat_n_MagAng_inst),
      .dy_in_rsc_vld(dy_in_rsc_vld_n_MagAng_inst),
      .dy_in_rsc_rdy(dy_in_rsc_rdy_n_MagAng_inst_bud),
      .dat_in_rsc_dat(dat_out_rsc_dat_n_HorDer_inst),
      .dat_in_rsc_vld(dat_out_rsc_vld_n_HorDer_inst_bud),
      .dat_in_rsc_rdy(dat_in_rsc_rdy_n_MagAng_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .sw_in(sw_in),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat_n_MagAng_inst),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz_n_MagAng_inst_bud),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat_n_MagAng_inst),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz_n_MagAng_inst_bud),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_MagAng_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_MagAng_inst_bud),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_in_rsc_rdy = dat_in_rsc_rdy_n_VerDer_inst_bud;
  assign line_buf0_rsc_en = line_buf0_rsc_en_n_VerDer_inst;
  assign line_buf0_rsc_we = line_buf0_rsc_we_n_VerDer_inst_bud;
  assign line_buf0_rsc_d = line_buf0_rsc_d_n_VerDer_inst;
  assign line_buf0_rsc_adr = line_buf0_rsc_adr_n_VerDer_inst;
  assign line_buf1_rsc_en = line_buf1_rsc_en_n_VerDer_inst;
  assign line_buf1_rsc_we = line_buf1_rsc_we_n_VerDer_inst_bud;
  assign line_buf1_rsc_d = line_buf1_rsc_d_n_VerDer_inst;
  assign line_buf1_rsc_adr = line_buf1_rsc_adr_n_VerDer_inst;
  assign dat_out_rsc_vld = dat_out_rsc_vld_n_MagAng_inst_bud;
  assign dat_out_rsc_dat = dat_out_rsc_dat_n_MagAng_inst;
  assign crc32_pix_in_rsc_dat = crc32_pix_in_rsc_dat_n_MagAng_inst;
  assign crc32_pix_in_triosy_lz = crc32_pix_in_triosy_lz_n_MagAng_inst_bud;
  assign crc32_dat_out_rsc_dat = crc32_dat_out_rsc_dat_n_MagAng_inst;
  assign crc32_dat_out_triosy_lz = crc32_dat_out_triosy_lz_n_MagAng_inst_bud;
endmodule



