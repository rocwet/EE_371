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
  parameter [3:0] INIT             = 0x0, PREP             = 0x1, WAIT_FILL  = 0x2, FILLING  = 0x3,
                  WAIT_IPORT_OPEN  = 0x4, WAIT_OPORT_OPEN  = 0x5, WAIT_DRAIN = 0x6, DRAINING = 0x7,
                  WAIT_IPORT_CLOSE = 0x8, WAIT_OPORT_CLOSE = 0x9, WAIT_USER  = 0xA;
                  
  initial begin
    count = 0;
  end
  
  always @ (posedge clock) begin
    case (PS) 
    
      /* INTIAL CONDITION */
      INIT: begin
        if (arrive) NS = PREP;
        else if (iport) NS = WAIT_USER;
        else NS = INIT;
      end
      
      /* PREP CONDITION */
      PREP: begin
        if (count[25]) begin 
          NS = WAIT_FILL;
          ount <= 0x0;
        end
        else begin
          NS = PREP;
          count <= count + 0x1;
        end
        
      /* WAITING TO FILL CONDITION */
      WAIT_FILL: begin
      
      end
      
      /* FILLING CONDITION*/
      FILLING: begin
      
      end
      
      /* WAITING FOR INNER PORT TO OPEN */
      WAIT_IPORT_OPEN: begin
      
      end
      
      /* WAITING FOR OUTER PORT TO OPEN */
      WAIT_OPORT_CLOSE: begin
      
      end
      
      
      
      
    
      default: NS = 4'bxxxx;
    endcase
  end
    
  
//	reg[26:0] tBase; //  system timebase
//	wire slow_clk, inv_q;
//	
//	always @(posedge init_clk) tBase <= tBase + 1'b1; 	         //  build the timebase
//	
//	D_FF time_flip (.q(slow_clk), .qBar(inv_q), .D(inv_q), .clk(tBase[24]), .rst(KEY));  //  uses system clock / 2^19 ~= 10 cycles per seco
  
  
  

endmodule