`timescale 1ns / 1ps

//A Encryption Round Unit includes Subbytes, Shiftrows, Mixcolumns, and xor with the key
module Encryption_Round_Unit(
    input clk,
    input [127:0] state,
    input [127:0] key,
    output [127:0] state_out
);

reg [127:0] state_out_reg;
reg [127:0] state_reg;

wire [127:0] wire1;//connect the output of the Subbytes to the input of the Shiftrows
wire [127:0] wire2;//connect the output of the Shiftrows to the input of the Mixcolumns
wire [127:0] wire3;//output of the Mixcolumns(for xor)

Subbytes    Subbytes(.clk(clk), .in(state_reg), .out(wire1));
Shiftrows   Shiftrows(.clk(clk), .in(wire1), .out(wire2));
Mixcolumns  Mixcolumns(.clk(clk), .in(wire2), .out(wire3));

always@(posedge clk)begin
    begin
        state_reg <= state;
        state_out_reg <= wire3 ^ key;//xor of the output of the Mixcolumns and the key
    end
end

assign state_out = state_out_reg;

endmodule
