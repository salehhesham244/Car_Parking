// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu Sep 14 13:49:30 2023
// Host        : SalehHesham running 64-bit major release  (build 9200)
// Command     : write_verilog -force Design.sv
// Design      : Design
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* IDLE = "3'b000" *) (* RIGHT_PASS = "3'b010" *) (* STOP = "3'b100" *) 
(* WAIT_PASS = "3'b001" *) (* WRONG_PASS = "3'b011" *) (* password = "10" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module Design
   (clk,
    arst,
    pass,
    sensor_entrance,
    sensor_exit,
    gate,
    LED_Green,
    LED_RED);
  input clk;
  input arst;
  input [3:0]pass;
  input sensor_entrance;
  input sensor_exit;
  output gate;
  output LED_Green;
  output LED_RED;

  wire \<const0> ;
  wire \<const1> ;
  wire GND_2;
  wire LED_Green;
  wire LED_Green_OBUF;
  wire LED_RED;
  wire LED_RED_OBUF;
  wire VCC_2;
  wire arst;
  wire arst_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [2:0]cs;
  wire \cs[0]_i_1_n_0 ;
  wire \cs[1]_i_1_n_0 ;
  wire \cs[2]_i_1_n_0 ;
  wire gate;
  wire [2:0]ns;
  wire \ns_reg[0]_i_1_n_0 ;
  wire \ns_reg[1]_i_1_n_0 ;
  wire \ns_reg[2]_i_1_n_0 ;
  wire \ns_reg[2]_i_2_n_0 ;
  wire \ns_reg[2]_i_3_n_0 ;
  wire [3:0]pass;
  wire [3:0]pass_IBUF;
  wire sensor_entrance;
  wire sensor_entrance_IBUF;
  wire sensor_exit;
  wire sensor_exit_IBUF;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  OBUF LED_Green_OBUF_inst
       (.I(LED_Green_OBUF),
        .O(LED_Green));
  OBUF LED_RED_OBUF_inst
       (.I(LED_RED_OBUF),
        .O(LED_RED));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h18)) 
    LED_RED_OBUF_inst_i_1
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .O(LED_RED_OBUF));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  IBUF arst_IBUF_inst
       (.I(arst),
        .O(arst_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT2 #(
    .INIT(4'h2)) 
    \cs[0]_i_1 
       (.I0(ns[0]),
        .I1(arst_IBUF),
        .O(\cs[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cs[1]_i_1 
       (.I0(ns[1]),
        .I1(arst_IBUF),
        .O(\cs[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cs[2]_i_1 
       (.I0(ns[2]),
        .I1(arst_IBUF),
        .O(\cs[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\cs[0]_i_1_n_0 ),
        .Q(cs[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\cs[1]_i_1_n_0 ),
        .Q(cs[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\cs[2]_i_1_n_0 ),
        .Q(cs[2]),
        .R(\<const0> ));
  OBUF gate_OBUF_inst
       (.I(LED_Green_OBUF),
        .O(gate));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    gate_OBUF_inst_i_1
       (.I0(arst_IBUF),
        .I1(cs[0]),
        .I2(cs[2]),
        .I3(cs[1]),
        .O(LED_Green_OBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ns_reg[0] 
       (.CLR(GND_2),
        .D(\ns_reg[0]_i_1_n_0 ),
        .G(\ns_reg[2]_i_2_n_0 ),
        .GE(VCC_2),
        .Q(ns[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2023)) 
    \ns_reg[0]_i_1 
       (.I0(\ns_reg[2]_i_3_n_0 ),
        .I1(cs[2]),
        .I2(cs[0]),
        .I3(cs[1]),
        .O(\ns_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ns_reg[1] 
       (.CLR(GND_2),
        .D(\ns_reg[1]_i_1_n_0 ),
        .G(\ns_reg[2]_i_2_n_0 ),
        .GE(VCC_2),
        .Q(ns[1]));
  LUT6 #(
    .INIT(64'h00FF00FF00770F00)) 
    \ns_reg[1]_i_1 
       (.I0(sensor_exit_IBUF),
        .I1(sensor_entrance_IBUF),
        .I2(\ns_reg[2]_i_3_n_0 ),
        .I3(cs[2]),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(\ns_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ns_reg[2] 
       (.CLR(GND_2),
        .D(\ns_reg[2]_i_1_n_0 ),
        .G(\ns_reg[2]_i_2_n_0 ),
        .GE(VCC_2),
        .Q(ns[2]));
  LUT6 #(
    .INIT(64'h0000000000C0AA00)) 
    \ns_reg[2]_i_1 
       (.I0(\ns_reg[2]_i_3_n_0 ),
        .I1(sensor_entrance_IBUF),
        .I2(sensor_exit_IBUF),
        .I3(cs[2]),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(\ns_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ns_reg[2]_i_2 
       (.I0(sensor_entrance_IBUF),
        .I1(cs[2]),
        .I2(cs[1]),
        .I3(cs[0]),
        .O(\ns_reg[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \ns_reg[2]_i_3 
       (.I0(pass_IBUF[1]),
        .I1(pass_IBUF[0]),
        .I2(pass_IBUF[3]),
        .I3(pass_IBUF[2]),
        .O(\ns_reg[2]_i_3_n_0 ));
  IBUF \pass_IBUF[0]_inst 
       (.I(pass[0]),
        .O(pass_IBUF[0]));
  IBUF \pass_IBUF[1]_inst 
       (.I(pass[1]),
        .O(pass_IBUF[1]));
  IBUF \pass_IBUF[2]_inst 
       (.I(pass[2]),
        .O(pass_IBUF[2]));
  IBUF \pass_IBUF[3]_inst 
       (.I(pass[3]),
        .O(pass_IBUF[3]));
  IBUF sensor_entrance_IBUF_inst
       (.I(sensor_entrance),
        .O(sensor_entrance_IBUF));
  IBUF sensor_exit_IBUF_inst
       (.I(sensor_exit),
        .O(sensor_exit_IBUF));
endmodule
