`timescale 1ns / 1ps

module AES_top(
    input clk,
    input rst,
    input [127:0] plain_text,
    input [127:0] initial_key,
    output [127:0] cipher_text
);

reg [127:0] cipher_text_reg;
wire [127:0] cipher_text_out;//connect the output of the final round to the output of the top

wire [127:0] state;

wire [127:0] wire1;//wire conncted the round1 and round2
wire [127:0] wire2;//wire conncted the round2 and round3
wire [127:0] wire3;//wire conncted the round3 and round4
wire [127:0] wire4;//wire conncted the round4 and round5
wire [127:0] wire5;//wire conncted the round5 and round6
wire [127:0] wire6;//wire conncted the round6 and round7
wire [127:0] wire7;//wire conncted the round7 and round8
wire [127:0] wire8;//wire conncted the round8 and round9
wire [127:0] wire9;//wire conncted the round9 and round10

wire [127:0] wire10;//wire connected the key_round1 and key_round2
wire [127:0] wire11;//wire connected the key_round2 and key_round3
wire [127:0] wire12;//wire connected the key_round3 and key_round4
wire [127:0] wire13;//wire connected the key_round4 and key_round5
wire [127:0] wire14;//wire connected the key_round5 and key_round6
wire [127:0] wire15;//wire connected the key_round6 and key_round7
wire [127:0] wire16;//wire connected the key_round7 and key_round8
wire [127:0] wire17;//wire connected the key_round8 and key_round9
wire [127:0] wire18;//wire connected the key_round9 and key_round10

wire [127:0] key1;//wire connected the key_round1 and round1
wire [127:0] key2;//wire connected the key_round1 and round2
wire [127:0] key3;//wire connected the key_round1 and round3
wire [127:0] key4;//wire connected the key_round1 and round4
wire [127:0] key5;//wire connected the key_round1 and round5
wire [127:0] key6;//wire connected the key_round1 and round6
wire [127:0] key7;//wire connected the key_round1 and round7
wire [127:0] key8;//wire connected the key_round1 and round8
wire [127:0] key9;//wire connected the key_round1 and round9
wire [127:0] key10;//wire connected the key_round1 and round10

Encryption_Round_Unit round1(.clk(clk), .state(state), .key(key1), .state_out(wire1));//state(result of the initial xor) is the input of the round1
Encryption_Round_Unit round2(.clk(clk), .state(wire1), .key(key2), .state_out(wire2));
Encryption_Round_Unit round3(.clk(clk), .state(wire2), .key(key3), .state_out(wire3));
Encryption_Round_Unit round4(.clk(clk), .state(wire3), .key(key4), .state_out(wire4));
Encryption_Round_Unit round5(.clk(clk), .state(wire4), .key(key5), .state_out(wire5));
Encryption_Round_Unit round6(.clk(clk), .state(wire5), .key(key6), .state_out(wire6));
Encryption_Round_Unit round7(.clk(clk), .state(wire6), .key(key7), .state_out(wire7));
Encryption_Round_Unit round8(.clk(clk), .state(wire7), .key(key8), .state_out(wire8));
Encryption_Round_Unit round9(.clk(clk), .state(wire8), .key(key9), .state_out(wire9));
Encryption_Final_Round_Unit round10(.clk(clk), .state(wire9), .key(key10), .state_out(cipher_text_out));

key_expansion1    key_expansion_round1(.clk(clk), .in(initial_key), .out1(wire10), .out2(key1));
key_expansion2    key_expansion_round2(.clk(clk), .in(wire10), .out1(wire11), .out2(key2));
key_expansion3    key_expansion_round3(.clk(clk), .in(wire11), .out1(wire12), .out2(key3));
key_expansion4    key_expansion_round4(.clk(clk), .in(wire12), .out1(wire13), .out2(key4));
key_expansion5    key_expansion_round5(.clk(clk), .in(wire13), .out1(wire14), .out2(key5));
key_expansion6    key_expansion_round6(.clk(clk), .in(wire14), .out1(wire15), .out2(key6));
key_expansion7    key_expansion_round7(.clk(clk), .in(wire15), .out1(wire16), .out2(key7));
key_expansion8    key_expansion_round8(.clk(clk), .in(wire16), .out1(wire17), .out2(key8));
key_expansion9    key_expansion_round9(.clk(clk), .in(wire17), .out1(wire18), .out2(key9));
key_expansion10   key_expansion_round10(.clk(clk), .in(wire18), .out(key10));

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        cipher_text_reg <= 128'b0;
    end
    else begin
        cipher_text_reg <= cipher_text_out;
    end
end

assign cipher_text = cipher_text_reg;
assign state = plain_text ^ initial_key;//initial xor, result: state

endmodule
