set projDir "C:/Users/User/Documents/mojo/ws2812/work/planAhead"
set projName "ws2812"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/User/Documents/mojo/ws2812/work/verilog/mojo_top_0.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/playercontrol_1.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/ballcontrol_2.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/ws2812b_3.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/brickgen_4.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/gamestart_5.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/gameover_6.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/edge_detector_7.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/edge_detector_7.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/button_conditioner_9.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/button_conditioner_9.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/reset_conditioner_11.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/edge_detector_7.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/edge_detector_7.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/button_conditioner_9.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/button_conditioner_9.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/alu16bit_16.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/alu16bit_16.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/pipeline_18.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/pipeline_18.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/pipeline_18.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/pipeline_18.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/adder16bit_22.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/boole_23.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/shifter_24.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/cmp_25.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/adder16bit_22.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/boole_23.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/shifter_24.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/cmp_25.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/adder_30.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/multiplier_31.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/adder_30.v" "C:/Users/User/Documents/mojo/ws2812/work/verilog/multiplier_31.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/User/Documents/mojo/ws2812/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
