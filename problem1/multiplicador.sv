module multiplicador #(parameter N = 8)
    (
     input logic [N-1:0] a,
     input logic [N-1:0] b,
     output logic [2*N-1:0] result
    );

    // Declare internal signals
    logic [2*N-1:0] temp_result;

    // Perform multiplication using the * operator
    always_comb begin
        temp_result = a * b;
    end

    // Assign result
    assign result = temp_result;

endmodule
