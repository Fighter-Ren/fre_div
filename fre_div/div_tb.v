//****************************************
//Filename    : div_tb.v
//Author      : MaoRen
//Description : frequency divider test bench
//Created     :2019-12-31
//****************************************
module div_tb;

//clock reset
reg clk;
reg rst_n;//active low

//variables
wire clk_d2; //divided clock
wire clk_d3;
wire clk_d4;
wire clk_d5;
wire clk_d6;
wire clk_d7;
wire clk_d8;
wire clk_d9;
wire clk_d10;

//initial clock reset
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	rst_n = 1'b0;
	#10 rst_n = 1'b1;
end

//instance of fre_div module
fre_div #(.DIV_NUM (2)) u_fre_div1(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d2)
);
fre_div #(.DIV_NUM (3)) u_fre_div2(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d3)
);
fre_div #(.DIV_NUM (4)) u_fre_div3(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d4)
);
fre_div #(.DIV_NUM (5)) u_fre_div4(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d5)
);
fre_div #(.DIV_NUM (6)) u_fre_div5(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d6)
);
fre_div #(.DIV_NUM (7)) u_fre_div6(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d7)
);
fre_div #(.DIV_NUM (8)) u_fre_div7(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d8)
);
fre_div #(.DIV_NUM (9)) u_fre_div8(
	.clk   (clk   ),
	.rst_n (rst_n ),
	.clk_d (clk_d9)
);
fre_div #(.DIV_NUM (10)) u_fre_div9(
	.clk   (clk    ),
	.rst_n (rst_n  ),
	.clk_d (clk_d10)
);

endmodule