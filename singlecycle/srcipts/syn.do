onerror {resume}
quietly virtual signal -install /system_tb/DUT/CPU/DP { (context /system_tb/DUT/CPU/DP )&{pc_31 , pc_30 , pc_29 , pc_28 , pc_27 , pc_26 , pc_25 , pc_24 , pc_23 , pc_22 , pc_21 , pc_20 , pc_19 , pc_18 , pc_17 , pc_16 , pc_15 , pc_14 , pc_13 , pc_12 , pc_11 , pc_10 , pc_9 , pc_8 , pc_7 , pc_6 , pc_5 , pc_4 , pc_3 , pc_2 , pc_1 , pc_0 }} pc
quietly virtual signal -install /system_tb/DUT/CPU/DP/RF { (context /system_tb/DUT/CPU/DP/RF )&{\regs[2][31]~q , \regs[2][30]~q , \regs[2][29]~q , \regs[2][28]~q , \regs[2][27]~q , \regs[2][26]~q , \regs[2][25]~q , \regs[2][24]~q , \regs[2][23]~q , \regs[2][22]~q , \regs[2][21]~q , \regs[2][20]~q , \regs[2][19]~q , \regs[2][18]~q , \regs[2][17]~q , \regs[2][16]~q , \regs[2][15]~q , \regs[2][14]~q , \regs[2][13]~q , \regs[2][12]~q , \regs[2][11]~q , \regs[2][10]~q , \regs[2][9]~q , \regs[2][8]~q , \regs[2][7]~q , \regs[2][6]~q , \regs[2][5]~q , \regs[2][4]~q , \regs[2][3]~q , \regs[2][2]~q , \regs[2][1]~q , \regs[2][0]~q }} reg2
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/pc
add wave -noupdate /system_tb/DUT/CPU/DP/RF/reg2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300005 ps} 0}
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
WaveRestoreZoom {0 ps} {1648 ns}
