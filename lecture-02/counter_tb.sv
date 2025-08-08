module counter_tb;

    // Test with N=4 (default)
    logic clk;
    logic reset;
    logic enable;
    logic [3:0] count_4bit;

    counter #(4) dut_4bit (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count_4bit)
    );

    // Test with N=8
    logic [7:0] count_8bit;

    counter #(8) dut_8bit (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count_8bit)
    );

    // Clock generation (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize signals
        reset = 1;
        enable = 0;
        
        // Dump waveforms
        $dumpfile("counter_waveforms.vcd");
        $dumpvars(0, counter_tb);

        // Reset test
        #10;
        reset = 0;
        enable = 1;
        $display("Counter started (N=4, N=8)");

        // Let it count for 20 cycles
        #200;
        
        // Disable and test hold
        enable = 0;
        $display("Counter paused at 4-bit=%0d, 8-bit=%0d", count_4bit, count_8bit);
        #50;
        
        // Test reset while disabled
        reset = 1;
        #10;
        reset = 0;
        $display("Reset applied. 4-bit=%0d, 8-bit=%0d", count_4bit, count_8bit);
        
        // Final count
        enable = 1;
        #100;
        
        $display("Test complete. Final values: 4-bit=%0d, 8-bit=%0d", 
                count_4bit, count_8bit);
        $finish;
    end

endmodule