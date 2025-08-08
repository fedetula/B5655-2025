module regfile (
    input  logic        clk,           // Clock
    input  logic        reset,         // Synchronous reset (optional)
    input  logic        write_en,      // Write enable (1=write)
    input  logic [4:0]  read_addr1,    // Read address 1 (5-bit for 32 regs)
    input  logic [4:0]  read_addr2,    // Read address 2
    input  logic [4:0]  write_addr,    // Write address
    input  logic [31:0] write_data,    // Data to write
    output logic [31:0] read_data1,    // Read data 1
    output logic [31:0] read_data2     // Read data 2
);

    // Register file storage (32 registers x 32 bits)
    logic [31:0] registers [32];

    // Initialize all registers to 0 (for simulation)
    initial begin
        foreach (registers[i]) registers[i] = 32'h0;
    end
    // Asynchronous reads (combinational)
    always_comb read_data1 = (read_addr1 == 0) ? 32'h0 : registers[read_addr1];  // Register 0 is hardwired to 0
    always_comb read_data2 = (read_addr2 == 0) ? 32'h0 : registers[read_addr2];

    // Synchronous write (on clock edge)
    always_ff @(posedge clk) begin
        if (reset) begin
            foreach (registers[i]) registers[i] <= 32'h0;  // Reset all registers
        end
        else if (write_en && (write_addr != 0)) begin      // Register 0 is read-only
            registers[write_addr] <= write_data;
        end
    end

endmodule