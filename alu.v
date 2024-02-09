module alu(Su, Eu, A, B, Out);
	
	input Su, Eu;
	input [7:0]A;
	input [7:0]B;
	
	output [7:0]Out;
	
	assign Out = (Su) ? A - B : A + B;
	
endmodule
