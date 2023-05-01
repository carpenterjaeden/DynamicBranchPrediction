//2-Bit Predictor 
//Prediction Bit:Hysteresis (Conviction) Bit
//00	Strong Not-Taken
//01	Weak Not-Taken
//10	Weak Taken
//11	Strong Taken

module Branch_Predictor(
  input [31:0] PC, //program counter
  input branchid, // branch confirmation from ID register
  input branchex, // branch confirmation from EX register
  input  outcome, // branch outcome
  output reg prediction // 2-bit prediction for 2^2 = 4 entries
);

  reg [2:0] table1; // 4-entry 2-bit counter table

 
initial begin
table1 <= 3'b000;
prediction <= 0;
end									// index into the table using the least significant bits of the PC
											// take the two least significant bits to index into 2^2 = 4 table entries
											// we use bit-wise AND with 2'b11 to extract the two least significant bits
    

 always @(PC) begin

if (branchid)begin
case (table1[2:1])

2'b00:
begin
prediction <= 0;
end
2'b01:
begin
if (table1[0] == 0)
prediction <= 0;
else 
prediction <= 1;
end
2'b10:
begin
if (table1[0] == 0)
prediction <= 0;
else 
prediction <= 1;
end
2'b11:
begin
prediction <= 1;
end
endcase

end
if (branchex)begin
table1[0] = table1[1];
table1[2:1] = {prediction, outcome};
end


  end
endmodule