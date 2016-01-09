module ripple_counter(out, reset, clk);
	input reset, clk;
	output[3:0] out;
	wire[3:0] inv_out;
	
	DFlipFlop flip3 (.q(out[3]), .qBar(inv_out[3]), .D(inv_out[3]), .clk(out[2]), .rst(reset));
	DFlipFlop flip2 (.q(out[2]), .qBar(inv_out[2]), .D(inv_out[2]), .clk(out[1]), .rst(reset));
	DFlipFlop flip1 (.q(out[1]), .qBar(inv_out[1]), .D(inv_out[1]), .clk(out[0]), .rst(reset));
	DFlipFlop flip0 (.q(out[0]), .qBar(inv_out[0]), .D(inv_out[0]), .clk(clk), .rst(reset));
endmodule

//module DFlipFlop(q, qBar, D, clk, rst);
//	input D, clk, rst;
//	output q, qBar;
//	
//	reg q;
//	not n1 (qBar, q);
//	always@ (negedge rst or posedge clk) begin
//		if(!rst)
//			q = 0;
//		else
//			q = D;
//	end
//endmodule

module ripple_counter_testbench();
	// connect the two modules
	reg reset, clk;
	wire[3:0] out;

	// declare an instance of the ripple_counter module
	ripple_counter dut (out[3:0], reset, clk);

	parameter clk_period = 1000;
	initial clk = 1;
	always begin
		#(clk_period/2);
		clk = ~clk;
	end 
	
	initial begin // Response
		$display("\t\t xOut yOut \t XandYin XorYin \t Time ");
		$monitor("\t\t %b \t %b \t %b", reset, clk, out, $time);
	end
	
	integer i;
	initial begin
		reset <= 0; 			@(posedge clk);
		reset <= 1; 			@(posedge clk);
		
		for(i = 0; i < 100; i = i + 1) begin
			@(posedge clk);
		end
		
		$finish;
	end
	
	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("ripple.vcd");
		$dumpvars(1, dut);
	end
endmodule 