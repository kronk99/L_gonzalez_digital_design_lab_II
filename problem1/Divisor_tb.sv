`timescale 1ns / 1ps

module Divisor_tb;

  // Parámetros
  parameter CLOCK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

  // Señales
  logic [3:0] dividend;
  logic [3:0] divisor;
  logic [3:0] quotient;
  logic [3:0] remainder;

  // Instancia del módulo Divisor4Bits
  Divisor uut (
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );

  // Clock generation
  logic clock = 0;
  always #CLOCK_PERIOD clock = ~clock;

  // Testbench stimulus
  initial begin
    // Inicialización
    dividend = 15;  
    divisor = 2;

    // Enviar estímulos al módulo
    repeat (16) begin
		#5
      dividend = dividend;  
      divisor = divisor;  
    end

    // Mostrar resultados
    $display("Resultado de la división: %0d / %0d = %0d con resto %0d", uut.dividend, uut.divisor, uut.quotient, uut.remainder);

    // Finalizar simulación
    $finish;
  end

endmodule