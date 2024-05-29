onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_unit_tb/cuif/ALUCtr
add wave -noupdate /control_unit_tb/cuif/RegDest
add wave -noupdate /control_unit_tb/cuif/RegWr
add wave -noupdate /control_unit_tb/cuif/ExtOp
add wave -noupdate /control_unit_tb/cuif/ALUSrc
add wave -noupdate /control_unit_tb/cuif/MemWr
add wave -noupdate /control_unit_tb/cuif/MemtoReg
add wave -noupdate /control_unit_tb/cuif/J
add wave -noupdate /control_unit_tb/cuif/Beq
add wave -noupdate /control_unit_tb/cuif/Bne
add wave -noupdate /control_unit_tb/cuif/Jr
add wave -noupdate /control_unit_tb/cuif/Jal
add wave -noupdate /control_unit_tb/cuif/ihit
add wave -noupdate /control_unit_tb/cuif/dhit
add wave -noupdate /control_unit_tb/cuif/Halt
add wave -noupdate /control_unit_tb/cuif/Lui
add wave -noupdate /control_unit_tb/cuif/Instr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {271 ns} 0}
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
