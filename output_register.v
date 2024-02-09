module output_register(CLK, Lo, o_in, o_out);

	input CLK, Lo;
    input [7:0] o_in;
    output [7:0] o_out;
	reg [7:0]o_val;
	
	always @(posedge CLK) begin
		
		if (~Lo) 
			o_val <= o_in;
	end
	
	assign o_out = o_val;
	
	
endmodule


