module multiplicador_tb;

  // Parámetros
  localparam BIT = 4;

  // Señales de entrada
  logic [BIT-1:0] num1;
  logic [BIT-1:0] num2;

  // Señales de salida
  logic [2*BIT-1:0] Result;
  logic OFLOW;

  // Instancia del módulo multiplicador
  multiplicador #(BIT) uut (
    .num1(num1),
    .num2(num2),
    .Result(Result),
    .OFLOW(OFLOW)
  );

  // Generación  de prueba
  initial begin
    num1 = 4'b0100;  // 
    num2 = 4'b0010;

    // Espera un tiempo para que el resultado sea válido
    #10;

    // Imprime los resultados
    $display("Resultado: %b", Result);
    $display("Overflow: %b", OFLOW);

    $finish;
  end

endmodule

