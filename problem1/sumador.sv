module sumador #(parameter BITS= 4) (input logic [BITS-1:0] num1, num2, output logic
Cout, output logic [BITS-1:0] result); //pag 218 del libro sale el ejemplo en system verilog para parametrizar
//en los testbench  
	logic [BITS:0] Cin;
	logic [BITS-1:0] Couto, s;
	assign Cin[0] = 0;
	generate
		genvar i;
		for(i=0;i<BITS;i=i+1)begin: forloop
			sumador1bit misumador(.a(num1[i]),.b(num2[i]),.Cin(Cin[i]),.Cout(Couto[i]),.s(s[i]));
			assign result[i]=s[i];//
			assign Cin[i+1]=Couto[i];
		//supongo que el cout se queda como el ultimo resultado.
//buscar el generate para crear n sumadores de 1 bit
		end
  endgenerate
  assign Cout = Couto[BITS-1];
endmodule