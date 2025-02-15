onerror {quit -f}
vlib work
vlog -work work structural_mux.vo
vlog -work work structural_mux.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.structural_mux_vlg_vec_tst
vcd file -direction structural_mux.msim.vcd
vcd add -internal structural_mux_vlg_vec_tst/*
vcd add -internal structural_mux_vlg_vec_tst/i1/*
add wave /*
run -all
