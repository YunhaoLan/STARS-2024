onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /request_unit_tb/RU/CLK
add wave -noupdate /request_unit_tb/RU/nRST
add wave -noupdate /request_unit_tb/RU/dmemREN
add wave -noupdate /request_unit_tb/RU/nxt_dmemREN
add wave -noupdate /request_unit_tb/RU/dmemWEN
add wave -noupdate /request_unit_tb/RU/nxt_dmemWEN
add wave -noupdate -divider ruif
add wave -noupdate /request_unit_tb/ruif/MemWr
add wave -noupdate /request_unit_tb/ruif/MemtoReg
add wave -noupdate /request_unit_tb/ruif/dhit
add wave -noupdate /request_unit_tb/ruif/ihit
add wave -noupdate /request_unit_tb/ruif/dmemREN
add wave -noupdate /request_unit_tb/ruif/dmemWEN
add wave -noupdate /request_unit_tb/ruif/imemREN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {150 ns} 0}
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
WaveRestoreZoom {0 ns} {1 us}
