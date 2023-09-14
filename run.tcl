create_project project_Car_Parking D:/Courses/K.W/Design-Diploma/Projetcs/Car-Parking -part xc7a35ticpg236-1L -force

add_files Design.sv basys_master.xdc

synth_design -rtl -top Design > elab.log

write_schematic elaborated_schematic.pdf -format pdf -force 

launch_runs synth_1 > synth.log

wait_on_run synth_1
open_run synth_1

write_schematic synthesized_schematic.pdf -format pdf -force 

write_verilog -force Design.sv

launch_runs impl_1 -to_step write_bitstream 

wait_on_run impl_1
open_run impl_1

open_hw

connect_hw_server