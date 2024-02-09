module ram( CLK, CE, address, data_out);

	input CLK;
	input CE;
    input [3:0]address;
	
    output [7:0]data_out;
	
	reg [7:0]ram_block[0:15];
				
	assign data_out = ram_block[address];

endmodule
