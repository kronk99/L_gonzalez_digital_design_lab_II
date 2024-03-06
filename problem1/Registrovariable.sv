module Registrovariable  #(parameter N=4)(input [3:0] selector, 
                                                     input [N-1:0] operand1,operand2,
                                                     input clk, reset,
                                                     output reg [N-1:0] Roperand1, Roperand2,
                                                     output reg [3:0] Rselector);

    always @(posedge clk or posedge reset) begin

        if(reset) begin
            Roperand1 <= 0;
            Roperand2 <= 0;
            Rselector <= 0;
            end
        else begin
            Roperand1 <= operand1;
            Roperand2 <= operand2;
            Rselector <= Rselector;
            end
    end

endmodule
/*module Registrovariable #(parameter N = 4)(
    input logic clk,
    input logic reset,
    input logic [N-1:0] in_data1,
    input logic [N-1:0] in_data2,
    input logic [3:0] in_op_select,
    output logic [N-1:0] out_data1,
    output logic [N-1:0] out_data2,
    output logic [3:0] out_op_select
);

    // Registros internos
    logic [N-1:0] reg_data1;
    logic [N-1:0] reg_data2;
    logic [3:0] reg_op_select;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset) begin
            reg_data1 <= 0;
            reg_data2 <= 0;
            reg_op_select <= 0;
        end
        else begin
            reg_data1 <= in_data1;
            reg_data2 <= in_data2;
            reg_op_select <= in_op_select;
        end
    end

    assign out_data1 = reg_data1;
    assign out_data2 = reg_data2;
    assign out_op_select = reg_op_select;
endmodule*/