module Interface(input logic a, b, c, d, output logic [6:0] salida);
  // Se instancian señales de salida del primer modulo
	logic [3:0] resultado;
  // Lógica para formar el array resultado
  always_comb begin
    resultado[3:0] = {a, b, c, d};  // Concatenación de v, w, x, y, z en resultado[4:0]
  end

  // Instancia del segundo módulo (segmentos)
  Selector myselector (
    .selection(resultado),
    .seg(salida)
  );
endmodule