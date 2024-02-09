module ac(CLK, La, Ea, acc_in, acc_out);

	input CLK, La, Ea;
    input [7:0] acc_in;
    output [7:0] acc_out;
	reg [7:0]acc_val;
	
	always @(posedge CLK) begin
		
		if (~La) 
			acc_val <= acc_in;
	
	end
	assign acc_out = acc_val;
	
	
endmodule

