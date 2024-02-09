module ir(Li, Ei, RST, CLK, ir_in, ir_out);
	
	input Li, Ei, CLK, RST;
	
	input [7:0] ir_in;
	output [7:0] ir_out;
	
	reg [7:0] ir_val;
	
	always@(posedge CLK) begin
		
		if (RST) begin
			ir_val = 8'b0;	
		end
		
		if(~Li) begin
			ir_val = ir_in;
			
		end
	end
	
	assign ir_out = ir_val;
	
endmodule

