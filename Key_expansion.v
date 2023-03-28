`timescale 1ns / 1ps

module key_expansion1(
   input clk,
   input [127:0] in,
   output [127:0] out1,//used for giving the output to the next key expansion round
   output [127:0] out2//used the for xor in the encryption round unit with the state
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

//split the 128bits input into 4 word
assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T1(clk,w_3,4'd1,out_t1);

assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion2(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T2(clk,w_3,4'd2,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion3(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T3(clk,w_3,4'd3,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion4(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T4(clk,w_3,4'd4,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion5(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T5(clk,w_3,4'd5,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion6(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T6(clk,w_3,4'd6,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion7(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T7(clk,w_3,4'd7,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion8(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T8(clk,w_3,4'd8,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;


endmodule

module key_expansion9(
   input clk,
   input [127:0] in,
   output [127:0] out1,
   output [127:0] out2
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T9(clk,w_3,4'd9,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out1 = out_reg;
assign out2 = out_reg;

endmodule


module key_expansion10(
   input clk,
   input [127:0] in,
   output [127:0] out
);
reg [127:0] in_reg;
reg [127:0] out_reg;


wire [31:0] w_0,w_1,w_2,w_3;//previous key
wire [31:0] w_4,w_5,w_6,w_7;//new key
wire [31:0] out_t1;

assign 	w_0=in_reg[127:96];
assign	w_1=in_reg[95:64];
assign	w_2=in_reg[63:32];
assign	w_3=in_reg[31:0];
		
function_t T10(clk,w_3,4'd10,out_t1);
		
assign	w_4=w_0^out_t1;
assign	w_5=w_1^w_0^out_t1;
assign	w_6=w_2^w_1^w_0^out_t1;
assign   w_7=w_3^w_2^w_1^w_0^out_t1;

always@(posedge clk)begin
   begin
      in_reg <= in;
      out_reg <= {w_4,w_5,w_6,w_7};
   end
end

assign out = out_reg;

endmodule

		
module function_t(
   input clk,
   input [31:0] in,
   input [3:0] i,
   output [31:0] out
);
	
wire [31:0] shiftrows;
reg [31:0] RC;
reg [31:0] out_reg;

wire [7:0] w0;
wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;

wire [7:0] subbytes0;
wire [7:0] subbytes1;
wire [7:0] subbytes2;
wire [7:0] subbytes3;


assign w0 = in[31:24];
assign w1 = in[23:16];
assign w2 = in[15:8];
assign w3 = in[7:0];

sbox_8bits out31_24(.clk(clk), .data(w0), .out(subbytes0));
sbox_8bits out23_16(.clk(clk), .data(w1), .out(subbytes1));
sbox_8bits out15_8(.clk(clk), .data(w2), .out(subbytes2));
sbox_8bits out7_0(.clk(clk), .data(w3), .out(subbytes3));

assign shiftrows = {subbytes1 , subbytes2 , subbytes3 , subbytes0};

always@(posedge clk)begin
   begin
      out_reg <= shiftrows ^ RC;
   end
end

always@(*)
		
	begin

	case (i)
		
		4'd01: RC = 32'h01000000;
		4'd02: RC = 32'h02000000;
		4'd03: RC = 32'h04000000;
		4'd04: RC = 32'h08000000;
		4'd05: RC = 32'h10000000;
		4'd06: RC = 32'h20000000;
		4'd07: RC = 32'h40000000;
		4'd08: RC = 32'h80000000;
		4'd09: RC = 32'h1B000000;
		4'd10: RC = 32'h36000000;
		 
		default:
			
		RC = 32'h01000000;
			
	endcase
			
	end
		
	assign out = out_reg;
		
endmodule