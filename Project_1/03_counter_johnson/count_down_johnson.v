/*
The count_down_johnson() module is a 4-bit johnson counter.
@ author    Ruchira Kulkarni
@ date      2016.01.07
@ version   Project 1.3 =========== < 4-bit Johnson Counter [Structurally] >

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |out        |4 bit    |The 4-bit output, counts from 15 to 0 in decimal.
input     |reset      |1 bit    |The reset signal (active low).
input     |clk        |1 bit    |The clock for the system.

*/
module count_down_johnson(out, reset, clk);
  
  /* Defining the output/input ports */
  output [3:0] out;
	input reset, clk;
  
	/* Wire for feedback loop */
	wire [3:0] not_out;
  
  /* Next state logic */
	DFlipFlop d0 (.q(out[0]), .qBar(), .D(not_out[3]), .clk(clk), .rst(reset));
	DFlipFlop d1 (.q(out[1]), .qBar(), .D(out[0]), .clk(clk), .rst(reset));
	DFlipFlop d2 (.q(out[2]), .qBar(), .D(out[1]), .clk(clk), .rst(reset));
	DFlipFlop d3 (.q(out[3]), .qBar(not_out[3]), .D(out[2]), .clk(clk), .rst(reset));
	
	always@ (negedge reset or posedge clk)
	begin
		if (!reset) out <= 4'b0000;
		else 
		begin
			out[3] <= ~out[0];
			out[2] <= out[3];
			out[1] <= out[2];
			out[0] <= out[1];
		end
	end
	
endmodule


module DFlipFlop(q, qBar, D, clk, rst);

  /* Defining the output/input ports */
  input D, clk, rst;
  output q, qBar;
  reg q;
  
  /* retrieve inverted output */
  not n1 (qBar, q);
  
  /* update the present state with the next state */
  always@ (negedge rst or posedge clk) begin
  if(!rst)
    q <= 0;
  else
    q = D;
  end
  
endmodule