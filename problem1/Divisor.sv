module Divisor (

  input logic [3:0] dividend,
  input logic [3:0] divisor,
  output logic [3:0] quotient,
  output logic [3:0] remainder
);

  // Variables locales
  logic [3:0] temp_dividend;
  logic [3:0] temp_quotient;

  always_comb begin
    // Inicialización de variables locales
    temp_dividend = dividend;
    temp_quotient = 4'b0;
    
    // Bucle de división
    for (int i = 0; i < 16; i++) begin
      
      
      if (temp_dividend >= divisor) begin
        temp_dividend = temp_dividend - divisor;
        temp_quotient = temp_quotient + 1;
      end
    end

    // Asignación de resultados a las salidas
    quotient = temp_quotient;
    remainder = temp_dividend;
  end

endmodule