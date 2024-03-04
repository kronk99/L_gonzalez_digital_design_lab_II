module shiftright_tb;

    // Parameters
    parameter N = 8;
    
    // Signals
    logic [N-1:0] a, b;
    logic [N-1:0] result;
    
    // Instantiate the module
    shiftright #(N) shifterrmodule (
        .a(a),
        .b(b),
        .result(result)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        a = 8'b10010110; // Example value for a
        b = 8'b00000010; // Example value for b
        
        // Apply stimulus
        #20;
        $display("Result = %h", result);
        
        // End simulation
        $finish;
    end

endmodule