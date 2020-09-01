module clock_divider(rst, clk, clk1, clk2, clk3, clk4);
	input rst, clk;
	output reg clk1, clk2, clk3, clk4;
	
	reg [9:0] count, count1, count2, count3;

	always @(posedge clk, negedge rst) begin
	
	if (!rst) begin count<= 9'b000000000; clk1<= 0; end
	
	else if(count3 >= 100) begin
		count3 <= 9'b000000000; clk4 <= ~clk4;
		count = count + 1'b1;
		end
	
	else if(count2 >= 10) begin
		count2 <= 9'b000000000; clk3 <= ~clk3; count3 <= count3 + 1'b1;
		count <= count + 1'b1;	
		end
	
	else if(count1 >= 1000)begin
		count1 <= 9'b000000000; clk2 <= ~clk2; count2 <= count2 + 1'b1;
		count <= count + 1'b1;
		end
		
	else if(count >= 24) begin
		count <= 9'b000000000; clk1 <= ~clk1; count1 <= count1 + 1'b1; end
	
	else count <= count + 1'b1;
	
	end
	
endmodule