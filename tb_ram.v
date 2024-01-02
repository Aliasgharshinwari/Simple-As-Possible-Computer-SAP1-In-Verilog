module ram_tb;

	reg CLK;
	reg write_enable;
	reg CLR;
	reg Cp;
	reg Ep;
	
	wire [3:0]pc_out;
	
	reg [3:0]address;
	reg [7:0]data_in;
	wire [7:0]data_out;

	ram uut(clk,write_enable,address,data_in,data_out);
	pc my_pc(CLK, CLR, Cp, Ep, pc_out);

	always #5 CLK = ~CLK;  //clock generation
	always #5 address = pc_out;

	initial begin
		$readmemb("data.bin", uut.ram_block);
		//clk = 1;
		data_in = 8'h56;
		write_enable = 0;
		CLR = 0;
		address = pc_out;
		
		// Load data from a binary file
		
//		#10
//		write_enable = 1;
	
//		#10		
//		write_enable = 0;
//		data_in = 8'h36;

//		#10
//		write_enable = 1;

//		#10 
//		write_enable = 0;

//		#10
//		address = pc_out;

	end

endmodule
