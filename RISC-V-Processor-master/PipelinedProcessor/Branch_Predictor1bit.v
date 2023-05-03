//2-Bit Predictor 
//table bits
//0	outcome prior to previous outcome
//1	previous outcome
//2	previous prediction


module Branch_Predictor1bit(
  input clk, //timing
  input branchex, // branch confirmation from EX register
  input outcome, // branch outcome
  output reg prediction // 2-bit prediction for 2^2 = 4 entries
);

 reg [2:0] table1; // 4-entry 2-bit counter table
initial begin
table1 <= 3'b000;
prediction <= 0;
end									// index into the table using the least significant bits of the PC
											// take the two least significant bits to index into 2^2 = 4 table entries
											// we use bit-wise AND with 2'b11 to extract the two least significant bits
    

 always @(posedge clk) begin



if (branchex)begin
prediction <= outcome;

end


  end
endmodule
