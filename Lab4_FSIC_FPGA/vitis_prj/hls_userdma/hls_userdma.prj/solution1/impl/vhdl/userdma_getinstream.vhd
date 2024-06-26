-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity userdma_getinstream is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    inStreamTop_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    inStreamTop_TVALID : IN STD_LOGIC;
    inStreamTop_TREADY : OUT STD_LOGIC;
    inStreamTop_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
    inStreamTop_TSTRB : IN STD_LOGIC_VECTOR (3 downto 0);
    inStreamTop_TUSER : IN STD_LOGIC_VECTOR (6 downto 0);
    inStreamTop_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    in_en_clrsts : IN STD_LOGIC_VECTOR (0 downto 0);
    in_s2m_len : IN STD_LOGIC_VECTOR (31 downto 0);
    s2m_err : OUT STD_LOGIC_VECTOR (0 downto 0);
    s2m_err_ap_vld : OUT STD_LOGIC;
    in_Img_width : IN STD_LOGIC_VECTOR (31 downto 0);
    inbuf_din : OUT STD_LOGIC_VECTOR (32 downto 0);
    inbuf_num_data_valid : IN STD_LOGIC_VECTOR (7 downto 0);
    inbuf_fifo_cap : IN STD_LOGIC_VECTOR (7 downto 0);
    inbuf_full_n : IN STD_LOGIC;
    inbuf_write : OUT STD_LOGIC;
    incount47_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    incount47_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    incount47_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    incount47_full_n : IN STD_LOGIC;
    incount47_write : OUT STD_LOGIC;
    s2m_len_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    s2m_len_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    s2m_len_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    s2m_len_c_full_n : IN STD_LOGIC;
    s2m_len_c_write : OUT STD_LOGIC;
    s2m_enb_clrsts_c_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    s2m_enb_clrsts_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    s2m_enb_clrsts_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    s2m_enb_clrsts_c_full_n : IN STD_LOGIC;
    s2m_enb_clrsts_c_write : OUT STD_LOGIC );
end;


architecture behav of userdma_getinstream is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv33_1FFFFFFFF : STD_LOGIC_VECTOR (32 downto 0) := "111111111111111111111111111111111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal in_len_V : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal s2m_len_c_blk_n : STD_LOGIC;
    signal s2m_enb_clrsts_c_blk_n : STD_LOGIC;
    signal in_en_clrsts_read_read_fu_102_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sub_i_i52_fu_162_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_i_i52_reg_277 : STD_LOGIC_VECTOR (32 downto 0);
    signal umax_fu_186_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal umax_reg_287 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln1065_fu_200_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_293 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_idle : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_ready : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_din : STD_LOGIC_VECTOR (32 downto 0);
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_write : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_din : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_write : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inStreamTop_TREADY : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_tmp_user_V_out : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_tmp_user_V_out_ap_vld : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_icmp_ln1065_out : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_icmp_ln1065_out_ap_vld : STD_LOGIC;
    signal grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call7 : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal s2m_err_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal or_ln61_fu_249_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal in_Img_width_cast_fu_158_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal add_ln48_fu_174_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_fu_180_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_216_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln1069_fu_224_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_236_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln1065_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln58_fu_244_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal regslice_both_inStreamTop_V_data_V_U_apdone_blk : STD_LOGIC;
    signal inStreamTop_TDATA_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal inStreamTop_TVALID_int_regslice : STD_LOGIC;
    signal inStreamTop_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_inStreamTop_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_inStreamTop_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal inStreamTop_TKEEP_int_regslice : STD_LOGIC_VECTOR (3 downto 0);
    signal regslice_both_inStreamTop_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_inStreamTop_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_inStreamTop_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal inStreamTop_TSTRB_int_regslice : STD_LOGIC_VECTOR (3 downto 0);
    signal regslice_both_inStreamTop_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_inStreamTop_V_strb_V_U_ack_in : STD_LOGIC;
    signal regslice_both_inStreamTop_V_user_V_U_apdone_blk : STD_LOGIC;
    signal inStreamTop_TUSER_int_regslice : STD_LOGIC_VECTOR (6 downto 0);
    signal regslice_both_inStreamTop_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_inStreamTop_V_user_V_U_ack_in : STD_LOGIC;
    signal regslice_both_inStreamTop_V_last_V_U_apdone_blk : STD_LOGIC;
    signal inStreamTop_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_inStreamTop_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_inStreamTop_V_last_V_U_ack_in : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component userdma_getinstream_Pipeline_VITIS_LOOP_48_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        inStreamTop_TVALID : IN STD_LOGIC;
        inbuf_din : OUT STD_LOGIC_VECTOR (32 downto 0);
        inbuf_num_data_valid : IN STD_LOGIC_VECTOR (7 downto 0);
        inbuf_fifo_cap : IN STD_LOGIC_VECTOR (7 downto 0);
        inbuf_full_n : IN STD_LOGIC;
        inbuf_write : OUT STD_LOGIC;
        incount47_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        incount47_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
        incount47_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
        incount47_full_n : IN STD_LOGIC;
        incount47_write : OUT STD_LOGIC;
        in_len_V_load : IN STD_LOGIC_VECTOR (31 downto 0);
        inStreamTop_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        inStreamTop_TREADY : OUT STD_LOGIC;
        inStreamTop_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
        inStreamTop_TSTRB : IN STD_LOGIC_VECTOR (3 downto 0);
        inStreamTop_TUSER : IN STD_LOGIC_VECTOR (6 downto 0);
        inStreamTop_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        sub_i_i52 : IN STD_LOGIC_VECTOR (32 downto 0);
        in_s2m_len : IN STD_LOGIC_VECTOR (31 downto 0);
        tmp_user_V_out : OUT STD_LOGIC_VECTOR (3 downto 0);
        tmp_user_V_out_ap_vld : OUT STD_LOGIC;
        icmp_ln1065_out : OUT STD_LOGIC_VECTOR (0 downto 0);
        icmp_ln1065_out_ap_vld : OUT STD_LOGIC );
    end component;


    component userdma_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132 : component userdma_getinstream_Pipeline_VITIS_LOOP_48_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start,
        ap_done => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done,
        ap_idle => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_idle,
        ap_ready => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_ready,
        inStreamTop_TVALID => inStreamTop_TVALID_int_regslice,
        inbuf_din => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_din,
        inbuf_num_data_valid => ap_const_lv8_0,
        inbuf_fifo_cap => ap_const_lv8_0,
        inbuf_full_n => inbuf_full_n,
        inbuf_write => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_write,
        incount47_din => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_din,
        incount47_num_data_valid => ap_const_lv4_0,
        incount47_fifo_cap => ap_const_lv4_0,
        incount47_full_n => incount47_full_n,
        incount47_write => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_write,
        in_len_V_load => in_len_V,
        inStreamTop_TDATA => inStreamTop_TDATA_int_regslice,
        inStreamTop_TREADY => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inStreamTop_TREADY,
        inStreamTop_TKEEP => inStreamTop_TKEEP_int_regslice,
        inStreamTop_TSTRB => inStreamTop_TSTRB_int_regslice,
        inStreamTop_TUSER => inStreamTop_TUSER_int_regslice,
        inStreamTop_TLAST => inStreamTop_TLAST_int_regslice,
        sub_i_i52 => sub_i_i52_reg_277,
        in_s2m_len => in_s2m_len,
        tmp_user_V_out => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_tmp_user_V_out,
        tmp_user_V_out_ap_vld => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_tmp_user_V_out_ap_vld,
        icmp_ln1065_out => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_icmp_ln1065_out,
        icmp_ln1065_out_ap_vld => grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_icmp_ln1065_out_ap_vld);

    regslice_both_inStreamTop_V_data_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inStreamTop_TDATA,
        vld_in => inStreamTop_TVALID,
        ack_in => regslice_both_inStreamTop_V_data_V_U_ack_in,
        data_out => inStreamTop_TDATA_int_regslice,
        vld_out => inStreamTop_TVALID_int_regslice,
        ack_out => inStreamTop_TREADY_int_regslice,
        apdone_blk => regslice_both_inStreamTop_V_data_V_U_apdone_blk);

    regslice_both_inStreamTop_V_keep_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 4)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inStreamTop_TKEEP,
        vld_in => inStreamTop_TVALID,
        ack_in => regslice_both_inStreamTop_V_keep_V_U_ack_in,
        data_out => inStreamTop_TKEEP_int_regslice,
        vld_out => regslice_both_inStreamTop_V_keep_V_U_vld_out,
        ack_out => inStreamTop_TREADY_int_regslice,
        apdone_blk => regslice_both_inStreamTop_V_keep_V_U_apdone_blk);

    regslice_both_inStreamTop_V_strb_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 4)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inStreamTop_TSTRB,
        vld_in => inStreamTop_TVALID,
        ack_in => regslice_both_inStreamTop_V_strb_V_U_ack_in,
        data_out => inStreamTop_TSTRB_int_regslice,
        vld_out => regslice_both_inStreamTop_V_strb_V_U_vld_out,
        ack_out => inStreamTop_TREADY_int_regslice,
        apdone_blk => regslice_both_inStreamTop_V_strb_V_U_apdone_blk);

    regslice_both_inStreamTop_V_user_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 7)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inStreamTop_TUSER,
        vld_in => inStreamTop_TVALID,
        ack_in => regslice_both_inStreamTop_V_user_V_U_ack_in,
        data_out => inStreamTop_TUSER_int_regslice,
        vld_out => regslice_both_inStreamTop_V_user_V_U_vld_out,
        ack_out => inStreamTop_TREADY_int_regslice,
        apdone_blk => regslice_both_inStreamTop_V_user_V_U_apdone_blk);

    regslice_both_inStreamTop_V_last_V_U : component userdma_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inStreamTop_TLAST,
        vld_in => inStreamTop_TVALID,
        ack_in => regslice_both_inStreamTop_V_last_V_U_ack_in,
        data_out => inStreamTop_TLAST_int_regslice,
        vld_out => regslice_both_inStreamTop_V_last_V_U_vld_out,
        ack_out => inStreamTop_TREADY_int_regslice,
        apdone_blk => regslice_both_inStreamTop_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start_reg <= ap_const_logic_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_ready = ap_const_logic_1)) then 
                    grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    s2m_err_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                s2m_err_preg <= ap_const_lv1_0;
            else
                if (((in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    s2m_err_preg <= or_ln61_fu_249_p2;
                elsif ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    s2m_err_preg <= ap_const_lv1_0;
                end if; 
            end if;
        end if;
    end process;


    in_len_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                in_len_V <= ap_const_lv32_0;
            elsif (((grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                in_len_V <= umax_reg_287;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                icmp_ln1065_reg_293 <= icmp_ln1065_fu_200_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                sub_i_i52_reg_277 <= sub_i_i52_fu_162_p2;
                umax_reg_287 <= umax_fu_186_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n, in_en_clrsts_read_read_fu_102_p2, ap_CS_fsm_state2, grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                elsif ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    add_ln48_fu_174_p2 <= std_logic_vector(unsigned(in_len_V) + unsigned(ap_const_lv32_1));
    and_ln1065_fu_230_p2 <= (xor_ln1069_fu_224_p2 and grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_icmp_ln1065_out);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n)
    begin
        if (((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done)
    begin
        if ((grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call7_assign_proc : process(ap_start, ap_done_reg, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n)
    begin
                ap_block_state1_ignore_call7 <= ((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_fu_180_p2 <= "1" when (unsigned(add_ln48_fu_174_p2) < unsigned(in_s2m_len)) else "0";
    grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_ap_start_reg;
    icmp_ln1065_fu_200_p2 <= "1" when (umax_reg_287 = ap_const_lv32_1) else "0";
    inStreamTop_TREADY <= regslice_both_inStreamTop_V_data_V_U_ack_in;

    inStreamTop_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_state2, grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inStreamTop_TREADY)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            inStreamTop_TREADY_int_regslice <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inStreamTop_TREADY;
        else 
            inStreamTop_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    in_Img_width_cast_fu_158_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(in_Img_width),33));
    in_en_clrsts_read_read_fu_102_p2 <= in_en_clrsts;
    inbuf_din <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_din;

    inbuf_write_assign_proc : process(ap_CS_fsm_state2, grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_write)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            inbuf_write <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_inbuf_write;
        else 
            inbuf_write <= ap_const_logic_0;
        end if; 
    end process;

    incount47_din <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_din;

    incount47_write_assign_proc : process(ap_CS_fsm_state2, grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_write)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            incount47_write <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_incount47_write;
        else 
            incount47_write <= ap_const_logic_0;
        end if; 
    end process;

    or_ln61_fu_249_p2 <= (xor_ln58_fu_244_p2 or and_ln1065_fu_230_p2);

    s2m_enb_clrsts_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, s2m_enb_clrsts_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s2m_enb_clrsts_c_blk_n <= s2m_enb_clrsts_c_full_n;
        else 
            s2m_enb_clrsts_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s2m_enb_clrsts_c_din <= in_en_clrsts;

    s2m_enb_clrsts_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s2m_enb_clrsts_c_write <= ap_const_logic_1;
        else 
            s2m_enb_clrsts_c_write <= ap_const_logic_0;
        end if; 
    end process;


    s2m_err_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n, in_en_clrsts_read_read_fu_102_p2, ap_CS_fsm_state3, s2m_err_preg, or_ln61_fu_249_p2)
    begin
        if (((in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            s2m_err <= or_ln61_fu_249_p2;
        elsif ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s2m_err <= ap_const_lv1_0;
        else 
            s2m_err <= s2m_err_preg;
        end if; 
    end process;


    s2m_err_ap_vld_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n, in_en_clrsts_read_read_fu_102_p2, ap_CS_fsm_state3)
    begin
        if ((((in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3)) or (not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (in_en_clrsts_read_read_fu_102_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            s2m_err_ap_vld <= ap_const_logic_1;
        else 
            s2m_err_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    s2m_len_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, s2m_len_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s2m_len_c_blk_n <= s2m_len_c_full_n;
        else 
            s2m_len_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s2m_len_c_din <= in_s2m_len;

    s2m_len_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, s2m_len_c_full_n, s2m_enb_clrsts_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (s2m_enb_clrsts_c_full_n = ap_const_logic_0) or (s2m_len_c_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s2m_len_c_write <= ap_const_logic_1;
        else 
            s2m_len_c_write <= ap_const_logic_0;
        end if; 
    end process;

    sub_i_i52_fu_162_p2 <= std_logic_vector(unsigned(in_Img_width_cast_fu_158_p1) + unsigned(ap_const_lv33_1FFFFFFFF));
    tmp_2_fu_236_p3 <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_tmp_user_V_out(2 downto 2);
    tmp_fu_216_p3 <= grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132_tmp_user_V_out(3 downto 3);
    umax_fu_186_p3 <= 
        in_s2m_len when (empty_fu_180_p2(0) = '1') else 
        add_ln48_fu_174_p2;
    xor_ln1069_fu_224_p2 <= (tmp_fu_216_p3 xor ap_const_lv1_1);
    xor_ln58_fu_244_p2 <= (tmp_2_fu_236_p3 xor icmp_ln1065_reg_293);
end behav;
