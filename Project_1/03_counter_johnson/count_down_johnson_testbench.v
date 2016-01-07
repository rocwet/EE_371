module count_down_johnson_testbench(); 
 reg clk, reset; 
 wire[3:0] out; 
 
 count_down_johnson dut (.out, .reset, .clk); 
  
 parameter CLOCK_PERIOD=100; 
 initial clk=1; 
 always begin 
 #(CLOCK_PERIOD/2); 
 clk = ~clk; 
 end 
 
 initial begin 
 @(negedge reset or posedge clk); 
 reset <= 0; @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 reset <= 1;@(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 reset <= 0;@(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 @(negedge reset or posedge clk);
 $stop; // End the simulation. 
 end 
endmodule 
