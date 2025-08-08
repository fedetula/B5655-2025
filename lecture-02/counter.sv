module counter #(
    parameter N = 4  // Default to 4 bits, but can be overridden
) (
    input  logic clk,      // Clock
    input  logic reset,    // Active-high synchronous reset
    input  logic enable,   // Active-high count enable
    output logic [N-1:0] count  // N-bit counter output
);

    always_ff @(posedge clk) begin
        if (reset) begin
            count <= '0;           // Reset to 0
        end else if (enable) begin
            count <= count + 1;     // Increment when enabled
        end
    end

endmodule
