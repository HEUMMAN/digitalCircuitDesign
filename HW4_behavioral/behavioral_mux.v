module behavioral_mux(s, sel, out);
	
	input[2:0] sel;
	input[7:0] s;
	output out;
	
	reg out;
	always @(sel, s) begin
		case(sel)
			0: out = s[0];
			1: out = s[1];
			2: out = s[2];
			3: out = s[3];
			4: out = s[4];
			5: out = s[5];
			6: out = s[6];
			7: out = s[7];
		endcase
	end
	
endmodule