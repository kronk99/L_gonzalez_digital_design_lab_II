module Calculator_con_altera #(parameter N = 8)(
    input clk,
    input reset,
    input [3:0] op_select,
    input [N-1:0] operandou, 
    input [N-1:0] operandou2,
    output [2*N-1:0] resultadito,
	 output [3:0] bandera
);

    // Instancia del registro
	 
    logic [N-1:0] reg_out_data1;
    logic [2*N-1:0] resultados;  // Corregir aquí
    logic [N-1:0] reg_out_data2;
    logic [3:0] reg_input_select;
	 logic [3:0] flags;
	 //


    // Instancias de módulos
    Registrovariable #(.N(N)) registro(
		  .selector(reg_input_select),
        .operand1(operandou),
        .operand2(operandou2),
		  .clk(clk),
        .reset(reset),
        .Roperand1(op_select),
        .Roperand2(reg_out_data1),
        .Rselector(reg_out_data2)
    );

    Calculator #(N) mycalculator(
        .op_select(reg_input_select),
        .operand1(reg_out_data1),
        .operand2(reg_out_data2),
		  .banderas(flags),
        .resultado(resultados)
    );

    Registrovariable2 #(.N(N)) registro2(
        .result(resultados),
		  .clk(clk),
        .rst(reset),
		  .flags(bandera),
        .regresult(resultadito)
    );

endmodule