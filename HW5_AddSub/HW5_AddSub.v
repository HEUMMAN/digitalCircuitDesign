module HW5_AddSub (A, B, E, Sum, Carry);
	input [3:0] A, B;
	input E;
	output [3:0] Sum;
	output Carry;
	reg[3:0] Sum;
	reg Carry;
	
	always @(A or B or E)
	begin
		if(E)
			begin
				Sum = A - B;
			if(A<B)
				Carry = 1'b0;
			else
				Carry = 1'b1;
			end
		else
			begin
				Sum = A + B;
			if(A+B>5'b01111)
				Carry = 1'b1;
			else
				Carry = 1'b0;
			end
		end
endmodule