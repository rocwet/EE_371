module top_ripple_counter(SW, LED, init_clk);
	input init_clk;
	input[9:0] SW;
	output[9:0] LED;

	reg[26:0] tBase; //  system timebase
	wire slow_clk, inv_q;
	
	always @(posedge init_clk) tBase <= tBase + 1'b1; 	         //  build the timebase
	
	DFlipFlop time_flip (.q(slow_clk), .qBar(inv_q), .D(inv_q), .clk(tBase[24]), .rst(SW[0]));  //  uses system clock / 2^19 ~= 10 cycles per second
	
	ripple_counter ripple_please (.out(LED[3:0]), .reset(SW[0]), .clk(slow_clk));
endmodule 