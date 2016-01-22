`include "DFlipFlop.v"

module limit_pressure (limit, key, clk, reset);
	input clk, key, reset;
	output reg limit;
	
	wire PS;
	reg NS;
	
	parameter WITHIN = 1'b0, BEYOND = 1'b1;
	
  always @(posedge clk) begin
    case (PS) 
    
      /* WITHIN LIMIT OF 16000 PSI and 13 PSI */
      WITHIN: begin
        if (key) NS = BEYOND;
        else NS = WITHIN;
      end
      
			/* BEYOND LIMIT OF 16000 PSI and 13 PSI */
      BEYOND: begin
        if (key) NS = WITHIN;
        else NS = BEYOND;
      end
		
      default: NS = 1'bx;
    endcase
  end
	
	DFlipFlop flip0 (.q(PS), .qBar(), .D(NS), .clk(clk), .rst(reset));
	
	always @(PS) begin
		limit = PS;
	end
	
endmodule