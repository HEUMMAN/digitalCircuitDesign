module verilog_code (input_A, input_B, output_C, output_D, output_E);
	input input_A;
	input input_B;
	output output_C;
	output output_D;
	output output_E;
	
	assign output_C = ~input_A;
	assign output_D = input_A & input_B;
	assign output_E = input_A | input_B;
endmodule

