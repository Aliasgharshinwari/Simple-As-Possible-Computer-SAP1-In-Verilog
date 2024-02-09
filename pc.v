module pc(CLK, CLR, Cp, Ep, out);

	input CLR;
	input CLK;	
	input Cp;
	input Ep;
	
	reg [3:0]value = 4'b0;
	output [3:0]out;
	
	always @(negedge CLK) begin
		
		if (CLR) 
			value <= 4'b0000;
		
		else if (Cp)
			value <= value + 1;

		
	end
		
		assign	out = value;

//	always @(Ep) begin	
//	end
	
endmodule
