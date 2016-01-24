
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