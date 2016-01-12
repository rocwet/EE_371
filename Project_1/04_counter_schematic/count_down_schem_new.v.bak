// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.1.0 Build 186 12/03/2014 SJ Full Version"
// CREATED		"Mon Jan 11 19:53:04 2016"

module count_down_schem_new(
	Clock,
	Reset,
	B3,
	B2,
	B1,
	B0
);


input wire	Clock;
input wire	Reset;
output wire	B3;
output wire	B2;
output wire	B1;
output wire	B0;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
reg	DFF_inst3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
reg	SYNTHESIZED_WIRE_9;
reg	SYNTHESIZED_WIRE_10;

assign	B3 = DFF_inst3;
assign	B2 = SYNTHESIZED_WIRE_7;
assign	B1 = SYNTHESIZED_WIRE_10;
assign	B0 = SYNTHESIZED_WIRE_9;




always@(posedge Clock or negedge Reset)
begin
if (!Reset)
	begin
	SYNTHESIZED_WIRE_9 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_9 <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge Clock or negedge Reset)
begin
if (!Reset)
	begin
	SYNTHESIZED_WIRE_10 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_1;
	end
end

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_7 ~^ SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_6 = DFF_inst3 ~^ SYNTHESIZED_WIRE_4;


always@(posedge Clock or negedge Reset)
begin
if (!Reset)
	begin
	SYNTHESIZED_WIRE_7 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_5;
	end
end


always@(posedge Clock or negedge Reset)
begin
if (!Reset)
	begin
	DFF_inst3 <= 0;
	end
else
	begin
	DFF_inst3 <= SYNTHESIZED_WIRE_6;
	end
end

assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_10 ~^ SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_9;


endmodule
