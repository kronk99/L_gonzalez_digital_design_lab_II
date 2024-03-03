
module restador_tb;

    // Parameters
    parameter N = 4;

    // Signals
    logic [N-1:0] in_signal;
    logic [N-1:0] out_signal;

    // Instantiate the inverter module
    restador #(N) inverter (
        .in(in_signal),
        .out(out_signal)
    );

    // Stimulus
    initial begin
        // Test case 1: All bits are 0
        in_signal = 4'b0000;
        #10; // Wait for 10 time units
        // Expected output: All bits should be 1
        $display("Input: %b, Output: %b", in_signal, out_signal);

        // Test case 2: All bits are 1
        in_signal = 4'b1111;
        #10; // Wait for 10 time units
        // Expected output: All bits should be 0
        $display("Input: %b, Output: %b", in_signal, out_signal);

        // Test case 3: Random input
        in_signal = $random;
        #10; // Wait for 10 time units
        // Expected output: Inverted input
        $display("Input: %b, Output: %b", in_signal, out_signal);

        // Terminate the simulation
        $finish;
    end

endmodule