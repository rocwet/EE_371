// Top level module for bathyshpere port.
module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW); 
 input CLOCK_50; //50Mhz clock
 output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
 output [9:0] LEDR; 
 input [3:0] KEY; 
 input [9:0] SW; 
 
 interlock i_lock(.LED(LEDR), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5), .arrive(SW[0]), .depart(SW[1]),
						.fill(KEY[1]), .drain(KEY[2]), .iport(SW[3]), .oport(SW[2]), .reset(KEY[0]), .clock(CLOCK_50));
 //diff_pressure(diff, key, clk, reset);
 //limit_pressure (limit, key, clk, reset);
 endmodule
 