module Calculator //Full module that uses a multiplexor

	#(parameter N = 4)(
    input [3:0] op_select, //Selects the operation using 4 bits 
    input [N-1:0] operand1, 
    input [N-1:0] operand2,
    output logic [2*N-1:0] resultado
);

    // Declare instances of different calculator modules
	 
	 logic [N-1:0] res_s;
	 logic [N-1:0] res_r;
	 logic [2*N-1:0] res_m;
	 logic [N-1:0] res_d;
	 logic [N-1:0] res_md;
	 logic [N-1:0] res_and;
	 logic [N-1:0] res_or;
	 logic [N-1:0] res_xor;
	 logic [N:0] res_sl;
	 logic [N-1:0] res_sr;
	 
	 sumador #(N) mysumador( .num1(operand1), .num2(operand2), .result(res_s)); //Addition
	 restador #(N) myrestador(.num1(operand1), .num2(operand2), .Result(res_r)); //Substraction
	 multiplicador #(N) mymultiplicador(.a(operand1), .b(operand2), .result(res_m)); //Multiplication
	 Divisor #(N) mydivisor(.dividend(operand1), .divisor(operand2), .quotient(res_d), .remainder(res_md)); //Division
	 //Module
	 andoperation #(N) myand(.a(operand1), .b(operand2), .result(res_and)); //AND
	 oroperator #(N) myor(.a(operand1), .b(operand2), .result(res_or)); //OR
	 xoroperator #(N) myxor(.a(operand1), .b(operand2), .result(res_xor)); //XOR
	 shiftleft #(N) myshiftl(.a(operand1), .b(operand2), .result(res_sl)); //Shift left
	 shiftright #(N) myshiftr(.a(operand1), .b(operand2), .result(res_sr)); //Shift left
	
	
	//This creates the selection based on op_select, after number 10 repeats some operations
    always_comb begin
        case(op_select)
            4'b0000: resultado = res_s; // Addition
            4'b0001: resultado = res_r; // Subtraction
            4'b0010: resultado = res_m; // Multiplication
            4'b0011: resultado = res_d; // Division
				4'b0100: resultado = res_md; // Module
            4'b0101: resultado = res_and; // AND
            4'b0110: resultado = res_or; // OR
            4'b0111: resultado = res_xor; // XOR
				4'b1000: resultado = res_sl; // Shift left
            4'b1001: resultado = res_sr; // Shiftright
            4'b1010: resultado = res_and; // AND
            4'b1011: resultado = res_or; // OR
				4'b1100: resultado = res_xor; // XOR
            4'b1101: resultado = res_sl; // Shift left
            4'b1110: resultado = res_sr; // Shiftright
            4'b1111: resultado = res_s; // Addition
            default: resultado = 8'h00; // Default case 
        endcase
    end

endmodule
