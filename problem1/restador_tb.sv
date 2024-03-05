
module restador_tb;

    // Parameters
    parameter N = 4;

    // Signals
    logic [N-1:0] in_signal;
	 logic [N-1:0] in_signal2;
    logic [N-1:0] out_signal;
	 logic carryout;

    // Instantiate the inverter module
    restador #(N) myrestador (
        .num1(in_signal),
		  .num2(in_signal2),
		  .Carryout(carryout),
        .Result(out_signal)
    );

    // Stimulus
    initial begin
        in_signal = 4'b1010;
        in_signal2 = 4'b0001;
        #10; // Wait for 10 time units
        // Expected output: Inverted input
        $display("Input1: %b, Input2: %b, Output: %b, Carry %b", in_signal,in_signal2, out_signal, carryout);
        // Terminate the simulation
        $finish;
    end

endmodule


