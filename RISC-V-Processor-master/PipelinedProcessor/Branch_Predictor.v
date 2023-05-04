//2-Bit Predictor 
//table bits
//0	outcome prior to previous outcome
//1	previous outcome
//2	previous prediction


module Branch_Predictor(
  input clk, //timing
  input branchex, // branch confirmation from EX register
  input outcome, // branch outcome
  output reg prediction // 2-bit prediction for 2^2 = 4 entries
);

  reg [2:0] table1; // 4-entry 2-bit counter table

 
initial begin
table1 <= 3'b000;
prediction <= 0;
end									
    

 always @(posedge clk) begin



if (branchex)begin
table1[0] = table1[1];
table1[1] = outcome;
case (table1[2:1])

2'b00:
begin
prediction <= 0;
table1[2] <= 0;
end
2'b01:
begin
if (table1[0] == 0) begin
prediction <= 0;
table1[2] <= 0;
end
else begin 
prediction <= 1;
table1[2] <= 1;
end
end
2'b10:
begin
if (table1[0] == 0)begin
prediction <= 0;
table1[2] <= 0;
end
else begin
prediction <= 1;
table1[2] <= 1;
end
end
2'b11:
begin
prediction <= 1;
table1[2] <= 1;
end
endcase
end
  end
endmodule