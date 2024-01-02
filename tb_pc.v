module tb_pc();
	
	reg CLR;
	reg Clk;
	reg Cp;
	reg Ep;
	
	wire [3:0]out; 
	
	pc my_pc(.CLR(CLR), .CLK(Clk), .Cp(Cp), .Ep(Ep), .out(out));

	// Clock generation
    always #5 Clk = ~Clk;
	
	initial begin

	CLR = 1;
	Cp = 1;
	Ep = 1;
	Clk = 1;
	#10	

	CLR = 0;
	//Clk = 0;
	#10	
	
	CLR = 0;
	//Clk = 1;
	Ep = 0;
	#10	
	
	CLR = 0;
	//Clk = 0;
	#10	
	
	CLR = 1;
	Cp = 0;
	Ep = 1;
	//Clk = 1;
	#10	
	
	CLR = 0;
	
	end
	

endmodule




