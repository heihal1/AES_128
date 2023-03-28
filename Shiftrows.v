`timescale 1ns / 1ps

module Shiftrows(
    input clk,
    input [127:0] in,
    output [127:0] out
);
reg [127:0] out_reg;

wire [7:0] G0;
wire [7:0] G1;
wire [7:0] G2;
wire [7:0] G3;
wire [7:0] G4;
wire [7:0] G5;
wire [7:0] G6;
wire [7:0] G7;
wire [7:0] G8;
wire [7:0] G9;
wire [7:0] G10;
wire [7:0] G11;
wire [7:0] G12;
wire [7:0] G13;
wire [7:0] G14;
wire [7:0] G15;

//split the 128bits input into 16 bytes
assign G0 = in [127:120];
assign G1 = in [119:112]; 
assign G2 = in [111:104];
assign G3 = in [103:96];  

assign G4 = in [95:88];
assign G5 = in [87:80];
assign G6 = in [79:72];
assign G7 = in [71:64];

assign G8 = in [63:56];
assign G9 = in [55:48];
assign G10 = in [47:40];
assign G11 = in [39:32];

assign G12 = in [31:24];
assign G13 = in [23:16];
assign G14 = in [15:8];
assign G15 = in [7:0];  
     
always@(posedge  clk)begin
    begin
        out_reg <= {G0,G5,G10,G15,G4,G9,G14,G3,G8,G13,G2,G7,G12,G1,G6,G11};//re-organize the sequence of the 16 bytes
    end
  end

assign out = out_reg;

endmodule