
module diff_pressure (diff, key, clk, reset);
	input clk, key, reset;
	output reg diff;
	
	wire PS;
	reg NS;
	
	parameter UNDER = 1'b0, OVER = 1'b1;
	
  always @(posedge clk) begin
    case (PS) 
    
      /* DIFFERENTIAL PRESSURE IS <= 0.1 atm */
      UNDER: begin
        if (key) NS = OVER;
        else NS = UNDER;
      end
      
			/* DIFFERENTIAL PRESSURE IS > 0.1 atm */
      OVER: begin
        if (key) NS = UNDER;
        else NS = OVER;
      end
		
      default: NS = 1'bx;
    endcase
  end
	
	DFlipFlop flip0 (.q(PS), .qBar(), .D(NS), .clk(clk), .rst(reset));
	
	always @(*) begin
		diff = PS;
	end
	
endmodule

/* ---------------------------------------------------------------------------------------- */
/* ------------------------------------TEST BENCH------------------------------------------ */
/* ---------------------------------------------------------------------------------------- */

/*
The diff_pressure_testBench module tests the diff_pressure module. 
*/
module diff_pressure_testBench;

  /* Wires for testing */
  wire diff, key, clk, reset;
  
  /* declare instance of diff_pressure module */
  diff_pressure dut (.diff(diff), .key(key), .clk(clk), .reset(reset));
  
  /* declare instance of test module */
  diff_pressure_tester aTest (.resetOut(reset), .clkOut(clk), .keyOut(key), .diff(diff));
  
  /* file for gtkwave */
  initial begin
    $dumpfile("____gtkwave____DIFF_PRESSURE____.vcd");
    $dumpvars(1, dut);
  end
  
endmodule

/*
The diff_pressure_tester module generates the reset, clock, and key signals for testing.
It also prints diff, on stdout, the output and inputs of the diff_pressure module.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |resetOut   |1 bit    |The generated reset signal for testing.
output    |clkOut     |1 bit    |The genereated clk signal for testing.
output    |keyOut     |1 bit    |The genereated key signal for testing.
input     |diff       |1 bit    |The output signal used for printing to stdout.
 */
module diff_pressure_tester(resetOut, clkOut, keyOut, diff);

  /* Defining the output/input ports */
  output reg resetOut, clkOut, keyOut;
  input diff;
  
  /* Delay Constant */
  parameter DELAY = 10;
  integer i;
  
  /* Display information of ports to stdout */
  initial begin
    $display("\t resetOut \t clkOut \t keyOut \t out ");
    $monitor("\t %b \t %b \t %b \t %d", resetOut, clkOut, keyOut, diff);
  end
  
  /* Update Clock */
  always begin
    #DELAY clkOut = 1;
    #DELAY clkOut = 0;
  end
  
  /* Set values for ports w/ delays*/
  initial begin
    clkOut = 0;
    resetOut = 1; #40;
		resetOut = 0;
		keyOut = 0; #20;
    for(i = 0; i < 4; i = i + 1) begin
			keyOut = 0; #DELAY; #DELAY; #DELAY; #DELAY;
			keyOut = 1; #DELAY; #DELAY; #DELAY; #DELAY;
    end
		for(i = 0; i < 4; i = i + 1) begin
      keyOut = 1; #DELAY; #DELAY;
			keyOut = 0; #DELAY; #DELAY;
    end
    resetOut = 1; #40;
    for(i = 0; i < 4; i = i + 1) begin
      keyOut = 0; #DELAY; #DELAY;
			keyOut = 1; #DELAY; #DELAY;
    end
		resetOut = 0; #40;
    for(i = 0; i < 4; i = i + 1) begin
      keyOut = 0; #DELAY; #DELAY;
			keyOut = 1; #DELAY; #DELAY;
    end
    $finish;
	end
  
endmodule