module Selector(input logic [3:0] selection, output logic [6:0] seg);
  always_comb begin 
    case (selection)
      4'b0000: seg = 7'b0010010; //Suma
      4'b0001: seg = 7'b0101111; //Resta
		4'b0010: seg = 7'b0001001; //Multiplicacion
		4'b0011: seg = 7'b0110110; //Division
		4'b0100: seg = 7'b1001001; //Modulo
		4'b0101: seg = 7'b1101011; //And
		4'b0110: seg = 7'b1011011; //Or
		4'b0111: seg = 7'b0011011;//Xor
		4'b1000: seg = 7'b1100111; //Shift L
      4'b1001: seg = 7'b1110011; //Shift R
		4'b1010: seg = 7'b1101011;  //And
		4'b1011: seg = 7'b1011011; //Or
		4'b1100: seg = 7'b0011011; //Xor
		4'b1101: seg = 7'b1100111; //Shift L
		4'b1110: seg = 7'b1110011; //Shift R
		4'b1111: seg = 7'b0010010; //Suma
      default: seg = 7'b1111111;
    endcase
  end
endmodule