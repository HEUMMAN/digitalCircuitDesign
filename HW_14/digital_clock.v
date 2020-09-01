module digital_clock (clock, reset, FND3, FND2, FND1, FND0, out_min_tens, out_min_ones, out_sec_tens, out_sec_ones);
	input clock, reset;
	output [6:0] FND3, FND2, FND1, FND0;
	output wire [3:0] out_min_tens, out_min_ones, out_sec_tens, out_sec_ones;
	wire w1; //1Hz Clock
	wire [3:0] w3; // min_tens BCD
	wire [3:0] w4; // min_ones BCD
	wire [3:0] w5; // sec_tens BCD
	wire [3:0] w6; // sec_ones BCD
	wire [6:0] w7; // min_tens FND
	wire [6:0] w8; // min_ones FND
	wire [6:0] w9; // sec_tens FND
	wire [6:0] w10; // sec_ones FND
	
	wire [3:0] w11; // select one of four sec FNDs

	
	clock_divider #(.input_hz(500), .output_hz(1)) clock_divider_1_hz(.reset(reset), .clock_in(clock), .clock_out(w1));

	timer_00_59 timer(.reset(reset), .clock(w1), .out_1sec_BCD(w6), .out_10sec_BCD(w5), .out_1min_BCD(w4), .out_10min_BCD(w3));
	
	fnd_driver FND_driver_min_tens(.in_BCD(w3), .out_FND(w7));
	fnd_driver FND_driver_min_ones(.in_BCD(w4), .out_FND(w8));
	fnd_driver FND_driver_sec_tens(.in_BCD(w5), .out_FND(w9));
	fnd_driver FND_driver_sec_ones(.in_BCD(w6), .out_FND(w10));

	ring_counter_4_bit ring_counter(.reset(reset), .clock(w1), .out(w11));

	negative_tri_state_buffer_N_bit #(7) buffer_0 (.in_disable(w11[0]), .in(w10), .out(FND0)); //sec_ones FND
	negative_tri_state_buffer_N_bit #(7) buffer_1 (.in_disable(w11[1]), .in(w9), .out(FND1)); //sec_tens FND
	negative_tri_state_buffer_N_bit #(7) buffer_2 (.in_disable(w11[2]), .in(w8), .out(FND2)); //min_ones FND
	negative_tri_state_buffer_N_bit #(7) buffer_3 (.in_disable(w11[3]), .in(w7), .out(FND3)); //min_tens FND

	assign out_sec_ones = w6; // for monitoring sec_ones BCD
	assign out_sec_tens = w5; // for monitoring sec_tens BCD
	assign out_min_ones = w4; // for monitoring min_ones BCD
	assign out_min_tens = w3; // for monitoring min_tens BCD
endmodule
	
module clock_divider (reset, clock_in, clock_out);
	parameter input_hz = 6;
	parameter output_hz = 1;
	parameter in_out_ratio = input_hz / output_hz;
	
	input clock_in, reset;
	output clock_out;
	reg clock_out;
	reg [31:0] internal_count;
	
	always @(posedge clock_in or posedge reset) begin
		if (reset) begin
			internal_count <= 1'b0;
			clock_out <= 1'b0;
		end
		else if (internal_count == (in_out_ratio - 1)) begin
			internal_count <= 32'b0;
			clock_out <= 1'b1;
		end
		else if (internal_count == (in_out_ratio/2 - 1)) begin
			clock_out <= 1'b0;
			internal_count <= internal_count + 1;
		end
		else begin
			internal_count <= internal_count + 1;
		end
	end
endmodule

module ring_counter_4_bit (reset, clock, out);
	input reset, clock;
	output reg [3:0] out;
	
	always @(posedge clock or posedge reset) begin
		if (reset) begin
			out <= 4'b0111;
		end
		else begin
			out[3] <= out[0];
			out[2] <= out[3];
			out[1] <= out[2];
			out[0] <= out[1];
		end
	end
endmodule
	
module negative_tri_state_buffer_N_bit (in_disable, in, out);
	parameter N = 7;
	input in_disable;
	input [N-1:0] in;
	output reg [N-1:0] out;
	
	always @(in_disable or in) begin
		if (in_disable == 1'b0) out <= in;
		else out <= 1'bz;
	end
endmodule
	

module timer_00_59 (reset, clock, out_1sec_BCD, out_10sec_BCD, out_1min_BCD, out_10min_BCD);
	input reset, clock;
	output reg [3:0] out_1sec_BCD;
	output reg [3:0] out_10sec_BCD;
	output reg [3:0] out_1min_BCD;
	output reg [3:0] out_10min_BCD;
 
	always @(posedge clock or posedge reset) begin
		if (reset) begin
			out_1sec_BCD <= 4'd0;
			out_10sec_BCD <= 4'd0;
			out_1min_BCD <= 4'd0;
			out_10min_BCD <= 4'd0;
		end
		else begin
			if (out_1sec_BCD == 4'd9) begin
				 out_1sec_BCD <= 4'd0;
				if (out_10sec_BCD == 4'd5) begin
					 out_10sec_BCD <= 4'd0;
					 out_1min_BCD <= out_1min_BCD + 1;
					if (out_1min_BCD == 4'd9) begin
						 out_1min_BCD <= 4'd0;
						 if(out_10min_BCD == 4'd5) begin
							 out_10min_BCD <= 4'd0;
						 end
				else begin
					out_10min_BCD <= out_10min_BCD + 1;
				end
			end
			else begin
				 out_1min_BCD <= out_1min_BCD + 1;
			end
		end
		else begin
				out_10sec_BCD <= out_10sec_BCD + 1;
		end
	end
	else begin
		out_1sec_BCD <= out_1sec_BCD + 1;
	end
end
		
end
endmodule

module fnd_driver (in_BCD, out_FND);
	input [3:0] in_BCD;
	output [6:0] out_FND;
	reg [6:0] out_FND;
	
	always @(in_BCD) begin
		case (in_BCD)
			4'd0: out_FND <= 7'b1000000;
			4'd1: out_FND <= 7'b1111001;
			4'd2: out_FND <= 7'b0100100;
			4'd3: out_FND <= 7'b0110000;
			4'd4: out_FND <= 7'b0011001;
			4'd5: out_FND <= 7'b0010010;
			4'd6: out_FND <= 7'b0000010;
			4'd7: out_FND <= 7'b1011000;
			4'd8: out_FND <= 7'b0000000;
			4'd9: out_FND <= 7'b0010000;
			default out_FND <= 7'b0000110;
		endcase
	end
endmodule