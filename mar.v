module mar(Lm, CLK, mar_in, mar_out);
	
	input Lm;
	input CLK;
	
	input [3:0] mar_in;
	output reg [3:0] mar_out;
	
	always@(posedge CLK) begin
		if (~Lm) 
			mar_out <= mar_in;	
		
	end
	
	
endmodule
