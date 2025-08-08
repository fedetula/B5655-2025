module alu_tb;

    // Test with N=4 (default)
    logic [3:0] in1_4bit, in2_4bit, out_4bit;
    logic sel_4bit;
    
    alu #(4) alu_4bit (
        .in1(in1_4bit),
        .in2(in2_4bit),
        .sel(sel_4bit),
        .out(out_4bit)
    );

    // Test with N=8
    logic [7:0] in1_8bit, in2_8bit, out_8bit;
    logic sel_8bit;
    
    alu #(8) alu_8bit (
        .in1(in1_8bit),
        .in2(in2_8bit),
        .sel(sel_8bit),
        .out(out_8bit)
    );

    initial begin
        // Open VCD dump file for waveform viewing
        $dumpfile("alu_waveforms.vcd");
        $dumpvars(0, alu_tb);

        // Test 4-bit ALU
        $display("Testing 4-bit ALU:");
        sel_4bit = 0; // Addition
        in1_4bit = 4'b0011; // 3
        in2_4bit = 4'b0101; // 5
        #10;
        $display("  %0d + %0d = %0d", in1_4bit, in2_4bit, out_4bit);

        sel_4bit = 1; // Subtraction
        in1_4bit = 4'b1000; // 8
        in2_4bit = 4'b0011; // 3
        #10;
        $display("  %0d - %0d = %0d", in1_4bit, in2_4bit, out_4bit);

        // Test 8-bit ALU
        $display("\nTesting 8-bit ALU:");
        sel_8bit = 0; // Addition
        in1_8bit = 8'd100;
        in2_8bit = 8'd50;
        #10;
        $display("  %0d + %0d = %0d", in1_8bit, in2_8bit, out_8bit);

        sel_8bit = 1; // Subtraction
        in1_8bit = 8'd200;
        in2_8bit = 8'd75;
        #10;
        $display("  %0d - %0d = %0d", in1_8bit, in2_8bit, out_8bit);

        // Test edge cases (overflow)
        $display("\nTesting Edge Cases (4-bit):");
        sel_4bit = 0; // Addition (overflow)
        in1_4bit = 4'b1111; // 15
        in2_4bit = 4'b0001; // 1
        #10;
        $display("  15 + 1 = %0d (overflow truncated)", out_4bit);

        sel_4bit = 1; // Subtraction (underflow)
        in1_4bit = 4'b0000; // 0
        in2_4bit = 4'b0001; // 1
        #10;
        $display("  0 - 1 = %0d (underflow truncated)", out_4bit);

        $display("\nAll tests completed!");
        $finish;
    end

endmodule
