module HW9_counter(Q_60, Q_24, clk, rst);
	input clk, rst;
	output reg [5:0] Q_60;
	output reg [4:0] Q_24;
	
	always @(posedge clk or negedge rst)
	begin
		if(!rst) begin
			Q_60 <= 0; Q_24 <= 0;
		  		   end
		else begin
			  if(Q_60 == 59) begin
				  Q_60 <= 0;
				  if(Q_24 == 23)
					  Q_24 <= 0; 
				  else Q_24 <= Q_24 + 1; 
								  end
			  else Q_60 <= Q_60 + 1;
			  end
	end
endmodule


