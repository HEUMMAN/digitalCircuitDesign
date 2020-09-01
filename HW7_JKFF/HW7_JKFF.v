module HW7_JKFF(j, k, reset, clk, q, qbar);
 input j, k, clk, reset;
 output q, qbar;
 Master Master1 (j, k, reset, clk, qx, qbarx);
 Master Slave1 (qx, qbarx, reset , ~clk, q, qbar);
endmodule

module Master(j, k, reset, clk, q, qbar);
 input j, k, reset, clk;
 output reg q, qbar;
 initial
  q = 0;
 always @(posedge clk) begin
  if(!reset) begin
   case(j)
		0: if (k == 0) begin q <= q; qbar <= qbar; end
			else begin q <= 0; qbar <= 1; end
		1: if (k == 1) begin q <= qbar; qbar <= q; end
			else begin q <= 1; qbar <= 0; end
	endcase
  end
  else begin
   q <= 1'bx;
	qbar <= 1'bx;
  end
 end
endmodule