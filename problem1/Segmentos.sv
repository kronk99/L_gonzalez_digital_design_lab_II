module Segmentos(input logic [3:0] code, output logic [6:0] seg);
  always_comb begin 
    case (code)
      4'b0000: seg = 7'b1000000; //numero 0
      4'b0001: seg = 7'b1111001; //numero 1
      4'b0010: seg = 7'b0100100;	//numero2
      4'b0011: seg = 7'b0110000; //numero3
      4'b0100: seg = 7'b0011001; //num 4
      4'b0101: seg = 7'b0010010; //num5
      4'b0110: seg = 7'b0000010;//num6
      4'b0111: seg = 7'b1111000;//num7
      4'b1000: seg = 7'b0000000;//num8
      4'b1001: seg = 7'b0011000;//num9
		4'b1010: seg = 7'b0001000;//A hex 10
		4'b1011: seg = 7'b0000011;//B hex 11
		4'b1100: seg = 7'b1000110;//C    12
		4'b1101: seg = 7'b0100001;//D    13
		4'b1110: seg = 7'b0000110;//E    14
		4'b1111: seg = 7'b0001110;//F 15
      default: seg = 7'b1111111;
    endcase
  end
endmodule