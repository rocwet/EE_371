module count_down(out, reset, clk);
  output [3:0] out;
  input reset, clk;
  
  wire [3:0] new_out;
  wire s2_temp1, s2_temp2, s2_temp3;
  wire s3_temp1, s3_temp2, s3_temp3;
  wire [3:0] not_out;
  
  not  stage0_op (new_out[0], out[0]);
  xnor stage1_op (new_out[1], out[1], out[0]);
  or   stage2_op (new_out[2], s2_temp3, s2_temp1);
  or   stage3_op (new_out[3], s3_temp1, s3_temp3);
  
  and s2_1 (s2_temp1, not_out[2], not_out[1], not_out[0]);
  or  s2_2 (s2_temp2, out[0], out[1]);
  and s2_3 (s2_temp3, out[2], s2_temp2);
  
  and s3_1 (s3_temp1, not_out[3], not_out[2], not_out[1], not_out[0]);
  or  s3_2 (s3_temp2, out[2], out[1], out[0]);
  and s3_3 (s3_temp3, out[3], s3_temp2);
  
  D_FF stage0 (.q(out[0]), .qBar(not_out[0]), .D(new_out[0]), .clk(clk), .rst(reset));
  D_FF stage1 (.q(out[1]), .qBar(not_out[1]), .D(new_out[1]), .clk(clk), .rst(reset));
  D_FF stage2 (.q(out[2]), .qBar(not_out[2]), .D(new_out[2]), .clk(clk), .rst(reset));
  D_FF stage3 (.q(out[3]), .qBar(not_out[3]), .D(new_out[3]), .clk(clk), .rst(reset));


endmodule

// test
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

module D_FF(q, qBar, D, clk, rst);
  input D, clk, rst;
  output q, qBar;
  reg q;
  not n1 (qBar, q);
  always@ (negedge rst or posedge clk)
  begin
  if(!rst)
    q <= 0;
  else
    q = D;
  end
endmodule
