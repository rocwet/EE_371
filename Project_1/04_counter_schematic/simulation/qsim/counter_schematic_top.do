onerror {exit -code 1}
vlib work
vlog -work work counter_schematic_top.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.count_down_schematic_vlg_vec_tst -voptargs="+acc"
vcd file -direction counter_schematic_top.msim.vcd
vcd add -internal count_down_schematic_vlg_vec_tst/*
vcd add -internal count_down_schematic_vlg_vec_tst/i1/*
run -all
quit -f
