/*
The count_down_johnson() module is a 4-bit johnson counter.
@ author    Ruchira Kulkarni
@ date      2016.01.07
@ version   Project 1.3 =========== < 4-bit Johnson Counter [Behavioural] >

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |out        |4 bit    |The 4-bit output, counts from 15 to 0 in decimal.
input     |reset      |1 bit    |The reset signal (active low).
input     |clk        |1 bit    |The clock for the system.

*/
module count_down_johnson(out, reset, clk);
  
  /* Defining the output/input ports */
  output reg [3:0] out;
	input reset, clk;

  /* Next state logic */
	always@ (negedge reset or posedge clk) begin
		if (!reset) out <= 4'b0000;
		else begin
			out[3] <= ~out[0];
			out[2] <= out[3];
			out[1] <= out[2];
			out[0] <= out[1];
		end
	end
	
endmodule
