# Synthesis script created by: ees-synthesize, written by Gundolf Kiefer <gundolf.kiefer@hs-augsburg.de>.
#
# Command line:         ees-synthesize -r viscy_ir.vhdl
# Running this script:  vivado -notrace -nojournal -mode batch -source viscy_ir-ees/viscy_ir-synthesize.tcl



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          Setup project and read sources ..."
puts "#"
puts "###########################################################################"
puts ""

create_project -in_memory -part xc7z010clg400-1
read_vhdl -verbose viscy_ir.vhdl
set_property top viscy_ir [current_fileset]



puts "\n\n"
puts "###########################################################################"
puts "#"
puts "#          RTL-Synthesize design and open it in GUI ..."
puts "#"
puts "###########################################################################"
puts ""

synth_design -rtl
start_gui
