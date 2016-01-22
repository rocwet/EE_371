module diff_pressure (diff, key, clk, reset);
	input clk, key, reset;
	output diff;
	
	reg[1:0] PS, NS;
	
	parameter UNDER = 1'b1, OVER = 1'b0;
	
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
	
	always @(posedge clk) begin
		if (reset) begin
			PS <= UNDER;
		end
		else begin
			PS <= NS;
		end
	end
	
	always @(*) begin
		diff = PS;
	end
	
endmodule