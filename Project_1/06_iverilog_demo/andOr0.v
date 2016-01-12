// Compute the logical AND and OR of inputs A and B.
module AndOr(AandB, AorB, A, B);
 output [1:0] AandB, AorB;
 input [1:0] A, B;
 and myAnd [1:0] (AandB[1:0], A[1:0], B[1:0]);
 or myOr [1:0] (AorB[1:0], A[1:0], B[1:0]);
endmodule

// file for gtkwave
 initial
 begin
// these two files support gtkwave and are required
 $dumpfile("andor0.vcd");
 $dumpvars(1,myAndOr);
 end