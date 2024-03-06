module StateMachine (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    input wire input_signal, // Input signal that triggers state change
    output reg [1:0] state // Output representing current state
);

// Define states
parameter Op_select = 2'b00;
parameter in_select = 2'b01;
parameter res_show = 2'b10;

// Define state register
reg [1:0] next_state;
reg [1:0] current_state;

// State machine logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= Op_select; // Initialize to idle state on reset
    end else begin
        current_state <= next_state; // Update current state
    end
end

// State transition logic
always @(*) begin
    case (current_state)
        Op_select: begin
            if (input_signal) begin
                next_state = in_select; // Transition to state 1 if input_signal is high
            end else begin
                next_state = Op_select; // Stay in idle state otherwise
            end
        end
        in_select: begin
            if (input_signal) begin
                next_state = res_show; // Transition to state 2 if input_signal is high
            end else begin
                next_state = in_select; // Stay in state 1 otherwise
            end
        end
        res_show: begin
            if (!input_signal) begin
                next_state = Op_select; // Transition back to idle state if input_signal goes low
            end else begin
                next_state = res_show; // Stay in state 2 otherwise
            end
        end
        default: next_state = Op_select; // Default to idle state
    endcase
end

// Module calls based on states
always @(posedge clk) begin
    case (current_state)
        Op_select: begin
            // Call Interface1 module in idle state
            Interface1();
        end
        in_select: begin
            // Call Interface2 module in state 1
            Interface2();
        end
        res_show: begin
            // Call Interface3 module in state 2
            Interface3();
        end
        default: begin
            // No module call in default state
        end
    endcase
end

// Assign current state to output
assign state = current_state;

endmodule
