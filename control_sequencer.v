module control_sequencer(clk, opcode, rst, con_word);
	input clk;
    input rst;
    input [3:0]opcode;
    reg [5:0] count;
    output reg [11:0] con_word = 12'h000;
    // Initialize the counter
    initial count = 6'b000000;

    // Shift the bits on each clock cycle
    always @(negedge clk) begin
        if (rst) begin
            count <= 6'b000001;
        end 
		else begin
            count <= count << 1;
            if (count == 6'b000000) begin
                count <= 6'b000001;
            end
        end
    end

    // Add conditions for every state of the counter
    always @(count) begin
        case (count)
            6'b000001: // Condition for state 1
			begin
				//con_word = 12'b010111100011;5
				con_word = 12'h5E3;
			
			end
			
			6'b000010: // Condition for state 2
            begin
				con_word = 12'hBE3;
			end
			
			6'b000100: // Condition for state 3
            begin
				con_word = 12'h263;
			end
			
			6'b001000: // Condition for state 4
            begin
				if(opcode == 4'b0000) //LDA
					con_word = 12'h1A3;
					
				else if(opcode == 4'b0001) //ADD
					con_word = 12'h1A3;
					
				else if(opcode == 4'b0010) //SUB
					con_word = 12'h1A3;
					
				else if(opcode == 4'b1110) //OUT
					con_word = 12'h3F2;
				
				else // HALT
					con_word = 12'h3E3; 
			end
			
			6'b010000: // Condition for state 5
            begin
				
				if(opcode == 4'b0000) //LDA
					con_word = 12'h2C3;
					
				else if(opcode == 4'b0001)//ADD
					con_word = 12'h2E1;
					
				else if(opcode == 4'b0010) //SUB
					con_word = 12'h2E1;
					
				else if(opcode == 4'b1110) // OUT
					con_word = 12'h3E3;
				
				else //HALT
					con_word = 12'h3E3; 
			end
			
			6'b100000: // Condition for state 6
            begin
				
				if(opcode == 4'b0000) //LDA
					con_word = 12'h3E3;
					
				else if(opcode == 4'b0001) //ADD
					con_word = 12'h3C7;
					
				else if(opcode == 4'b0010) //SUB
					con_word = 12'h3CF;
					
				else if(opcode == 4'b1110) // OUT
					con_word = 12'h3E3;
				
				else  //HALT
					con_word = 12'h3E3;
			end
			
			default: // Default condition
            begin
				con_word = 12'h3E3;
			end
			
		endcase
    end
endmodule
