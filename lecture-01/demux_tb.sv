`timescale 1ns/1ps

module demux_tb;

    // Testbench signals
    logic [1:0] in;
    logic sel;
    logic out;

    // Instantiate the demux module
    demux uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("demux_tb.vcd");
        $dumpvars(0, demux_tb);
    end

    // Testbench procedure
    initial begin
        // Display signal changes
        $monitor("Time: %0t | sel = %b | in = %b | out = %b", $time, sel, in, out);

        // Test Case 1: sel = 0, in = 2'b00
        sel = 1'b0; in = 2'b00;
        #10;

        // Test Case 2: sel = 0, in = 2'b01
        sel = 1'b0; in = 2'b01;
        #10;

        // Test Case 3: sel = 1, in = 2'b10
        sel = 1'b1; in = 2'b10;
        #10;

        // Test Case 4: sel = 1, in = 2'b11
        sel = 1'b1; in = 2'b11;
        #10;

        // Finish the simulation
        $finish;
    end

endmodule
