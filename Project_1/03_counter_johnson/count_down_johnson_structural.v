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
module count_down_johnson_structural(out, reset, clk);
  
  /* Defining the output/input ports */
  output [3:0] out;
	input reset, clk;
  
	/* Wire for feedback loop */
	wire [3:0] not_out;
  
  /* Next state logic */
	DFlipFlop d3 (.q(out[3]), .qBar(), .D(not_out[0]), .clk(clk), .rst(reset));
	DFlipFlop d2 (.q(out[2]), .qBar(), .D(out[3]), .clk(clk), .rst(reset));
	DFlipFlop d1 (.q(out[1]), .qBar(), .D(out[2]), .clk(clk), .rst(reset));
	DFlipFlop d0 (.q(out[0]), .qBar(not_out[0]), .D(out[1]), .clk(clk), .rst(reset));
	
endmodule

/*
The DFlipFlop module is a D_Flip_Flop.  The code was given by James K. Peckol for EE371.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |q          |1 bit    |The present state.
output    |qBar       |1 bit    |The inverted present state.
input     |D          |1 bit    |The new state.
input     |clk        |1 bit    |The clock for the system.
input     |rst        |1 bit    |The reset signal (active low).
 */
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

/* ---------------------------------------------------------------------------------------- */
/* ------------------------------------TEST BENCH------------------------------------------ */
/* ---------------------------------------------------------------------------------------- */

/*
The count_down_testBench module tests the count_down module. 
*/
module count_down_johnson_testBench;

  /* Wires for testing */
  wire [3:0] out;
  wire reset, clk;
  
  /* declare instance of count_down module */
  count_down_johnson_structural dut (.out(out), .reset(reset), .clk(clk));
  
  /* declare instance of test module */
  count_down_johnson_structural_tester aTest (reset, clk, out);
  
  /* file for gtkwave */
  initial begin
    $dumpfile("____gtkwave____STRUCTURAL____.vcd");
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
module count_down_johnson_structural_tester(resetOut, clkOut, out);

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
  
  /* Update Clock */
  always begin
    #DELAY clkOut = 1;
    #DELAY clkOut = 0;
  end
  
  /* Set values for ports w/ delays*/
  initial begin
    clkOut = 0;
    resetOut = 0; #100;
    for(i = 0; i < 50; i = i + 1) begin
      resetOut = 1; #DELAY;
    end
    resetOut = 0; #100;
    for(i = 0; i < 20; i = i + 1) begin
      resetOut = 1; #DELAY;
    end
    $finish;
	end
  
endmodule