module pc(CLK, CLR, Cp, Ep, value, out);

	input CLR;
	input CLK;	
	input Cp;
	input Ep;
	
	output [3:0]value;
	output reg [3:0]out = 4'b0;
	
	always@(negedge CLK) begin

		if(CLR && Ep) begin
			out <= 4'b0;
		end
		
		else if (Cp && Ep) begin
			out <= out + 1;	
		end
		
	end
//		assign out = value;
		
endmodule
