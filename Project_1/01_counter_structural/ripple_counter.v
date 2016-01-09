module ripple_counter(out, reset, clk);
	input reset, clk;
	output[3:0] out;
	wire[3:0] inv_out;
	
	DFlipFlop flip3 (.q(out[3]), .qBar(inv_out[3]), .D(inv_out[3]), .clk(out[2]), .rst(reset));
	DFlipFlop flip2 (.q(out[2]), .qBar(inv_out[2]), .D(inv_out[2]), .clk(out[1]), .rst(reset));
	DFlipFlop flip1 (.q(out[1]), .qBar(inv_out[1]), .D(inv_out[1]), .clk(out[0]), .rst(reset));
	DFlipFlop flip0 (.q(out[0]), .qBar(inv_out[0]), .D(inv_out[0]), .clk(clk), .rst(reset));
endmodule

module ripple_counter_testbench();
	// connect the two modules
	reg reset, clk;
	wire[3:0] out;

	// declare an instance of the ripple_counter module
	ripple_counter dut (out, reset, clk);
	
	Tester();
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("ripple.vcd");
		$dumpvars(1, dut);
	end
endmodule 

module Tester();
	input[3:0] out;
	output reg resetOut, clkOut;
	
	initial begin // Response
		$display("\t\t resetOut \t clkOut \t");
		$monitor("\t\t %b \t %b \t %b", reset, clk, out, $time);
	end
	
	parameter clk_period = 1000;
	initial clk = 1;
	always begin
		#(clk_period/2);
		clk = ~clk;
	end 
	
	integer i;
	initial begin
		reset <= 0; 			@(posedge clk);
		reset <= 1; 			@(posedge clk);
		
		for(i = 0; i < 100; i++) begin
			@(posedge clk);
		end
		
		$finish;
	end


endmodule 

/* ---------------------------------------------------------------------------------------- */
/* ------------------------------------TEST BENCH------------------------------------------ */
/* ---------------------------------------------------------------------------------------- */

/*
The count_down_testBench module tests the count_down module. 
*/
module ripple_counter_testbench;

  /* Wires for testing */
  wire [3:0] out;
  wire reset, clk;
  
  /* declare instance of count_down module */
  count_down dut (.out(out), .reset(reset), .clk(clk));
  
  /* declare instance of test module */
  count_down_tester aTest (reset, clk, out);
  
  /* file for gtkwave */
  initial begin
    $dumpfile("count_down_0.vcd");
    $dumpvars(1, dut);
  end
  
endmodule

/*
The count_down_tester module generates the reset and clock signals for testing.
It also prints out, on stdout, the output and inputs of the count_down module.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |resetOut   |1 bit    |The generated reset signal for testing.
output    |clkOut     |1 bit    |The genereated clk signal for testing.
input     |out        |4 bit    |The output signal used for printing to stdout.
 */
module count_down_tester(resetOut, clkOut, out);

  /* Defining the output/input ports */
  output reg resetOut, clkOut;
  input [3:0] out;
  
  /* Delay Constant */
  parameter DELAY = 10;
  integer i;
  
  /* Display information of ports to stdout */
  initial begin
    $display("\t resetOut \t clkOut \t out ");
    $monitor("\t %b\t %b \t %d", resetOut, clkOut, out);
  end
  
  /* Set values for ports w/ delays*/
  initial begin
    clkOut = 0;
    resetOut = 0; 
    #100 resetOut = 1; 
    for(i = 0; i < 26; i = i + 1) begin
      #DELAY clkOut = 1;
      #DELAY clkOut = 0;
    end
    resetOut = 0; 
    #100 $finish;
	end
  
endmodule 