module top;

	reg CLK;
	reg CLR;
	
	//PC Params
	reg Cp;
	reg Ep;	
	wire [3:0]pc_out;

	//MAR Params
	reg Lm;
	reg [3:0]mar_in;
	wire [7:0]mar_out;
	
	//Bus Params
	reg [7:0]bus_in;
	wire [7:0]bus_out;
	
	//RAM Params
	reg CE;
	wire [7:0]data_out;
	
	pc my_pc(.CLK(CLK), .CLR(CLR), .Cp(Cp), .Ep(Ep), .out(pc_out), .value(pc_out));		
	mar my_mar(.Lm(Lm), .CLK(CLK), .mar_in(bus_out), .mar_out(mar_out));
	bus my_bus(.bus_in(pc_out), .bus_out(bus_out));
	ram my_ram(.CLK(CLK), .CE(CE), .address(mar_out), .data_out(data_out));
	
	always #5 CLK = ~CLK;  //clock generation
	
	initial begin
		$readmemb("data.bin", my_ram.ram_block);
		//clk = 1;
		CLK = 1;
		CLR = 0;
		Cp = 1;
		Ep = 1;
		Lm = 0;
		CE = 0;
		
		
	end

endmodule

