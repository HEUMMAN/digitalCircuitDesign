`timescale 1us/1us
module digital_clock_tb();
	reg clock, reset;
	wire [6:0] FND3, FND2, FND1, FND0;
	wire [3:0] out_min_tens, out_min_ones, out_sec_tens, out_sec_ones;
	
	initial begin
		$monitor ("With clock at %b, reset at %b, BCD min_tens : %d, BCD min_ones : %d, BCD sec_tens : %d, BCD sec_ones : %d", clock, reset, out_min_tens, out_min_ones, out_sec_tens, out_sec_ones); 

		clock = 1'b0;
		reset = 1'b0;
		
		#5 reset = 1'b1;
		#5 reset = 1'b0;
		#20 reset = 1'b0;

	end
	
	always begin
		#5 clock = ~clock;
	end
	
	digital_clock UUT (.clock(clock), .reset(reset), .FND3(FND3), .FND2(FND2), .FND1(FND1), .FND0(FND0), .ont_min_tens(out_min_tens), .out_min_ones(out_min_ones), .out_sec_tens(out_sec_tens), .out_sec_ones(out_sec_ones));
	
endmodule