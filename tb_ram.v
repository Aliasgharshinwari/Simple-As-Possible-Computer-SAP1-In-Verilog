module ram_tb;

	reg clk;
	reg write_enable;
	reg rst;
	wire [3:0]pc_out;
	
	reg [3:0]address;
	reg [7:0]data_in;
	wire [7:0]data_out;

	ram uut(clk,write_enable,address,data_in,data_out);
	pc my_pc(clk, rst, pc_out);

	always #5 clk = ~clk;  //clock generation
	//always #5 address = pc_out;

	initial begin
		clk = 1;
		data_in = 8'h56;
		write_enable = 0;
		rst = 0;
		address = pc_out;
		// Load data from a binary file
		//$readmemb("data.bin", uut.ram_block);

		
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
