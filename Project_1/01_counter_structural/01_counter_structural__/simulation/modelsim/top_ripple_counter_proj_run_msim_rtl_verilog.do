transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/dennyly/Documents/GitHub/EE_371/Project_1/01_counter_structural/01_counter_structural__ {C:/Users/dennyly/Documents/GitHub/EE_371/Project_1/01_counter_structural/01_counter_structural__/ripple_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/dennyly/Documents/GitHub/EE_371/Project_1/01_counter_structural/01_counter_structural__ {C:/Users/dennyly/Documents/GitHub/EE_371/Project_1/01_counter_structural/01_counter_structural__/top_ripple_counter.v}

