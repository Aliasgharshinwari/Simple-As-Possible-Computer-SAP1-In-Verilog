module bus(bus_in, bus_out);

	input [7:0]bus_in;
	output [7:0]bus_out;
	
	assign bus_out = bus_in;
endmodule
