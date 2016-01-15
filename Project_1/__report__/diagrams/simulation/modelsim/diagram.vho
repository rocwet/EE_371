-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

-- DATE "01/14/2016 13:31:33"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	johnson_down IS
    PORT (
	Q_0 : OUT std_logic;
	RESET : IN std_logic;
	CLOCK : IN std_logic;
	Q_1 : OUT std_logic;
	Q_2 : OUT std_logic;
	Q_3 : OUT std_logic
	);
END johnson_down;

-- Design Ports Information
-- Q_0	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_1	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_2	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_3	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF johnson_down IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Q_0 : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_CLOCK : std_logic;
SIGNAL ww_Q_1 : std_logic;
SIGNAL ww_Q_2 : std_logic;
SIGNAL ww_Q_3 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
SIGNAL \CLOCK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \inst5~0_combout\ : std_logic;
SIGNAL \RESET~input_o\ : std_logic;
SIGNAL \inst5~DUPLICATE_q\ : std_logic;
SIGNAL \inst4~feeder_combout\ : std_logic;
SIGNAL \inst4~q\ : std_logic;
SIGNAL \inst3~feeder_combout\ : std_logic;
SIGNAL \inst3~DUPLICATE_q\ : std_logic;
SIGNAL \inst2~q\ : std_logic;
SIGNAL \inst3~q\ : std_logic;
SIGNAL \inst5~q\ : std_logic;
SIGNAL \ALT_INV_inst5~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_inst4~q\ : std_logic;
SIGNAL \ALT_INV_inst2~q\ : std_logic;

BEGIN

Q_0 <= ww_Q_0;
ww_RESET <= RESET;
ww_CLOCK <= CLOCK;
Q_1 <= ww_Q_1;
Q_2 <= ww_Q_2;
Q_3 <= ww_Q_3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_inst5~DUPLICATE_q\ <= NOT \inst5~DUPLICATE_q\;
\ALT_INV_inst4~q\ <= NOT \inst4~q\;
\ALT_INV_inst2~q\ <= NOT \inst2~q\;

-- Location: IOOBUF_X36_Y0_N19
\Q_0~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2~q\,
	devoe => ww_devoe,
	o => ww_Q_0);

-- Location: IOOBUF_X36_Y0_N53
\Q_1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3~q\,
	devoe => ww_devoe,
	o => ww_Q_1);

-- Location: IOOBUF_X36_Y0_N2
\Q_2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~q\,
	devoe => ww_devoe,
	o => ww_Q_2);

-- Location: IOOBUF_X38_Y0_N19
\Q_3~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5~q\,
	devoe => ww_devoe,
	o => ww_Q_3);

-- Location: IOIBUF_X89_Y35_N61
\CLOCK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

-- Location: CLKCTRL_G10
\CLOCK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK~input_o\,
	outclk => \CLOCK~inputCLKENA0_outclk\);

-- Location: LABCELL_X36_Y1_N24
\inst5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~0_combout\ = ( !\inst2~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_inst2~q\,
	combout => \inst5~0_combout\);

-- Location: IOIBUF_X36_Y0_N35
\RESET~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET,
	o => \RESET~input_o\);

-- Location: FF_X36_Y1_N26
\inst5~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \inst5~0_combout\,
	clrn => \RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5~DUPLICATE_q\);

-- Location: LABCELL_X36_Y1_N18
\inst4~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4~feeder_combout\ = ( \inst5~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_inst5~DUPLICATE_q\,
	combout => \inst4~feeder_combout\);

-- Location: FF_X36_Y1_N20
inst4 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \inst4~feeder_combout\,
	clrn => \RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4~q\);

-- Location: LABCELL_X36_Y1_N57
\inst3~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3~feeder_combout\ = ( \inst4~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_inst4~q\,
	combout => \inst3~feeder_combout\);

-- Location: FF_X36_Y1_N59
\inst3~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \inst3~feeder_combout\,
	clrn => \RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3~DUPLICATE_q\);

-- Location: FF_X36_Y1_N28
inst2 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	asdata => \inst3~DUPLICATE_q\,
	clrn => \RESET~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2~q\);

-- Location: FF_X36_Y1_N58
inst3 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \inst3~feeder_combout\,
	clrn => \RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3~q\);

-- Location: FF_X36_Y1_N25
inst5 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputCLKENA0_outclk\,
	d => \inst5~0_combout\,
	clrn => \RESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5~q\);

-- Location: LABCELL_X29_Y71_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


