module reg_b(Lb, CLK, reg_in, reg_out);
	
	input Lb;
	input CLK;
	
	input [7:0] reg_in;
	output reg [7:0] reg_out;
	
	always@(posedge CLK) begin
		if (~Lb) begin
			reg_out <= reg_in;	
		end
	end
endmodule

