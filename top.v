module top();

	reg CLK;
	reg CLR;
	
	
	//PC Params
	wire Cp, Ep;	
	wire [3:0]pc_out;

	//MAR Params
	wire Lm;
	wire [3:0]mar_in;
	wire [3:0]mar_out;
	
	//RAM Params
	wire CE;
	wire [7:0]data_out;
	
	//IR Params
	wire Li, Ei;
	wire [7:0]ir_out;
	wire [3:0]opcode;
	
	//ALU Params
	wire Su, Eu;
	wire [7:0] ALU_out;
	
	//AC Params
	wire La, Ea;
	wire [7:0]acc_out;
	
	
	//Reg B Params
	wire Lb;
	wire [7:0] b_out;
	
	//Out Reg Params
	wire Lo;
	wire [7:0] o_out;
	
	//CON Params
	wire [11:0] con_word;
	reg [7:0]bus = 8'h00;

	control_sequencer my_cu(.clk(CLK), .rst(RST), .opcode(opcode),.con_word(con_word));
	pc my_pc(.CLK(CLK), .CLR(CLR), .Cp(Cp), .Ep(Ep), .out(pc_out));		
	mar my_mar(.Lm(Lm), .CLK(CLK), .mar_in(bus[3:0]), .mar_out(mar_out));
	ram my_ram(.CLK(CLK), .CE(CE), .address(mar_out), .data_out(data_out));
	ir my_ir(.Li(Li), .Ei(Ei), .RST(CLR), .CLK(CLK), .ir_in(bus), .ir_out(ir_out));
	ac my_ac(.CLK(CLK), .La(La), .Ea(Ea), .acc_in(bus), .acc_out(acc_out));
	reg_b my_reg_b(.Lb(Lb), .CLK(CLK), .reg_in(bus), .reg_out(b_out));
	alu my_alu(.Su(Su), .Eu(Eu), .A(acc_out), .B(b_out), .Out(ALU_out));
	output_register my_output_register(.CLK(CLK), .Lo(Lo), .o_in(bus), .o_out(o_out));
	//control_sequencer my_cu(.clk(CLK), .rst(RST), .opcode(opcode),.con_word({Cp, Ep, Lm,	CE, Li, Ei, La, Ea, Su, Eu, Lb, Lo}) );
	
	
	// assign Cp = con_word[11];
	// assign Ep = con_word[10];
	// assign Lm = con_word[9];
	// assign CE = con_word[8];
	// assign Li = con_word[7];
	// assign Ei = con_word[6];
	// assign La = con_word[5];
	// assign Ea = con_word[4];
	// assign Su = con_word[3];
	// assign Eu = con_word[2];
	// assign Lb = con_word[1];
	// assign Lo = con_word[0];
	
	assign {Cp, Ep, Lm, CE, Li, Ei, La, Ea, Su, Eu, Lb, Lo} = con_word;
	
	assign opcode = ir_out[7:4];
	
	always #5 CLK = ~CLK;  //clock generation
	
	always @(*) begin
		if (~Ei) begin
			bus = ir_out[3:0];
		end 
		
		else if (Eu) begin
			bus = ALU_out;
		end 
		
		else if (Ea) begin
			bus = acc_out;
		end 
		
		else if (~CE) begin
			bus = data_out;
		end 
		
		else if (Ep) begin
			bus = pc_out;
		end 
		
		else begin
			bus = 8'b0;
		end
		
	end
	
	initial begin
		$readmemb("data.bin", my_ram.ram_block);
		CLK = 0;
		CLR = 0;
		
	end

endmodule

