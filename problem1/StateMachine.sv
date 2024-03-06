module StateMachine (
    input wire reset,      // Reset input
    input wire push_button, // Input signal that triggers state change
	 input logic a, b, c, d, //Inputs for the 
	 output reg [1:0] state, // Output representing current state
	 output logic [6:0] salida,
	 output reg led 
	 
);

// Define states
parameter Op_select = 2'b00;
parameter in_select = 2'b01;
parameter res_show = 2'b10;

logic [6:0] out1;
logic [6:0] out2;
logic [6:0] out3;

// Define state register
reg [1:0] next_state;
reg [1:0] current_state;

// Debounce parameters
parameter DEBOUNCE_TIME = 20; // Debounce time
reg [3:0] debounce_count;     // Counter for debounce

// LED blinking parameters
parameter BLINK_TIME = 50000; // Blink time in clock cycles
reg [15:0] blink_counter;      // Counter for LED blinking


// State machine logic

// State transition logic
always @* begin
    if (reset != 1'b1) begin
        next_state = Op_select; // Initialize to idle state on reset
    end else begin
        // Debounce logic
        if (push_button != 1'b1 && debounce_count < DEBOUNCE_TIME) begin
            debounce_count = debounce_count + 1;
        end else if (push_button == 1'b1) begin
            debounce_count = 0;
        end

        // State transition when the button is pressed and debounce is done
        if (debounce_count == DEBOUNCE_TIME && push_button) begin
            case (current_state)
                Op_select: begin
                    next_state = in_select;
                end
                in_select: begin
                    next_state = res_show;
                end
                res_show: begin
                    next_state = Op_select;
                end
                default: next_state = Op_select;
            endcase
        end
    end
end

// LED blinking logic
always @(posedge next_state or posedge reset) begin
    if (reset) begin
        led <= 1'b0; // Initialize LED off on reset
        blink_counter <= 0;
    end else begin
        // Blink the LED when there is a state change
        if (current_state != next_state) begin
            if (blink_counter < BLINK_TIME) begin
                led <= 1'b1; // Turn LED on
                blink_counter <= blink_counter + 1;
            end else if (blink_counter < BLINK_TIME * 2) begin
                led <= 1'b0; // Turn LED off
                blink_counter <= blink_counter + 1;
            end else begin
                blink_counter <= 0; // Reset blink counter
            end
        end
    end
end

//Instantiate the modules needed for the mux
Interface myinterface (
				.a(a), .b(b), .c(c), .d(d),
				.salida(out1)
				);
InputSelector myinputselector (.a(a),.b(b),.c(c),.d(d), .salida(out2));

// Module calls based on states
always @* begin
    case (current_state)
        Op_select: begin
            salida = out1;
            
        end
        in_select: begin
            // Call Interface2 module in state 1
				salida = out2;
            
        end
        res_show: begin
            // Call Interface3 module in state 2
            salida = out1;
        end
        default: begin
            salida = out1;
        end
    endcase
end

always @(posedge next_state) begin
    current_state <= next_state; // Update current state on transition
end
// Assign current state to output
assign state = current_state;

endmodule
