onerror {resume}
quietly virtual signal -install /system_tb/DUT/CPU/DP { (context /system_tb/DUT/CPU/DP )&{pc_31 , pc_30 , pc_29 , pc_28 , pc_27 , pc_26 , pc_25 , pc_24 , pc_23 , pc_22 , pc_21 , pc_20 , pc_19 , pc_18 , pc_17 , pc_16 , pc_15 , pc_14 , pc_13 , pc_12 , pc_11 , pc_10 , pc_9 , pc_8 , pc_7 , pc_6 , pc_5 , pc_4 , pc_3 , pc_2 , pc_1 , pc_0 }} pc
quietly virtual signal -install /system_tb/DUT/CPU/DP { (context /system_tb/DUT/CPU/DP )&{ramiframload_31 , ramiframload_30 , ramiframload_29 , ramiframload_27 , ramiframload_26 , ramiframload_25 , ramiframload_24 , ramiframload_15 , ramiframload_14 , ramiframload_13 , ramiframload_12 , ramiframload_11 , ramiframload_10 , ramiframload_9 , ramiframload_8 , ramiframload_7 , ramiframload_6 , ramiframload_5 , ramiframload_4 , ramiframload_3 , ramiframload_2 , ramiframload_1 , ramiframload_0 }} ramload
quietly virtual signal -install /system_tb/DUT/CPU/DP { (context /system_tb/DUT/CPU/DP )&{ramstore17 , ramstore16 , ramstore15 , ramstore14 , ramstore13 , ramstore12 , ramstore11 , ramstore10 , ramstore9 , ramstore8 , ramstore7 , ramstore6 , ramstore5 , ramstore4 , ramstore3 , ramstore2 , ramstore1 , ramstore }} ramstore_total
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/pc
add wave -noupdate /system_tb/DUT/CPU/DP/ramload
add wave -noupdate /system_tb/DUT/CPU/DP/ramstore_total
add wave -noupdate /system_tb/DUT/CPU/DP/halt2
add wave -noupdate /system_tb/DUT/CPU/DP/halt1
add wave -noupdate /system_tb/DUT/CPU/DP/dmemWEN_0
add wave -noupdate /system_tb/DUT/CPU/DP/dmemREN_0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {731468 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {687810 ps} {1246767 ps}
