

module restador #(parameter N = 4) ( //Se utiliza para invertir el numero
    input logic [N-1:0] in,
    output logic [N-1:0] out
);

    logic [N-1:0] intermediate_out;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin: loop
            nand_d #(2) nand_inst (
                .a(in[i]),
                .b(1'b1),
                .y(intermediate_out[i])
            );
        end
    endgenerate
	
	 assign out = intermediate_out;
	
	

endmodule

module nand_d #(parameter WIDTH = 1) (
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);

    assign y = ~(a & b);

endmodule

