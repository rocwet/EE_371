module ripple_counter(out, reset, clk);
	input reset, clk;
	output[3:0] out;
	wire[3:0] inv_out;
	
	DFlipFlop flip3 (.q(out[3]), .qBar(inv_out[3]), .D(inv_out[3]), .clk(out[2]), .rst(reset));
	DFlipFlop flip2 (.q(out[2]), .qBar(inv_out[2]), .D(inv_out[2]), .clk(out[1]), .rst(reset));
	DFlipFlop flip1 (.q(out[1]), .qBar(inv_out[1]), .D(inv_out[1]), .clk(out[0]), .rst(reset));
	DFlipFlop flip0 (.q(out[0]), .qBar(inv_out[0]), .D(inv_out[0]), .clk(clk), .rst(reset));
endmodule

module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	
	reg q;
	not n1 (qBar, q);
	always@ (negedge rst or posedge clk) begin
		if(!rst)
			q = 0;
		else
			q = D;
	end
endmodule 

/* ---------------------------------------------------------------------------------------- */
/* ------------------------------------TEST BENCH------------------------------------------ */
/* ---------------------------------------------------------------------------------------- */

/*
The ripple_counter_testbench module tests the ripple_counter module. 
*/
module ripple_counter_testbench();
  /* Wires for testing */
  wire[3:0] out;
  wire reset, clk;
  
  /* declare instance of count_down module */
  ripple_counter dut (.out(out), .reset(reset), .clk(clk));
  
  /* declare instance of test module */
  ripple_counter_tester rippleTest (.resetOut(reset), .clkOut(clk), .out(out));
  
  /* file for gtkwave */
  initial begin
    $dumpfile("ripple_counter_gate.vcd");
    $dumpvars(1, dut);
  end
endmodule

/*
The ripple_counter_tester module generates the reset and clock signals for testing.
It also prints out, on stdout, the output and inputs of the ripple_counter module.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |resetOut   |1 bit    |The generated reset signal for testing.
output    |clkOut     |1 bit    |The genereated clk signal for testing.
input     |out        |4 bit    |The output signal used for printing to stdout.
 */
module ripple_counter_tester(resetOut, clkOut, out);
	/* Defining the output/input ports */
	output reg resetOut, clkOut;
	input[3:0] out;

	/* Delay Constant */
	parameter DELAY = 10;
	integer i;

	/* Display information of ports to stdout */
	initial begin
		$display("\t resetOut \t clkOut \t out ");
		$monitor("\t %b\t\t %b \t\t %d", resetOut, clkOut, out);
	end
	  
	parameter clk_period = 1000;
	initial clkOut = 1;
	always begin
		#(clk_period/2);
		clkOut = ~clkOut;
	end 

	initial begin
		resetOut <= 0; 			@(posedge clkOut);
		resetOut <= 1; 			@(posedge clkOut);
		
		for(i = 0; i < 100; i = i + 1) begin
			@(posedge clkOut);
		end
		
		$finish;
	end
  
endmodule 