`timescale 1ns / 1ps

//There is no Mixcolumns in the final round
module Encryption_Final_Round_Unit(
    input clk,
    input [127:0] state,
    input [127:0] key,
    output [127:0] state_out
);

reg [127:0] state_out_reg;
reg [127:0] state_reg;

wire [127:0] wire1;//connect the output of the Subbytes to the input of the Shiftrows
wire [127:0] wire2;//output of the Shiftrows(for xor)

Subbytes    Subbytes(.clk(clk), .in(state_reg), .out(wire1));
Shiftrows   Shiftrows(.clk(clk), .in(wire1), .out(wire2));

always@(posedge clk)begin
    begin
        state_reg <= state;
        state_out_reg <= wire2 ^ key;//xor of the output of the Shiftrows and the key
    end
end

assign state_out = state_out_reg;

endmodule