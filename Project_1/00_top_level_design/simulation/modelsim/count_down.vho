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
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Full Version"

-- DATE "01/08/2016 13:03:59"

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

ENTITY 	count_down IS
    PORT (
	\out\ : OUT std_logic_vector(3 DOWNTO 0);
	reset : IN std_logic;
	clk : IN std_logic
	);
END count_down;

-- Design Ports Information
-- out[0]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out[1]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out[2]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out[3]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF count_down IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \ww_out\ : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_reset : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \stage0|q~q\ : std_logic;
SIGNAL \stage0|q~0_combout\ : std_logic;
SIGNAL \stage0|q~DUPLICATE_q\ : std_logic;
SIGNAL \stage1_op~combout\ : std_logic;
SIGNAL \stage1|q~q\ : std_logic;
SIGNAL \stage2|q~0_combout\ : std_logic;
SIGNAL \stage2|q~q\ : std_logic;
SIGNAL \stage3_op~0_combout\ : std_logic;
SIGNAL \stage3|q~q\ : std_logic;
SIGNAL \stage0|ALT_INV_q~DUPLICATE_q\ : std_logic;
SIGNAL \stage3|ALT_INV_q~q\ : std_logic;
SIGNAL \stage2|ALT_INV_q~q\ : std_logic;
SIGNAL \stage1|ALT_INV_q~q\ : std_logic;
SIGNAL \stage0|ALT_INV_q~q\ : std_logic;

BEGIN

\out\ <= \ww_out\;
ww_reset <= reset;
ww_clk <= clk;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\stage0|ALT_INV_q~DUPLICATE_q\ <= NOT \stage0|q~DUPLICATE_q\;
\stage3|ALT_INV_q~q\ <= NOT \stage3|q~q\;
\stage2|ALT_INV_q~q\ <= NOT \stage2|q~q\;
\stage1|ALT_INV_q~q\ <= NOT \stage1|q~q\;
\stage0|ALT_INV_q~q\ <= NOT \stage0|q~q\;

-- Location: IOOBUF_X89_Y36_N39
\out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stage0|q~DUPLICATE_q\,
	devoe => ww_devoe,
	o => \ww_out\(0));

-- Location: IOOBUF_X89_Y37_N22
\out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stage1|q~q\,
	devoe => ww_devoe,
	o => \ww_out\(1));

-- Location: IOOBUF_X89_Y37_N39
\out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stage2|q~q\,
	devoe => ww_devoe,
	o => \ww_out\(2));

-- Location: IOOBUF_X89_Y37_N56
\out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stage3|q~q\,
	devoe => ww_devoe,
	o => \ww_out\(3));

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y37_N4
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X88_Y37_N25
\stage0|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stage0|q~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage0|q~q\);

-- Location: LABCELL_X88_Y37_N24
\stage0|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stage0|q~0_combout\ = ( !\stage0|q~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \stage0|ALT_INV_q~q\,
	combout => \stage0|q~0_combout\);

-- Location: FF_X88_Y37_N26
\stage0|q~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stage0|q~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage0|q~DUPLICATE_q\);

-- Location: LABCELL_X88_Y37_N15
stage1_op : cyclonev_lcell_comb
-- Equation(s):
-- \stage1_op~combout\ = ( \stage1|q~q\ & ( \stage0|q~q\ ) ) # ( !\stage1|q~q\ & ( !\stage0|q~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \stage1|ALT_INV_q~q\,
	dataf => \stage0|ALT_INV_q~q\,
	combout => \stage1_op~combout\);

-- Location: FF_X88_Y37_N17
\stage1|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stage1_op~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage1|q~q\);

-- Location: LABCELL_X88_Y37_N57
\stage2|q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stage2|q~0_combout\ = ( \stage2|q~q\ & ( \stage0|q~q\ ) ) # ( \stage2|q~q\ & ( !\stage0|q~q\ & ( \stage1|q~q\ ) ) ) # ( !\stage2|q~q\ & ( !\stage0|q~q\ & ( !\stage1|q~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000011110000111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \stage1|ALT_INV_q~q\,
	datae => \stage2|ALT_INV_q~q\,
	dataf => \stage0|ALT_INV_q~q\,
	combout => \stage2|q~0_combout\);

-- Location: FF_X88_Y37_N59
\stage2|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stage2|q~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage2|q~q\);

-- Location: LABCELL_X88_Y37_N42
\stage3_op~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stage3_op~0_combout\ = ( \stage3|q~q\ & ( \stage1|q~q\ ) ) # ( \stage3|q~q\ & ( !\stage1|q~q\ & ( (\stage2|q~q\) # (\stage0|q~DUPLICATE_q\) ) ) ) # ( !\stage3|q~q\ & ( !\stage1|q~q\ & ( (!\stage0|q~DUPLICATE_q\ & !\stage2|q~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000011111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \stage0|ALT_INV_q~DUPLICATE_q\,
	datad => \stage2|ALT_INV_q~q\,
	datae => \stage3|ALT_INV_q~q\,
	dataf => \stage1|ALT_INV_q~q\,
	combout => \stage3_op~0_combout\);

-- Location: FF_X88_Y37_N43
\stage3|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \stage3_op~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage3|q~q\);

-- Location: LABCELL_X19_Y74_N3
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


