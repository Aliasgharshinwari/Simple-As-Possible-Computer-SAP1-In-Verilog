module mar(Lm, CLK, mar_in, mar_out);
	
	input Lm;
	input CLK;
	
	input [3:0] mar_in;
	output reg [7:0] mar_out;
	
	always@(posedge CLK) begin
		if (~Lm) begin
			mar_out <= mar_in;	
		end
	end
endmodule
