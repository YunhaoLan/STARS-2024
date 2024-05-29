onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -divider Control_unit
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/ALUCtr
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/RegDest
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/RegWr
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/ExtOp
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/ALUSrc
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Beq
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Bne
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/MemWr
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/MemtoReg
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/J
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Jr
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Jal
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Halt
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Lui
add wave -noupdate /system_tb/DUT/CPU/DP/CU/cuif/Instr
add wave -noupdate -divider Request_unit
add wave -noupdate /system_tb/DUT/CPU/DP/RU/CLK
add wave -noupdate /system_tb/DUT/CPU/DP/RU/nRST
add wave -noupdate /system_tb/DUT/CPU/DP/RU/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/RU/nxt_dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/RU/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/RU/nxt_dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/MemWr
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/MemtoReg
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/dhit
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/RU/ruif/imemREN
add wave -noupdate -divider PC
add wave -noupdate /system_tb/DUT/CPU/DP/PC/pc
add wave -noupdate /system_tb/DUT/CPU/DP/PC/nxt_pc
add wave -noupdate /system_tb/DUT/CPU/DP/PC/pcif/Beq
add wave -noupdate /system_tb/DUT/CPU/DP/PC/pcif/Bne
add wave -noupdate /system_tb/DUT/CPU/DP/PC/pcif/Equal
add wave -noupdate /system_tb/DUT/CPU/DP/PC/pcif/ExtOut
add wave -noupdate /system_tb/DUT/CPU/DP/PC/pcif/PCAddr
add wave -noupdate -divider Datapath
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -color {Blue Violet} /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -color {Blue Violet} /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate /system_tb/DUT/CPU/DP/ExtOut
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/negative
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/overflow
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/zero
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/portA
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/portB
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/out
add wave -noupdate /system_tb/DUT/CPU/DP/ALU/aluif/op
add wave -noupdate -divider RF
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/wdat
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/RF/rfif/rdat2
add wave -noupdate -divider RAM
add wave -noupdate /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -divider {New Divider}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[31]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[30]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[29]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[28]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[27]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[26]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[25]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[24]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[23]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[22]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[21]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[20]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[19]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[18]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[17]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[16]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[15]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[14]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[13]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[12]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[11]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[10]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[9]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[8]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[7]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[6]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[5]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[4]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[3]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[2]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[1]}
add wave -noupdate {/system_tb/DUT/CPU/DP/RF/regs[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {87121 ps} 0}
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
WaveRestoreZoom {0 ps} {558957 ps}
