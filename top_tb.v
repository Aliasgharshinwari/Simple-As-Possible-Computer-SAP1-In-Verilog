module top_tb();

	reg CLK = 0;
	reg CLR = 0;
	
	
	//PC Params
	wire Cp, Ep;	
	wire [3:0]pc_out;
	wire [7:0]bus;

	//MAR Params
	wire Lm;
	wire [7:0]mar_in;
	wire [7:0]mar_out;
	
	//Bus Params
	wire [7:0]bus_in;
	wire [7:0]bus_out;
	
	//RAM Params
	wire CE;
	wire [7:0]data_out;
	
	//IR Params
	wire Li, Ei;
	wire [3:0]ir_out;
	wire [7:0]ir_val;
	
	//ALU Params
	wire Su, Eu;
	wire [7:0] ALU_out;
	
	//AC Params
	wire La, Ea;
	
	//Out Reg Params
	wire Lo;
	
	//Reg B Params
	wire Lb;
	wire [7:0] b_out;
	
	//CON Params
	wire [11:0] con_word;
	
	pc my_pc(.CLK(CLK), .CLR(CLR), .Cp(Cp), .Ep(Ep), .out(bus), .value(pc_out));		
	mar my_mar(.Lm(Lm), .CLK(CLK), .mar_in(mar_in), .mar_out(mar_out));
	ram my_ram(.CLK(CLK), .CE(CE), .address(bus[3:0]), .data_out(data_out));
	//ir my_ir(.Li(Li), .Ei(Ei), .RST(CLR), .CLK(CLK), .ir_in(data_out), .ir_val(ir_val), .ir_out(ir_out),.opcode(opcode));
	control_sequencer my_cu(.clk(CLK), .rst(RST), .opcode(opcode),.con_word(con_word) );


	//ac my_ac(.CLK(CLK), .La(La), .Ea(Ea), .busW(bus_out), .ALU(ALU_out));
	//reg_b my_reg_b(.Lb(Lb), .CLK(CLK), .reg_in(bus_out), .reg_out(b_out));
	//alu my_alu(.Su(Su), .Eu(Eu), .A(ALU), .B(b_out), .Out(ALU_out), .BusW(bus_out));
	//control_sequencer my_cu(.clk(CLK), .rst(RST), .opcode(opcode),.con_word({Cp, Ep, Lm,	CE, Li, Ei, La, Ea, Su, Eu, Lb, Lo}) );
	bus my_bus(.bus_in(bus_in), .bus_out(bus_out));
	
	//assign bus = mar_out;
	
	assign Cp = con_word[11];
	assign Ep = con_word[10];
	assign Lm = con_word[9];
	assign CE = con_word[8];
	assign Li = con_word[7];
	assign Ei = con_word[6];
	assign La = con_word[5];
	assign Ea = con_word[4];
	assign Su = con_word[3];
	assign Eu = con_word[2];
	assign Lb = con_word[1];
	assign Lo = con_word[0];
	
	always #5 CLK = ~CLK;  //clock generation
	
	initial begin
		$readmemb("data.bin", my_ram.ram_block);
		//CLR = 0;
		//Cp = 0;
		//Ep = 1;//Enabled
		//Lm = 0;//Enabled
		//CE = 1;
		//Li = 1;
		//Ei = 1;
		//La = 1;
		//Ea = 0;
		//Su = 0;
		//Eu = 0;
		//bus_en = 1;
		//
		//#10
		//CLR = 0;
		//Cp = 1;//Enabled
		//Ep = 0;
		//Lm = 1;
		//CE = 1;
		//Li = 1;
		//Ei = 1;
		//La = 1;
		//Ea = 0;
		//Su = 0;
		//Eu = 0;
		//bus_en = 0;		
		
		//#10
		//CLR = 0;
		//Cp = 0;
		//Ep = 0;
		//Lm = 1;
		//CE = 0;//Enabled
		//Li = 0;//Enabled
		//Ei = 1;
		//La = 1;
		//Ea = 0;
		//Su = 0;
		//Eu = 0;
		//bus_en = 1;		
		
	end

endmodule


