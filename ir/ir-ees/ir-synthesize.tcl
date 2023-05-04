# Synthesis script created by: ees-synthesize, written by Gundolf Kiefer <gundolf.kiefer@hs-augsburg.de>.
#
# Command line:         ees-synthesize ir.vhdl
# Running this script:  vivado -notrace -nojournal -mode batch -source ir-ees/ir-synthesize.tcl



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Setup project and read sources ..."
puts "#"
puts "###########################################################################"
puts ""

create_project -in_memory -part xc7z010clg400-1
read_vhdl -verbose ir.vhdl
set_property top ir [current_fileset]



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Synthesize design ..."
puts "#"
puts "###########################################################################"
puts ""

synth_design
opt_design   ; # optional (see Xilinx UG835 'Tcl Command Reference Guide' for details)
write_checkpoint -force ir-ees/ir-syn.dcp



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Create reports..."
puts "#"
puts "###########################################################################"
puts ""

report_utilization -file ir-ees/ir-utilization.log
report_timing -file ir-ees/ir-timing.log
