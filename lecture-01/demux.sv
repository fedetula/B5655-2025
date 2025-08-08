module demux(
    input logic [1:0] in,
    input logic sel, 
    output logic out
);

    always_comb begin
        case (sel) 
            1'b0: out = in[0];
            1'b1: out = in[1];
            default: out = 1'bx; // should not happen
        endcase
    end

endmodule


// Verilog -> C
// always

// SystemVerilog -> C++
// always_ff | always_comb | always_latch

// always_comb <=> always @*


// <template N> 
