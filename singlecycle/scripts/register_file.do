onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_file_tb/CLK
add wave -noupdate /register_file_tb/nRST
add wave -noupdate /register_file_tb/v1
add wave -noupdate /register_file_tb/v2
add wave -noupdate /register_file_tb/v3
add wave -noupdate /register_file_tb/PROG/rfif/WEN
add wave -noupdate /register_file_tb/PROG/rfif/wsel
add wave -noupdate /register_file_tb/PROG/rfif/rsel1
add wave -noupdate /register_file_tb/PROG/rfif/rsel2
add wave -noupdate /register_file_tb/PROG/rfif/wdat
add wave -noupdate /register_file_tb/PROG/rfif/rdat1
add wave -noupdate /register_file_tb/PROG/rfif/rdat2
add wave -noupdate /register_file_tb/DUT/regs
add wave -noupdate /register_file_tb/DUT/nxt_regs
add wave -noupdate /register_file_tb/PROG/test_num
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23 ns} 0}
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
WaveRestoreZoom {18 ns} {84 ns}
