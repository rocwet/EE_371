module count_down_johnson(out, reset, clk);
	input reset, clk;
	output reg[3:0] out;
	wire q1, q2, q3, q4, qBar, D;
	DFlipFlop d1 (.q(q1), .qBar(), .D(qBar), .clk(clk), .rst(reset));
	DFlipFlop d2 (.q(q2), .qBar(), .D(q1), .clk(clk), .rst(reset));
	DFlipFlop d3 (.q(q3), .qBar(), .D(q2), .clk(clk), .rst(reset));
	DFlipFlop d4 (.q(q4), .qBar(qBar), .D(q3), .clk(clk), .rst(reset));
	
	always@(negedge reset or posedge clk)
	begin
		if (!reset) out <= 4'b0;
		else
		begin
			out[3] <= q1;
			out[2] <= q2;
			out[1] <= q3;
			out[0] <= q4;
		end
	end
	
	always@ (negedge reset or posedge clk)
	begin
		if (!reset) out <= 4'b0000;
		else 
		begin
			out[3] <= ~out[0];
			out[2] <= out[3];
			out[1] <= out[2];
			out[0] <= out[1];
		end
	end
	
endmodule


module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	not n1 (qBar, q);
	always@ (negedge rst or posedge clk)
	begin
		if(!rst)
		q = 0;
		else
		q = D;
	end
endmodule