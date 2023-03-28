`timescale 1ns / 1ps

//Subbytes for 128bits input
module Subbytes(
   input clk,
   input [127:0] in,
   output [127:0] out
);

wire [31:0] w0;
wire [31:0] w1;
wire [31:0] w2;
wire [31:0] w3;

assign w0 = in[127:96];
assign w1 = in[95:64];
assign w2 = in[63:32];
assign w3 = in[31:0];

sbox_32bits out127_96(.clk(clk), .in(w0), .out(out[127:96]));
sbox_32bits out95_64(.clk(clk), .in(w1), .out(out[95:64]));
sbox_32bits out63_32(.clk(clk), .in(w2), .out(out[63:32]));
sbox_32bits out31_0(.clk(clk), .in(w3), .out(out[31:0]));

endmodule


//Subbytes for 32bits input
module sbox_32bits(
   input clk,
   input [31:0] in,
   output [31:0] out
);

sbox_8bits out31_24(.data(in[31:24]), .clk(clk), .out(out[31:24]));
sbox_8bits out23_16(.data(in[23:16]), .clk(clk), .out(out[23:16]));
sbox_8bits out15_8(.data(in[15:8]), .clk(clk), .out(out[15:8]));
sbox_8bits out7_0(.data(in[7:0]), .clk(clk), .out(out[7:0]));

endmodule


//Subbytes for 8bits input
module sbox_8bits(
   input clk,
   input [7:0] data,
   output [7:0] out
);

wire o7;
wire o6;
wire o5;
wire o4;
wire o3;
wire o2;
wire o1;
wire o0;

reg [7:0] data_reg;
reg [7:0] out_reg;

//Decide the output[7]
   ROM256X1 #(
      .INIT(256'h090ee9fde374553a41355661f1435de794c0536980eecd3287c7221de7b9ec4a) // Contents of ROM
   ) ROM256X1_inst0 (
      .O(o7),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[6]
   ROM256X1 #(
      .INIT(256'hff2dbf43433c501906a4d5cfdcd8a1279aadb0cd89d3d6fc41e89aa4cc1d0784) // Contents of ROM
   ) ROM256X1_inst1 (
      .O(o6),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[5]
   ROM256X1 #(
      .INIT(256'hfebb19b6defa201f255e1eb0725543d610798c60e233b1bef6a4f2d0c8124d2a) // Contents of ROM
   ) ROM256X1_inst2 (
      .O(o5),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[4]
   ROM256X1 #(
      .INIT(256'h788d1d4aee9f0d431af0c732925e8fef2d37123d614d2464ca74e27375c5084f) // Contents of ROM
   ) ROM256X1_inst3 (
      .O(o4),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[3]
   ROM256X1 #(
      .INIT(256'h561abc9845040908be4a15ff745716a4d836356f39215b97d8df49136edbb972) // Contents of ROM
   ) ROM256X1_inst4 (
      .O(o3),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[2]
   ROM256X1 #(
      .INIT(256'h632d12dcdfe1c68524231425459615c4dffc30dc0726beea3f74736b036d9c35) // Contents of ROM
   ) ROM256X1_inst5 (
      .O(o2),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[1]
   ROM256X1 #(
      .INIT(256'hBE3FCA32BE0075DE5EF681E97A3258672D612CCF74D0A256951B572902E90E13) // Contents of ROM
   ) ROM256X1_inst6 (
      .O(o1),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

//Decide the output[0]
   ROM256X1 #(
      .INIT(256'hb7763690e67b728dc85ed3515fd2d516ad576003084dbd08205e24f69cb578f2) // Contents of ROM
   ) ROM256X1_inst7 (
      .O(o0),   // ROM output
      .A0(~data_reg[0]), // ROM address[0]
      .A1(~data_reg[1]), // ROM address[1]
      .A2(~data_reg[2]), // ROM address[2]
      .A3(~data_reg[3]), // ROM address[3]
      .A4(~data_reg[4]), // ROM address[4]
      .A5(~data_reg[5]), // ROM address[5]
      .A6(~data_reg[6]), // ROM address[6]	
      .A7(~data_reg[7])  // ROM address[7]
   );

   always@(posedge clk)begin
      begin
         data_reg <= data;
         out_reg <= {o7,o6,o5,o4,o3,o2,o1,o0};
      end
   end

assign out = out_reg;

endmodule
