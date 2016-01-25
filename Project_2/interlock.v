
module interlock (LED, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, arrive, depart, fill, drain, iport, oport, select, testPressure, reset, clock);
  
  /* define the output and input ports */
  output reg [9:0] LED;
  output reg [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  input arrive, depart, fill, drain, iport, oport, select, testPressure;
  input reset, clock;
  
  /* new state holding wire and reg */
  wire [3:0] PS;
  reg  [3:0] NS;
  
  
  reg  [26:0] count;
  wire diffError, limitError;
  
  always @(*) begin
    LED[6] = diffError;
    LED[7] = limitError;
  end
  
  /* TIME DELAY of ~ 5 seconds */
  parameter TIME_DELAY = 16;
  
  /* define conditions */
  parameter [3:0] INIT             = 4'h0, PREP             = 4'h1, WAIT_FILL  = 4'h2, FILLING  = 4'h3,
                  WAIT_IPORT_OPEN  = 4'h4, WAIT_OPORT_OPEN  = 4'h5, WAIT_DRAIN = 4'h6, DRAINING = 4'h7,
                  WAIT_IPORT_CLOSE = 4'h8, WAIT_OPORT_CLOSE = 4'h9, WAIT_USER  = 4'hA, ERROR    = 4'hB;
                  
									
  
	// Still need to change the count later. Right now, all delays are the same duration
  always @ (PS or count) begin
    case (PS) 
    
      /* INTIAL CONDITION */
      INIT: begin
        if (arrive) NS = PREP;
        else if (iport) NS = WAIT_USER;
        else NS = INIT;
      end
      
			/* WAITING FOR DEPART CONDITION */
      WAIT_USER: begin
        if (!iport && depart) begin 
          NS = PREP;
        end
        else begin
          NS = WAIT_USER;
        end
			end
			
      /* PREP CONDITION */
      PREP: begin
        if (count[TIME_DELAY]) begin 
          NS = WAIT_FILL;
        end
        else begin
          NS = PREP;
        end
			end
		
      /* WAITING TO FILL CONDITION */
      WAIT_FILL: begin
				if (fill && !depart && !arrive) begin
					NS = FILLING;
				end
				else begin
					NS = WAIT_FILL;
				end
      end

      /* FILLING CONDITION*/
      FILLING: begin
				if (limitError) begin
					NS = ERROR;
				end
				else if (2'b11 == count[TIME_DELAY:TIME_DELAY-1]) begin
					NS = WAIT_OPORT_OPEN;
				end
				else begin
					NS = FILLING;
				end
      end
      
      /* WAITING FOR OUTER PORT TO OPEN */
      WAIT_OPORT_OPEN: begin
				if (diffError) begin
					NS = ERROR;
				end
				else if (oport) begin
					NS = WAIT_OPORT_CLOSE;
				end
				else begin
					NS = WAIT_OPORT_OPEN;
				end
      end
      
      /* WAITING FOR OUTER PORT TO OPEN */
      WAIT_OPORT_CLOSE: begin
				if (!oport) begin
					NS = WAIT_DRAIN;
				end
				else begin
					NS = WAIT_OPORT_CLOSE;
				end
      end
      
      /* WAITING FOR DRAIN CONDITION */
      WAIT_DRAIN: begin
				if (drain) begin
					NS = DRAINING;
				end
				else begin
					NS = WAIT_DRAIN;
				end
      end
      
      /* DRAINING CONDITION */
      DRAINING: begin
				if (limitError) begin
					NS = ERROR;
				end
				else if (3'b111 == count[TIME_DELAY:TIME_DELAY-2]) begin
					NS = WAIT_IPORT_OPEN;
				end
				else begin
					NS = DRAINING;
				end
      end
			
			/* WAITING FOR INNER PORT TO OPEN */
      WAIT_IPORT_OPEN: begin
				if (diffError) begin
					NS = ERROR;
				end
				else if (iport) begin
					NS = WAIT_IPORT_CLOSE;
				end
				else begin
					NS = WAIT_IPORT_OPEN;
				end
      end
			
			/* WAITING FOR INNER PORT TO CLOSE */
      WAIT_IPORT_CLOSE: begin
				if (!iport) begin
					NS = INIT;
				end
				else begin
					NS = WAIT_IPORT_CLOSE;
				end
      end
			
			/* ERROR CONDITION */
      ERROR: begin
				NS = ERROR;
      end
    
      default: NS = 4'hx;
    endcase
  end
  
  always @(posedge clock) begin
		case (PS) 
    
      /* INTIAL CONDITION */
      INIT: begin
        HEX5 <= ~7'b1101101; // start
				HEX4 <= ~7'b1111000;
				HEX3 <= ~7'b1110111;
				HEX2 <= ~7'b1010000;
				HEX1 <= ~7'b1111000;
        HEX0 <= ~7'b0000000;
      end
      
			/* WAITING FOR DEPART CONDITION */
      WAIT_USER: begin
        HEX5 <= ~7'b1111100; // board
				HEX4 <= ~7'b1011100;
				HEX3 <= ~7'b1110111;
				HEX2 <= ~7'b1010000;
				HEX1 <= ~7'b1011110;
        HEX0 <= ~7'b0000000;
			end
			
      /* PREP CONDITION */
      PREP: begin
        HEX5 <= ~7'b1110011; // prep
				HEX4 <= ~7'b1010000;
				HEX3 <= ~7'b1111001;
				HEX2 <= ~7'b1110011;
				HEX1 <= ~7'b0000000;
        HEX0 <= ~7'b0000000;
        LED[5] <= count[TIME_DELAY-4];
			end
		
      /* WAITING TO FILL CONDITION */
      WAIT_FILL: begin
				HEX5 <= ~7'b1110100; // hold-f
				HEX4 <= ~7'b1011100;
				HEX3 <= ~7'b0000110;
				HEX2 <= ~7'b1011110;
				HEX1 <= ~7'b1000000;
        HEX0 <= ~7'b1110001;
      end

      /* FILLING CONDITION*/
      FILLING: begin
				HEX5 <= ~7'b1110001; // fill
				HEX4 <= ~7'b0000100;
				HEX3 <= ~7'b0000110;
				HEX2 <= ~7'b0000110;
				HEX1 <= ~7'b0000000;
        HEX0 <= ~7'b0000000;
        LED[5] <= count[TIME_DELAY-4];
      end
      
      /* WAITING FOR OUTER PORT TO OPEN */
      WAIT_OPORT_OPEN: begin
				HEX5 <= ~7'b0111111; // Oopen
				HEX4 <= ~7'b1011100;
				HEX3 <= ~7'b1110011;
				HEX2 <= ~7'b1111001;
				HEX1 <= ~7'b1010100;
        HEX0 <= ~7'b0000000;
      end

      /* WAITING FOR OUTER PORT TO OPEN */
      WAIT_OPORT_CLOSE: begin
				HEX5 <= ~7'b0111111; // Oclose
				HEX4 <= ~7'b1011000;
				HEX3 <= ~7'b0000110;
				HEX2 <= ~7'b1011100;
				HEX1 <= ~7'b1101101;
        HEX0 <= ~7'b1111001;
      end
      
      /* WAITING FOR DRAIN CONDITION */
      WAIT_DRAIN: begin
				HEX5 <= ~7'b1110100; // hold-d
				HEX4 <= ~7'b1011100;
				HEX3 <= ~7'b0000110;
				HEX2 <= ~7'b1011110;
				HEX1 <= ~7'b1000000;
        HEX0 <= ~7'b1011110;
      end
      
      /* DRAINING CONDITION */
      DRAINING: begin
				HEX5 <= ~7'b1011110; // drain
				HEX4 <= ~7'b1010000;
				HEX3 <= ~7'b1110111;
				HEX2 <= ~7'b0000100;
				HEX1 <= ~7'b1010100;
        HEX0 <= ~7'b0000000;
        LED[5] <= count[TIME_DELAY-4];
      end
			
			/* WAITING FOR INNER PORT TO OPEN */
      WAIT_IPORT_OPEN: begin
				HEX5 <= ~7'b0000100; // iopen
				HEX4 <= ~7'b1011100;
				HEX3 <= ~7'b1110011;
				HEX2 <= ~7'b1111001;
				HEX1 <= ~7'b1010100;
        HEX0 <= ~7'b0000000;
      end
			
			/* WAITING FOR INNER PORT TO CLOSE */
      WAIT_IPORT_CLOSE: begin
				HEX5 <= ~7'b0000100; // iclose
				HEX4 <= ~7'b1011000;
				HEX3 <= ~7'b0000110;
				HEX2 <= ~7'b1011100;
				HEX1 <= ~7'b1101101;
        HEX0 <= ~7'b1111001;
      end
			
			/* ERROR CONDITION */
      ERROR: begin
				HEX5 <= ~7'b1111001; // error
				HEX4 <= ~7'b1010000;
				HEX3 <= ~7'b1010000;
				HEX2 <= ~7'b0111111;
				HEX1 <= ~7'b1010000;
        HEX0 <= ~7'b0000000;
      end
    
      default: begin
        HEX5 <= ~7'bxxxxxxx; // default
				HEX4 <= ~7'bxxxxxxx;
				HEX3 <= ~7'bxxxxxxx;
				HEX2 <= ~7'bxxxxxxx;
				HEX1 <= ~7'bxxxxxxx;
        HEX0 <= ~7'bxxxxxxx;
      end
    endcase
	end
  
  always @(posedge clock) begin 
    case (PS)
      WAIT_FILL:        count <= 27'h0;
      WAIT_OPORT_OPEN:  count <= 27'h0;
      WAIT_IPORT_OPEN:  count <= 27'h0;
      PREP:             count <= count + 27'h1;
      FILLING:          count <= count + 27'h1;
      DRAINING:         count <= count + 27'h1;
      default:           count <= 27'h0;
    endcase
  end
  
	diff_pressure diff0 (.diff(diffError), .key(testPressure), .SW(~select), .clk(clock), .reset(reset));
	limit_pressure limit0 (.limit(limitError), .key(testPressure), .SW(select), .clk(clock), .reset(reset));
	
	// HEX DISPLAY STATUS & EXTRA LEDS DISPLAY TIME
	
  DFlipFlop flip0 (.q(PS[0]), .qBar(), .D(NS[0]), .clk(clock), .rst(reset));
	DFlipFlop flip1 (.q(PS[1]), .qBar(), .D(NS[1]), .clk(clock), .rst(reset));
	DFlipFlop flip2 (.q(PS[2]), .qBar(), .D(NS[2]), .clk(clock), .rst(reset));
	DFlipFlop flip3 (.q(PS[3]), .qBar(), .D(NS[3]), .clk(clock), .rst(reset));
  
endmodule