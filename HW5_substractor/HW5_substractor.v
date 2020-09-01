module HW5_substractor(A, B,Z, E, SumDiff, BinCarry);
	input A, B, Z, E;
	output SumDiff, BinCarry;
	reg SumDiff;
	reg BinCarry;
	
	always @(E)begin
		case(E)
			0:{BinCarry, SumDiff} = (Z + B + A) ;
			1:{SumDiff, BinCarry} = (A - B - Z) ;
		endcase
	end
endmodule
	