open_project test
set_top kernel
add_files ../../main.cc
open_solution "solution1" -flow_target vivado
set_part $env(PART)
create_clock -period $env(PHLS) -name default
config_export -format ip_catalog -rtl verilog -vivado_clock $env(PIMPL) -vivado_phys_opt all
set_clock_uncertainty 0
csynth_design
export_design -flow impl -rtl verilog -format ip_catalog
close_project
exit
