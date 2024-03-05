`timescale 1ns / 1ps

module Calculator_tb;

  // Parámetros
  parameter CLOCK_PERIOD = 10; // Periodo de reloj en unidades de tiempo
  parameter Nbits = 4;
  // Señales
  logic [3:0] selector;
  logic [Nbits-1:0] first;
  logic [Nbits-1:0] second;
  logic [2*Nbits-1:0] resu;

  // Instancia del módulo Divisor4Bits
  Calculator #(4) uut (
    .op_select(selector),
    .operand1(first),
    .operand2(second),
    .resultado(resu)
  );

  // Clock generation
  logic clock = 0;
  always #CLOCK_PERIOD clock = ~clock;

  // Testbench stimulus
  initial begin
     selector = 4'b0000;
       first = 4'b0001;
		 second = 4'b0001;
        #10; // Wait for 10 time units
        // Expected output: Inverted input
        $display("Input1: %b, Input2: %b, Output: %b, Carry %b", selector,first, second, resu);
        // Terminate the simulation
		  
		 selector = 4'b0001;
       first = 4'b0011;
		 second = 4'b0001;
        #10; // Wait for 10 time units
        // Expected output: Inverted input
        $display("Input1: %b, Input2: %b, Output: %b, Carry %b", selector,first, second, resu);
        // Terminate the simulation
		  
		  selector = 4'b0010;
       first = 4'b0011;
		 second = 4'b0011;
        #10; // Wait for 10 time units
        // Expected output: Inverted input
        $display("Input1: %b, Input2: %b, Output: %b, Carry %b", selector,first, second, resu);
        // Terminate the simulation
        $finish;
  end

endmodule