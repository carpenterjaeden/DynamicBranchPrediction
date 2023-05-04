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

  reg [1:0] table1; // 2-bit counter register

 
initial begin
table1 <= 2'b00;
prediction <= 0;
end									
    

 always @(posedge clk) begin



if (branchex)begin
case (table1)

2'b00:
begin
if (outcome) begin
prediction <= 0;
table1[1:0] <= 2'b01;
end
else begin 
prediction <= 0;
table1[1:0] <= 2'b00;
end
end
2'b01:
begin
if (outcome) begin
prediction <= 1;
table1[1:0] <= 2'b10;
end
else begin 
prediction <= 0;
table1[1:0] <= 2'b00;
end
end
2'b10:
begin
if (outcome)begin
prediction <= 1;
table1[1:0] <= 2'b11;
end
else begin
prediction <= 0;
table1[1:0] <= 2'b01;
end
end
2'b11:
begin
if (outcome) begin
prediction <= 1;
table1[1:0] <= 2'b11;
end
else begin 
prediction <= 1;
table1[1:0] <= 2'b10;
end
end
endcase
end
  end
endmodule