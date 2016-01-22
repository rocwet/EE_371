module limit_pressure (limit, key, clk, reset);
	input clk, key, reset;
	output reg limit;
	
	reg[1:0] PS, NS;
	
	parameter WITHIN = 1'b1, BEYOND = 1'b0;
	
  always @(posedge clk) begin
    case (PS) 
    
      /* DIFFERENTIAL PRESSURE IS <= 0.1 atm */
      WITHIN: begin
        if (key) NS = BEYOND;
        else NS = WITHIN;
      end
      
			/* DIFFERENTIAL PRESSURE IS > 0.1 atm */
      BEYOND: begin
        if (key) NS = WITHIN;
        else NS = BEYOND;
      end
		
      default: NS = 1'bx;
    endcase
  end
	
	always @(posedge clk) begin
		if (reset) begin
			PS <= WITHIN;
		end
		else begin
			PS <= NS;
		end
	end
	
	always @(*) begin
		limit = PS;
	end
	
endmodule