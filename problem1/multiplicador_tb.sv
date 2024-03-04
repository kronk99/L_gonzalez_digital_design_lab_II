module multiplicador_tb;

    // Parameters
    parameter N = 8;
    
    // Signals
    logic [N-1:0] a, b;
    logic [2*N-1:0] result;
    
    // Instantiate the multiplier module
    multiplicador #(N) dut (
        .a(a),
        .b(b),
        .result(result)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        a = 8'h0A; // Example value for a
        b = 8'h05; // Example value for b
        
        // Apply stimulus
        #5;
        $display("Multiplying a = %h, b = %h", a, b);
        
        // Perform multiplication
        #5;
        $display("Result = %h", result);
        
        // End simulation
        $finish;
    end

endmodule
