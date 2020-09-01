module dataflow_mux(s, sel, out);

	input[2:0] sel;
	input[7:0] s;
	output out;

	assign out = s[sel];
	
endmodule