module multiplicador #(parameter N = 4)
    (
     input logic [N-1:0] a, b,
     output logic [2*N-1:0] result
    );

    // Declare internal signals
    logic [N-1:0] partial_products [0:N-1];

    // Generate partial products
    generate
        genvar i, j;
        for (i = 0; i < N; i++) begin : PARTIAL_PRODUCT_GEN
            assign partial_products[i] = {N{i{1'b0}}, a} & (b[i] ? {N{1'b0}, a} : 0);
        end
    endgenerate

    // Add partial products
    always_comb begin
        result = 0;
        for (int i = 0; i < N; i++) begin
            result += partial_products[i] << i;
        end
    end

endmodule