/*
The count_down() module is a 4-bit down counter implemented using data flow.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |out        |4 bit    |The 4-bit output, counts from 15 to 0 in decimal.
input     |reset      |1 bit    |The reset signal (active low).
input     |clk        |1 bit    |The clock for the system.

*/
module count_down(out, reset, clk);

  /* Defining the output/input ports */
  output [3:0] out;
  input reset, clk;
  
  /* Wires for connection */
  wire [3:0] new_out;
  wire [3:0] not_out;
  wire s2_temp1, s2_temp2, s2_temp3;
  wire s3_temp1, s3_temp2, s3_temp3;
  
  /* stage 2 intermediate operations */
  and s2_1 (s2_temp1, not_out[2], not_out[1], not_out[0]);
  or  s2_2 (s2_temp2, out[0], out[1]);
  and s2_3 (s2_temp3, out[2], s2_temp2);
  
  /* stage 3 intermediate operations*/
  and s3_1 (s3_temp1, not_out[3], not_out[2], not_out[1], not_out[0]);
  or  s3_2 (s3_temp2, out[2], out[1], out[0]);
  and s3_3 (s3_temp3, out[3], s3_temp2);
  
  /* Operation for each stage for the new state*/
  not  stage0_op (new_out[0], out[0]);
  xnor stage1_op (new_out[1], out[1], out[0]);
  or   stage2_op (new_out[2], s2_temp3, s2_temp1);
  or   stage3_op (new_out[3], s3_temp1, s3_temp3);
  
  /* D_Flip_Flop for new state to present stage assignment */
  D_FF stage0 (.q(out[0]), .qBar(not_out[0]), .D(new_out[0]), .clk(clk), .rst(reset));
  D_FF stage1 (.q(out[1]), .qBar(not_out[1]), .D(new_out[1]), .clk(clk), .rst(reset));
  D_FF stage2 (.q(out[2]), .qBar(not_out[2]), .D(new_out[2]), .clk(clk), .rst(reset));
  D_FF stage3 (.q(out[3]), .qBar(not_out[3]), .D(new_out[3]), .clk(clk), .rst(reset));

endmodule

/*
The D_FF module is a D_Flip_Flop.  The code was given by James K. Peckol for EE371.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |q          |1 bit    |The present state.
output    |qBar       |1 bit    |The inverted present state.
input     |D          |1 bit    |The new state.
input     |clk        |1 bit    |The clock for the system.
input     |rst        |1 bit    |The reset signal (active low).
 */
module D_FF(q, qBar, D, clk, rst);

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
module count_down_testbench();
  reg reset;
  reg clk;
  wire [3:0] out;

	count_down dut (.out(out), .reset(reset), .clk(clk));
  integer i;
	initial begin
    clk = 0;
    reset = 0; #200;
    reset = 1; #10;
    for(i = 0; i < 64; i = i + 1) begin
      #10;
      clk = 1;
      #10;
      clk = 0;
    end
	end
  
endmodule
