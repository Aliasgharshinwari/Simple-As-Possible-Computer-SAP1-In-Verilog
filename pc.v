module pc(Clk, rst, out);

	input rst;
	input Clk;	
	
	output reg [3:0]out = 0;
	
	
	always@(negedge Clk)

	if (rst)
		
		out <= 1'b0;
		
	else	
		out <= out + 1;
	
endmodule
