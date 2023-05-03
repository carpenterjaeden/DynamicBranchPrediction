module Branch_Control(
  input wire [31:0] ins,
  output wand branch
);
  assign branch = ins[6];
  assign branch = ins[5];
  assign branch = ~ins[4];
  assign branch = ~ins[3];
  assign branch = ~ins[2];
  assign branch = ins[1];
  assign branch = ins[0];
endmodule 
