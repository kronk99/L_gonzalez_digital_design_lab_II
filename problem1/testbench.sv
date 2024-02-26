module testbench();
	parameter a=6;
	logic  [a-1:0] num1, num2;
	logic Cout;
	logic  [a-1:0] Resul;
	sumador #(a) misumador(num1, num2, Cout, Resul);
	initial begin 
	num1[a-1:0] =6'b111001;
	num2[a-1:0] =6'b100101;
	end
endmodule