module FND_decoder(SW_in, FND_out);

	input [3:0] SW_in;
	output reg[9:0] FND_out;
	
	always@(SW_in) begin
	 case(SW_in)
		4'b0000 : FND_out = 7'b100_0000;
		4'b0001 : FND_out = 7'b111_1001;
		4'b0010 : FND_out = 7'b010_0100;
		4'b0011 : FND_out = 7'b011_0000;
		4'b0100 : FND_out = 7'b001_1001;
		4'b0101 : FND_out = 7'b001_0010;
		4'b0110 : FND_out = 7'b000_0010;
		4'b0111 : FND_out = 7'b101_1000;
		4'b1000 : FND_out = 7'b000_0000;
		4'b1001 : FND_out = 7'b001_0000;
		default : FND_out = 7'b100_0000;
	 endcase
	end
endmodule