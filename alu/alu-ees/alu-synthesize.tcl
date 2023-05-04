# Synthesis script created by: ees-synthesize, written by Gundolf Kiefer <gundolf.kiefer@hs-augsburg.de>.
#
# Command line:         ees-synthesize alu.vhdl
# Running this script:  vivado -notrace -nojournal -mode batch -source alu-ees/alu-synthesize.tcl



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Setup project and read sources ..."
puts "#"
puts "###########################################################################"
puts ""

create_project -in_memory -part xc7z010clg400-1
read_vhdl -verbose alu.vhdl
set_property top alu [current_fileset]



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Synthesize design ..."
puts "#"
puts "###########################################################################"
puts ""

synth_design
opt_design   ; # optional (see Xilinx UG835 'Tcl Command Reference Guide' for details)
write_checkpoint -force alu-ees/alu-syn.dcp



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Create reports..."
puts "#"
puts "###########################################################################"
puts ""

report_utilization -file alu-ees/alu-utilization.log
report_timing -file alu-ees/alu-timing.log
