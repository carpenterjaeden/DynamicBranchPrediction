vlog Adder.v ALU_64_bit.v ALU_Control.v Branch_Control.v Control_Unit.v Data_Memory.v extractor.v InstructionMemory.v mux.v mux2.v parser.v Program_Counter.v registerFile.v RISC_V_Processor.v tb.v IDRegister.v EXRegister.v MEMRegister.v WBRegister.v ForwardingUnit.v Branch_Predictor.v XOR.v DataOutput.v Branch_Predictornone.v Branch_Predictor1bit.v 
vsim -novopt work.tb
view wave
add wave sim:/tb/uut/datOut/branch_mispredicts
add wave sim:/tb/uut/datOut/cycles
add wave sim:/tb/uut/datOut/branches
add wave sim:/tb/uut/Instruction
add wave sim:/tb/uut/PC_Out
add wave sim:/tb/uut/bimodPredictor/table1



run 10000000ps