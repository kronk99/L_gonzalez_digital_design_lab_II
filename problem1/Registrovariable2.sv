module Registrovariable2  #(parameter N=4)(
                                                     input [2*N-1:0] result,
																	  input clk,
																	  input rst,
                                                     output reg [2*N-1:0] regresult);

    always @(negedge clk or posedge rst) begin
        if(rst) begin
            regresult <= 0;
            end
        else begin
            regresult <= result;
            end
    end

endmodule