module InputSelector(input logic a, b, c, d, output logic [3:0] num, output logic [6:0] salida);
    // Se instancian señales de salida del primer modulo
  // se intancian las entradas de entrada del primer modulo

  // Lógica para formar el array resultado
  always_comb begin
    num = {a, b, c, d};  // Concatenación
  end

  // Instancia del segundo módulo (segmentos)
  Segmentos miSegmento (
    .code(num),
    .seg(salida)
  );
  
  
endmodule