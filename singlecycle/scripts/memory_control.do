onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/PROG/test_num
add wave -noupdate -divider cif0
add wave -noupdate /memory_control_tb/PROG/cif0/dREN
add wave -noupdate /memory_control_tb/PROG/cif0/dWEN
add wave -noupdate /memory_control_tb/PROG/cif0/iload
add wave -noupdate /memory_control_tb/PROG/cif0/dload
add wave -noupdate /memory_control_tb/PROG/cif0/dstore
add wave -noupdate /memory_control_tb/PROG/cif0/iaddr
add wave -noupdate /memory_control_tb/PROG/cif0/daddr
add wave -noupdate -divider ccif
add wave -noupdate /memory_control_tb/PROG/ccif/iwait
add wave -noupdate /memory_control_tb/PROG/ccif/dwait
add wave -noupdate /memory_control_tb/PROG/ccif/iREN
add wave -noupdate /memory_control_tb/PROG/ccif/dREN
add wave -noupdate /memory_control_tb/PROG/ccif/dWEN
add wave -noupdate /memory_control_tb/PROG/ccif/iload
add wave -noupdate /memory_control_tb/PROG/ccif/dload
add wave -noupdate /memory_control_tb/PROG/ccif/dstore
add wave -noupdate /memory_control_tb/PROG/ccif/iaddr
add wave -noupdate /memory_control_tb/PROG/ccif/daddr
add wave -noupdate /memory_control_tb/PROG/ccif/ramWEN
add wave -noupdate /memory_control_tb/PROG/ccif/ramREN
add wave -noupdate /memory_control_tb/PROG/ccif/ramstate
add wave -noupdate /memory_control_tb/PROG/ccif/ramaddr
add wave -noupdate /memory_control_tb/PROG/ccif/ramstore
add wave -noupdate /memory_control_tb/PROG/ccif/ramload
add wave -noupdate -divider ramif
add wave -noupdate /memory_control_tb/PROG/ramif/ramREN
add wave -noupdate /memory_control_tb/PROG/ramif/ramWEN
add wave -noupdate /memory_control_tb/PROG/ramif/ramaddr
add wave -noupdate /memory_control_tb/PROG/ramif/ramstore
add wave -noupdate /memory_control_tb/PROG/ramif/ramload
add wave -noupdate /memory_control_tb/PROG/ramif/ramstate
add wave -noupdate /memory_control_tb/PROG/ramif/memREN
add wave -noupdate /memory_control_tb/PROG/ramif/memWEN
add wave -noupdate /memory_control_tb/PROG/ramif/memaddr
add wave -noupdate /memory_control_tb/PROG/ramif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {169127 ps} 0}
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
WaveRestoreZoom {0 ps} {1 us}
