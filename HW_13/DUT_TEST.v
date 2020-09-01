module DUT_TEST(clk1,rst1,out1);

input clk1, rst1;
output reg out1;
reg [9:0] count;

initial begin 
	count = 0;
	out1 = 0;
end

always @(posedge clk1 or negedge rst1) begin

	if (!rst1)begin
		count <= 0;
		out1 <= 0;
	end

	else if(count >= 250) begin 
		count <= 0;
		out1 <= ~out1;
	end

	else
		count = count + 1;
	end
	
endmodule

`timescale 1ms/1ms


module DUT_TEST_tb();

reg clk, rst;
wire out;

DUT_TEST U1(clk,rst,out);

initial begin
	clk = 1'b0;
	#10 rst = 1'b1;
	#1000 $display("1sec");
	#2000 $display("2sec");
	#3000 $display("3sec");
	#4000 $display("4sec");
	#5000 $display("5sec");
	#6000 $display("6sec");
	#7000 $display("7sec");
	#8000 $display("8sec");
	#9000 $display("9sec");
	#10000 $display("10sec");
	#10100 $finish;
end

always begin
	#1 clk = 1'b0;
	#1 clk = 1'b1;
end

endmodule

