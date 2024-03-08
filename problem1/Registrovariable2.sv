module Registrovariable2  #(parameter N=4)(
                                                     input [2*N-1:0] result,
																	  input clk,
																	  input rst,
																	  input [3:0] flags,
																	  output reg [3:0] flag,
                                                     output reg [2*N-1:0] regresult
																	  );

    always @(negedge clk or posedge rst) begin
        if(rst) begin
            regresult <= 0;
				flag[0]<=0;
				flag[1]<=0;
				flag[2]<=0;
				flag[3]<=0;
				
            end
        else begin
            regresult <= result;
				flag = flags;
            end
    end

endmodule