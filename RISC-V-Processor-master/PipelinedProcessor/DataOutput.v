module DataOutput(
  input wire clk, rst, branchex, BranchFlush
);
reg [63:0] cycles, branches, branch_mispredicts;
  initial begin
  cycles <= 0;
  branches <= 0;
  branch_mispredicts <= 0;
  end
  always @(posedge clk or posedge rst)
  begin
    if (rst)begin
	cycles <= 0;
  	branches <= 0;
  	branch_mispredicts <= 0;
    end
  else begin
  cycles = cycles + 1;
  if (branchex)
  branches = branches + 1;
  if (BranchFlush)
  branch_mispredicts = branch_mispredicts + 1;

  end
  end
endmodule 
