module top_counter_down_schematic_struct(KEY, LED, init_clk);
	input init_clk;
	input KEY;
	output[9:0] LED;

	reg[26:0] tBase; //  system timebase
	wire slow_clk, inv_q;
	
	always @(posedge init_clk) tBase <= tBase + 1'b1; 	         //  build the timebase
	
	DFlipFlop time_flip (.q(slow_clk), .qBar(inv_q), .D(inv_q), .clk(tBase[24]), .rst(KEY));  //  uses system clock / 2^19 ~= 10 cycles per second
	
	count_down_schem_new schematic_please (.Clock(slow_clk), .Reset(KEY), .B3(LED[3]), .B2(LED[2]), .B1(LED[1]), .B0(LED[0]));
//	count_down_schem_new schematic_please (.Clock(init_clk), .Reset(KEY), .B3(LED[3]), .B2(LED[2]), .B1(LED[1]), .B0(LED[0]));
endmodule 