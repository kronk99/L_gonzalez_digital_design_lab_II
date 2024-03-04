transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1 {C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1/sumador1bit.sv}
vlog -sv -work work +incdir+C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1 {C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1/sumador.sv}
vlog -sv -work work +incdir+C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1 {C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1/restador.sv}
vlog -sv -work work +incdir+C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1 {C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1/inversor.sv}

vlog -sv -work work +incdir+C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1 {C:/Users/andre/Desktop/TallerDigital/Lab2/repo/problem1/restador_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  restador_tb

add wave *
view structure
view signals
run -all
