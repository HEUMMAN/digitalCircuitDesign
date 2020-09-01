module structural_mux (s, sel, out);

	input[2:0] sel;
	input[7:0] s;
	output out;
	wire [7:0] and_wire;
	wire [2:0] inv_sel;

	not inv_0(inv_sel[0], sel[0]);
	not inv_1(inv_sel[1], sel[1]);
	not inv_2(inv_sel[2], sel[2]);
	
	and and0(and_wire[0], s[0], inv_sel[2], inv_sel[1], inv_sel[0]);
	and and1(and_wire[1], s[1], inv_sel[2], inv_sel[1], sel[0]);
	and and2(and_wire[2], s[2], inv_sel[2], sel[1], inv_sel[0]);
	and and3(and_wire[3], s[3], inv_sel[2], sel[1], sel[0]);
	and and4(and_wire[4], s[4], sel[2], inv_sel[1], inv_sel[0]);
	and and5(and_wire[5], s[5], sel[2], inv_sel[1], sel[0]);
	and and6(and_wire[6], s[6], sel[2], sel[1], inv_sel[0]);
	and and7(and_wire[7], s[7], sel[2], sel[1], sel[0]);
	

	or or_output(out, and_wire[0],and_wire[1],and_wire[2],and_wire[3],and_wire[4],and_wire[5],and_wire[6],and_wire[7]);
	
endmodule
	