module interlock (out, arrive, depart, fill, drain, iport, oport, reset, clock);
  
  /* define the output and input ports */
  output out;
  input arrive, depart, fill, drain, iport, oport;
  input reset, clock;
  
  /* new state holding wire and reg */
  wire [3:0] PS;
  reg  [3:0] NS;
  reg  [26:0] count;
  
  /* define conditions */
  parameter [3:0] INIT             = 4'h0, PREP             = 4'h1, WAIT_FILL  = 4'h2, FILLING  = 4'h3,
                  WAIT_IPORT_OPEN  = 4'h4, WAIT_OPORT_OPEN  = 4'h5, WAIT_DRAIN = 4'h6, DRAINING = 4'h7,
                  WAIT_IPORT_CLOSE = 4'h8, WAIT_OPORT_CLOSE = 4'h9, WAIT_USER  = 4'hA;
                  
									
  
	// Still need to change the count later. Right now, all delays are the same duration
  always @ (posedge clock) begin
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
        if (count[25]) begin 
          NS = WAIT_FILL;
          count <= 27'h0;
        end
        else begin
          NS = PREP;
          count <= count + 27'h1;
        end
			end
		
      /* WAITING TO FILL CONDITION */
      WAIT_FILL: begin
				if (fill) begin
					NS = FILLING;
				end
				else begin
					NS = WAIT_FILL;
				end
      end

      /* FILLING CONDITION*/
      FILLING: begin
				if (count[25]) begin
					NS = WAIT_OPORT_OPEN;
					count <= 27'h0;
				end
				else begin
					NS = FILLING;
					count <= count + 27'h1;
				end
      end
      
      /* WAITING FOR OUTER PORT TO OPEN */
      WAIT_OPORT_OPEN: begin
				if (oport) begin
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
				if (count[25]) begin
					NS = WAIT_IPORT_OPEN;
					count <= 27'h0;
				end
				else begin
					NS = DRAINING;
					count <= count + 27'h1;
				end
      end
			
			/* WAITING FOR INNER PORT TO OPEN */
      WAIT_IPORT_OPEN: begin
				if (iport) begin
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
    
      default: NS = 4'hx;
    endcase
  end
  
  DFlipFlop flip0 (.q(PS[0]), .qBar(), .D(NS[0]), .clk(clock), .rst(reset));
	DFlipFlop flip1 (.q(PS[1]), .qBar(), .D(NS[1]), .clk(clock), .rst(reset));
	DFlipFlop flip2 (.q(PS[2]), .qBar(), .D(NS[2]), .clk(clock), .rst(reset));
	DFlipFlop flip3 (.q(PS[3]), .qBar(), .D(NS[3]), .clk(clock), .rst(reset));
  
endmodule

/*
The DFlipFlop module is a D_Flip_Flop.  The code was given by James K. Peckol for EE371.

TYPE      |NAME       |WIDTH    |DESCRIPTION       
-----------------------------------------------------------------------------------
output    |q          |1 bit    |The present state.
output    |qBar       |1 bit    |The inverted present state.
input     |D          |1 bit    |The new state.
input     |clk        |1 bit    |The clock for the system.
input     |rst        |1 bit    |The reset signal (active low).
 */
module DFlipFlop(q, qBar, D, clk, rst);

  /* Defining the output/input ports */
  input D, clk, rst;
  output q, qBar;
  reg q;
  
  /* retrieve inverted output */
  not n1 (qBar, q);
  
  /* update the present state with the next state */
  always@ (negedge rst or posedge clk) begin
  if(!rst)
    q <= 0;
  else
    q = D;
  end
  
endmodule