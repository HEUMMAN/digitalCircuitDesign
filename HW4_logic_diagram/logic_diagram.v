module logic_diagram(Ent, SM, SD, L);

	input [3:0] Ent;//input_siganl
	input [1:0] SM;//mux_select
	input [1:0] SD;//demux_select
	output [4:1] L;//out_signal
	
	assign L[1] = Ent[SM] & ~SD[1] & ~SD[0];
	assign L[2] = Ent[SM] & ~SD[1] & SD[0];
	assign L[3] = Ent[SM] & SD[1] & ~SD[0];
	assign L[4] = Ent[SM] & SD[1] & SD[0];

endmodule