# Tools we need:
# - code
# - verilator
# - iverilog
# - gtkwave
# - verible? (will investigate)


# compile with verilog
iverilog -g2012 alu.sv alu_tb.sv -o alu-sim

# run simulation
vvp alu-sim


