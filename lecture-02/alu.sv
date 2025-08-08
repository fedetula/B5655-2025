module alu #(
    parameter N = 4       // Default to 4 bits, but can be overridden
) (
    input  logic [N-1:0] in1,  // N-bit input 1
    input  logic [N-1:0] in2,  // N-bit input 2
    input  logic         sel,  // 0: add, 1: sub
    output logic [N-1:0] out   // N-bit output
);

    always_comb begin
        case (sel)
            1'b0: out = in1 + in2;  // Addition
            1'b1: out = in1 - in2;  // Subtraction
            default: out = '0;       // Default case (should never happen)
        endcase
    end

endmodule
