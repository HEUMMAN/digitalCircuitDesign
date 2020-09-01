module counter(clk, CLR, Q, sw);
	input clk, CLR, sw;
	output [3:0] Q;
	wire q0bar, q1bar, q2bar, q3bar;
	
	JK_FF U0 (clk, CLR, 1, 1, Q[0], q0bar);
	JK_FF U1 (((sw==0)?Q[0]:q0bar), CLR, 1, 1, Q[1], q1bar);
	JK_FF U2 (((sw==0)?Q[1]:q1bar), CLR, 1, 1, Q[2], q2bar);
	JK_FF U3 (((sw==0)?Q[2]:q2bar), CLR, 1, 1, Q[3], q3bar);
endmodule


module JK_FF(clk, rst, j, k, Q, Qbar);
	input clk, rst, j, k;
	output reg Q;
	output Qbar;

	assign Qbar = ~Q;
	
	always @(negedge clk or negedge rst) begin
		if(!rst)
			Q <= 0;
		else begin
			case({j,k})
			2'b00 : Q <= Q;
			2'b01 : Q <= 1'b0;
			2'b10 : Q <= 1'b1;
			2'b11 : Q <= ~Q;
			default : Q <= 1'b0;
		endcase
		end
	end
endmodule